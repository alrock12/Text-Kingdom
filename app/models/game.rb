class Game < ActiveRecord::Base
  belongs_to :user
  has_many :experiences

  validates :user, presence: true
  validates :link, presence: true
  validates :description, presence: true
  validates :title, presence: true
  validates :genre, presence: true

  scope :games_week, -> { where(:created_at => 1.week.ago..Time.now).
                          joins(:experiences).
                          group("experiences.game_id").
                          order("count(experiences.game_id) DESC") }
 
 scope :games_year, -> { where(:created_at => 1.year.ago..Time.now).
                          joins(:experiences).
                          group("experiences.game_id").
                          order("count(experiences.game_id) DESC") }
  
end
