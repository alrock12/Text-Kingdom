class User < ActiveRecord::Base
  has_many :experiences
  has_many :games

  validates :username, presence: true, length: { minimum: 5, maximum: 50 }, uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+\.[a-z]+\z/i
  validates :email, presence:true , format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: {minimum: 8, maximum: 14}

  has_secure_password

  before_create :create_remember_token

  
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  ## search queries

  #returns count of how many times a game has been played
  scope :game_plays, -> { joins(:experiences).
                           group("experiences.game_id").
                           count }

  #returns ordered array of users based on number of plays of their games
  scope :author_plays, -> { joins(games: :experiences).
                            group("users.game_id.experiences.game_id").
                            order("count(users.game_id.experiences.game_id) DESC") }

  #returns ordered array of users based on number of plays
  scope :user_plays, -> { joins(:experiences).
                           group("experiences.user_id").
                           order("count(experiences.user_id) DESC") }

  private

    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end
end
