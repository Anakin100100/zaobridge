class GameSetsController < ApplicationController
    before_action :authenticate_user!

    def index 
        @game_sets = current_user.game_sets
    end

    def create
        @game_set = current_user.game_sets.create(game_set_params)
        redirect_to game_sets_path
    end

    def game_set_params 
        params.require(:game_set).permit(:name, game_files: [])
    end
    
end
