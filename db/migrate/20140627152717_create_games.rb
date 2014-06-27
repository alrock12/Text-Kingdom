class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.string :link
      t.text :description
      t.string :genre
      t.belongs_to :user

      t.timestamps
    end
  end
end
