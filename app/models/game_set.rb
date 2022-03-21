class GameSet < ApplicationRecord
    has_many :games, dependent: :destroy
    belongs_to :user

    has_many_attached :game_files
end
