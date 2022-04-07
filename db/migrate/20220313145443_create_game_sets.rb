# frozen_string_literal: true

class CreateGameSets < ActiveRecord::Migration[7.0]
  def change
    create_table :game_sets do |t|
      t.string :name
      t.belongs_to :user
      t.timestamps
    end
  end
end
