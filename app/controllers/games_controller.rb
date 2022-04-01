class GamesController < ApplicationController
    def new 
        @game = Game.new
        @game.game_set_id = params[:game_set_id]
    end  

    def edit
        
    end

    def create
        @game = Game.new
        @game.game_set_id = params["game"]["game_set_id"]

        if params["game"]["vulnerable_ns"] == "0"
            @game.vulnerable_north_south = false
        elsif params["game"]["vulnerable_ns"] == "1"
            @game.vulnerable_north_south = true
        end

        if params["game"]["vulnerable_ew"] == "0"
            @game.vulnerable_east_west = false
        elsif params["game"]["vulnerable_ew"] == "1"
            @game.vulnerable_east_west = true
        end

        @game.dealer = params["game"]["dealer"]

        @game.north_cards = [
            params["game"]["n_spades"],
            params["game"]["n_hearts"],
            params["game"]["n_diamonds"],
            params["game"]["n_clubs"]
        ].join(", ")

        @game.south_cards = [
            params["game"]["s_spades"],
            params["game"]["s_hearts"],
            params["game"]["s_diamonds"],
            params["game"]["s_clubs"]
        ].join(", ")

        @game.east_cards = [
            params["game"]["e_spades"],
            params["game"]["e_hearts"],
            params["game"]["e_diamonds"],
            params["game"]["e_clubs"]
        ].join(", ")

        @game.west_cards = [
            params["game"]["w_spades"],
            params["game"]["w_hearts"],
            params["game"]["w_diamonds"],
            params["game"]["w_clubs"]
        ].join(", ")

        @game.save

        redirect_to game_set_path(@game.game_set_id)
    end

    def show

    end

    def destroy 
        debugger
        @game = Game.find(params[:id])
        game_set_id = @game.game_set_id
        @game.destroy 
        redirect_to game_set_path(game_set_id)
    end
end
