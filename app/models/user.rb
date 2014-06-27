class User < ActiveRecord::Base
  has_many :experiences
  has_many :games
  # has_and_belongs_to_many :users, :through :friends
  # has_many :recommendations
end
