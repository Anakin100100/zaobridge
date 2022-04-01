class GameSetsController < ApplicationController
    before_action :authenticate_user!

    def index 
        @game_sets = GameSet.where(user_id: current_user.id)
    end

    def new 
        @game_set = GameSet.new
    end

    def show
        @game_set = GameSet.find(params[:id])
    end

    def destroy
        @game_set = GameSet.find(element.dataset["game_set-id"])
        @game_set.destroy
    end

    def create
        @game_set = current_user.game_sets.create(game_set_params)
        redirect_to game_sets_path
    end

    def game_set_params 
        params.require(:game_set).permit(:name)
    end
end
