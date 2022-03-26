class GameSetsController < ApplicationController
    before_action :authenticate_user!

    def index 
    end

    def create
        @game_set = current_user.game_sets.create(game_set_params)
        @game_set.game_files.each do |game_file|
            data = game_file.download 
            
        end
        redirect_to game_sets_path
    end

    def game_set_params 
        params.require(:game_set).permit(:name, game_files: [])
    end
    
    def delete
        @game_set = GameSet.find(params[:id])
        @game_set.destroy
    end
end
