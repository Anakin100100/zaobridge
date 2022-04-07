# frozen_string_literal: true

class Game < ApplicationRecord
  belongs_to :game_set

  def show
    {
      "north" => Hash[["spades", "hearts", "diamonds", "clubs"].zip self.north_cards.split(', ').map { |cards| cards.strip}],
      "east" => Hash[["spades", "hearts", "diamonds", "clubs"].zip self.east_cards.split(', ').map { |cards| cards.strip}],
      "south" => Hash[["spades", "hearts", "diamonds", "clubs"].zip self.south_cards.split(', ').map { |cards| cards.strip}],
      "west" => Hash[["spades", "hearts", "diamonds", "clubs"].zip self.west_cards.split(', ').map { |cards| cards.strip}]
    }
  end
end
