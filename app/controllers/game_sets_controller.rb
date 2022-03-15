class GameSetsController < ApplicationController
    before_action :authenticate_user!

    def index 
        @game_sets = current_user.game_sets
    end
end
