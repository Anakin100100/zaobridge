class CounterReflex < ApplicationReflex
  def increment
    @count = element.dataset[:count].to_i + element.dataset[:step].to_i
  end

  def render_new_game_set
    morph "#main_content", render(partial: "game_sets/new_game_set")
  end

  def render_2
    morph "#main_content", render(partial: "game_sets/partial2")
  end

  def render_3
    morph "#main_content", render(partial: "game_sets/partial3")
  end

  def render_4
    morph "#main_content", render(partial: "game_sets/partial4")
  end
end
