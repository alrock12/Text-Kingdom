class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.belongs_to :user
      t.belongs_to :game
      t.float :rating
      t.integer :progress
      
      t.timestamps
    end
  end
end
