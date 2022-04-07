# frozen_string_literal: true

FactoryBot.define do
  factory :game_set do
    name { Faker::Beer.name }
    user { create(:user) }
  end
end
