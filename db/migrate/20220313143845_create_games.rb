class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      #Identification
      t.string :event
      t.string :site
      t.datetime :date
      t.string :board
      t.string :west_player
      t.string :north_player
      t.string :east_player
      t.string :south_player
      t.string :vulnerable, null: false  
      t.string :deal, null: false
      t.string :scoring
      t.string :declarer, null: false
      t.string :contract
      t.string :result
      #Auction
      t.string :auction 
      t.text :auction_notes
      #Play
      t.string :play
      #Supplemental sections
      t.text :general_notes


      t.belongs_to :game_set
      t.timestamps
    end
  end
end
