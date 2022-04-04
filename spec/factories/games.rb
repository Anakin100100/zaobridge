FactoryBot.define do
  factory :game do
    north_cards { "2H 3H 4H 5H 6H" }
    east_cards { "2S 3S 4S 5S 6S" }
    west_cards { "2D 3D 4D 5D 6D" }
    south_cards { "2C 3C 4C 5C 6C" }
    vulnerable_north_south { false }
    vulnerable_east_west { true }
    dealer { "N" }
  end
end
