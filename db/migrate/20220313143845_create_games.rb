class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.text :content
      t.belongs_to :game_set
      t.timestamps
    end
  end
end
