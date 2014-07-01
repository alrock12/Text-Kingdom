class User < ActiveRecord::Base
  has_many :experiences
  has_many :games
  # has_and_belongs_to_many :users, :through :friends
  # has_many :recommendations

  # validates :username, presence: true, length: {minimum: 5}
  # validates :email, presence:true  #email validation?? regex?
  # validates :password, presence: true, length: {minimum: 8, maximum: 14}
end
