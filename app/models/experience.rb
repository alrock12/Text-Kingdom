class Experience < ActiveRecord::Base
  belongs_to :user
  belongs_to :game

  validates :user, presence: true
  validates :game, presence: true
  validates :progress, presence: true
  validates :rating, presence: true
  
end
