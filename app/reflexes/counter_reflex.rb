class CounterReflex < ApplicationReflex
  delegate :current_user, to: :connection

  def render_new_game_set
    morph "#main_content", render(partial: "game_sets/new_game_set")
  end

  def render_game_sets
    morph "#main_content", render(partial: "game_sets/game_sets")
  end

  def render_3
    morph "#main_content", render(partial: "game_sets/partial3")
  end

  def render_4
    morph "#main_content", render(partial: "game_sets/partial4")
  end
end
