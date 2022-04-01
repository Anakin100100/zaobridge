class CounterReflex < ApplicationReflex
  delegate :current_user, to: :connection

  def delete_game_set
    @game_set = GameSet.find(element.dataset["game_set-id"])
    @game_set.destroy
    @game_sets = GameSet.where(user_id: current_user.id)
    morph "#main_content", render(partial: "game_sets/game_sets", locals: { game_sets: @game_sets })
  end

  def delete_game 
    @game = Game.find(element.dataset["game-id"])
    @game_set = @game.game_set
    @game.destroy
    morph "#main_content", render(partial: "game_sets/show", locals: { game_set: @game_set })
  end
end
