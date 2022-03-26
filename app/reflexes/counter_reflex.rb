class CounterReflex < ApplicationReflex
  delegate :current_user, to: :connection

  def render_new_game_set
    @game_set = GameSet.new
    morph "#main_content", render(partial: "game_sets/new_game_set", locals: { game_set: @game_set })
  end

  def render_game_sets
    morph "#main_content", render(partial: "game_sets/game_sets")
  end

  def delete_game_set
    @game_set = GameSet.find(element.dataset["game_set-id"])
    @game_set.destroy
    morph "#main_content", render(partial: "game_sets/game_sets")
  end

  def edit_game_set
    @game_set = GameSet.find(element.dataset["game_set-id"])
    morph "#main_content", render(partial: "game_sets/edit_game_set", locals: { game_set: @game_set })
  end

  def show_game_set
    @game_set = GameSet.find(element.dataset["game_set-id"])
    morph "#main_content", render(partial: "game_sets/show_game_set", locals: { game_set: @game_set })
  end

  def render_3
    morph "#main_content", render(partial: "game_sets/partial3")
  end

  def render_4
    morph "#main_content", render(partial: "game_sets/partial4")
  end
end
