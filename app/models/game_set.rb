# frozen_string_literal: true

class GameSet < ApplicationRecord
  has_many :games, dependent: :destroy
  belongs_to :user
end
