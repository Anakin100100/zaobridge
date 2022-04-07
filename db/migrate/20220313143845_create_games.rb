# frozen_string_literal: true

class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.belongs_to :game_set
      t.string :north_cards
      t.string :east_cards
      t.string :south_cards
      t.string :west_cards
      t.boolean :vulnerable_north_south
      t.boolean :vulnerable_east_west
      t.string :dealer
      t.timestamps
    end
  end
end
