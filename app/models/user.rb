class User < ActiveRecord::Base
  has_many :experiences
  has_many :games

  validates :username, presence: true, length: { minimum: 5, maximum: 50 }, uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+\.[a-z]+\z/i
  validates :email, presence:true , format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: {minimum: 8, maximum: 14}

  has_secure_password

  before_create :create_remember_token

  scope :top_authors, -> { select("users.id, count(games.id) AS games_count").order("games_count DESC") }

  scope :top_players, -> { select("users.id, count(experiences.id) AS experience_count").order("experience_count DESC") }

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end
end
