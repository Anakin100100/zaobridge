# frozen_string_literal: true

class GamesController < ApplicationController
  def new
    @game = Game.new
    @game.game_set_id = params[:game_set_id]
  end

  def edit
   @game = Game.find(params[:id])
   @data = @game.show
  end

  def create
    @game = Game.new
    @game.game_set_id = params['game']['game_set_id']

    case params['game']['vulnerable_ns']
    when '0'
      @game.vulnerable_north_south = false
    when '1'
      @game.vulnerable_north_south = true
    end

    case params['game']['vulnerable_ew']
    when '0'
      @game.vulnerable_east_west = false
    when '1'
      @game.vulnerable_east_west = true
    end

    @game.dealer = params['game']['dealer']

    @game.north_cards = [
      params['game']['n_spades'],
      params['game']['n_hearts'],
      params['game']['n_diamonds'],
      params['game']['n_clubs']
    ].join(', ')

    @game.south_cards = [
      params['game']['s_spades'],
      params['game']['s_hearts'],
      params['game']['s_diamonds'],
      params['game']['s_clubs']
    ].join(', ')

    @game.east_cards = [
      params['game']['e_spades'],
      params['game']['e_hearts'],
      params['game']['e_diamonds'],
      params['game']['e_clubs']
    ].join(', ')

    @game.west_cards = [
      params['game']['w_spades'],
      params['game']['w_hearts'],
      params['game']['w_diamonds'],
      params['game']['w_clubs']
    ].join(', ')

    @game.save

    @errors = []
    
    spades = params["game"]["w_spades"].split(' ') + params["game"]["e_spades"].split(' ') + params["game"]["n_spades"].split(' ') + params["game"]["s_spades"].split(' ')
    if spades.uniq.size != 13
      @errors << "You have to have 13 unique spades in all hands, you have #{spades.uniq.size} unique spades and #{spades.size} total spades"
    end


    hearts = params["game"]["w_hearts"].split(' ') + params["game"]["e_hearts"].split(' ') + params["game"]["n_hearts"].split(' ') + params["game"]["s_hearts"].split(' ')
    if hearts.uniq.size != 13
      @errors << "You have to have 13 unique hearts in all hands, you have #{hearts.uniq.size} unique hearts and #{hearts.size} total hearts"
    end

    diamonds = params["game"]["w_diamonds"].split(' ') + params["game"]["e_diamonds"].split(' ') + params["game"]["n_diamonds"].split(' ') + params["game"]["s_diamonds"].split(' ')
    if diamonds.uniq.size != 13
      @errors << "You have to have 13 unique diamonds in all hands, you have #{diamonds.uniq.size} unique diamonds and #{diamonds.size} total diamonds"
    end

    clubs = params["game"]["w_clubs"].split(' ') + params["game"]["e_clubs"].split(' ') + params["game"]["n_clubs"].split(' ') + params["game"]["s_clubs"].split(' ')
    if clubs.uniq.size != 13
      @errors << "You have to have 13 unique clubs in all hands, you have #{clubs.uniq.size} unique clubs and #{clubs.size} total clubs"
    end

    east  = params["game"]["e_spades"].split(' ') + params["game"]["e_hearts"].split(' ') + params["game"]["e_diamonds"].split(' ') + params["game"]["e_clubs"].split(' ')
    if east.size != 13
      @errors << "You have to have 13 cards in the east hand, you have #{east.size} cards"
    end

    west = params["game"]["w_spades"].split(' ') + params["game"]["w_hearts"].split(' ') + params["game"]["w_diamonds"].split(' ') + params["game"]["w_clubs"].split(' ')
    if west.size != 13
      @errors << "You have to have 13 cards in the west hand, you have #{west.size} cards"
    end

    north = params["game"]["n_spades"].split(' ') + params["game"]["n_hearts"].split(' ') + params["game"]["n_diamonds"].split(' ') + params["game"]["n_clubs"].split(' ')
    if north.size != 13 
      @errors << "You have to have 13 cards in the north hand, you have #{north.size} cards"
    end

    south = params["game"]["s_spades"].split(' ') + params["game"]["s_hearts"].split(' ') + params["game"]["s_diamonds"].split(' ') + params["game"]["s_clubs"].split(' ')
    if south.size != 13
      @errors << "You have to have 13 cards in the south hand, you have #{south.size} cards"
    end


    if @errors.size > 0
      session[:errors_game_id] = @game.id 
      session[:errors_game_messages] = @errors
      redirect_to edit_game_path(@game) and return
    else 
      session[:errors_game_id] = nil
      session[:errors_game_messages] = nil
    end

    redirect_to game_set_path(@game.game_set_id)
  end

  def update 
    @game = Game.find(params["id"])

    @errors = []
    
    spades = params["game"]["w_spades"].split(' ') + params["game"]["e_spades"].split(' ') + params["game"]["n_spades"].split(' ') + params["game"]["s_spades"].split(' ')
    if spades.uniq.size != 13
      @errors << "You have to have 13 unique spades in all hands, you have #{spades.uniq.size} unique spades and #{spades.size} total spades"
    end


    hearts = params["game"]["w_hearts"].split(' ') + params["game"]["e_hearts"].split(' ') + params["game"]["n_hearts"].split(' ') + params["game"]["s_hearts"].split(' ')
    if hearts.uniq.size != 13
      @errors << "You have to have 13 unique hearts in all hands, you have #{hearts.uniq.size} unique hearts and #{hearts.size} total hearts"
    end

    diamonds = params["game"]["w_diamonds"].split(' ') + params["game"]["e_diamonds"].split(' ') + params["game"]["n_diamonds"].split(' ') + params["game"]["s_diamonds"].split(' ')
    if diamonds.uniq.size != 13
      @errors << "You have to have 13 unique diamonds in all hands, you have #{diamonds.uniq.size} unique diamonds and #{diamonds.size} total diamonds"
    end

    clubs = params["game"]["w_clubs"].split(' ') + params["game"]["e_clubs"].split(' ') + params["game"]["n_clubs"].split(' ') + params["game"]["s_clubs"].split(' ')
    if clubs.uniq.size != 13
      @errors << "You have to have 13 unique clubs in all hands, you have #{clubs.uniq.size} unique clubs and #{clubs.size} total clubs"
    end

    east  = params["game"]["e_spades"].split(' ') + params["game"]["e_hearts"].split(' ') + params["game"]["e_diamonds"].split(' ') + params["game"]["e_clubs"].split(' ')
    if east.size != 13
      @errors << "You have to have 13 cards in the east hand, you have #{east.size} cards"
    end

    west = params["game"]["w_spades"].split(' ') + params["game"]["w_hearts"].split(' ') + params["game"]["w_diamonds"].split(' ') + params["game"]["w_clubs"].split(' ')
    if west.size != 13
      @errors << "You have to have 13 cards in the west hand, you have #{west.size} cards"
    end

    north = params["game"]["n_spades"].split(' ') + params["game"]["n_hearts"].split(' ') + params["game"]["n_diamonds"].split(' ') + params["game"]["n_clubs"].split(' ')
    if north.size != 13 
      @errors << "You have to have 13 cards in the north hand, you have #{north.size} cards"
    end

    south = params["game"]["s_spades"].split(' ') + params["game"]["s_hearts"].split(' ') + params["game"]["s_diamonds"].split(' ') + params["game"]["s_clubs"].split(' ')
    if south.size != 13
      @errors << "You have to have 13 cards in the south hand, you have #{south.size} cards"
    end


    if @errors.size > 0
      session[:errors_game_id] = @game.id 
      session[:errors_game_messages] = @errors
      redirect_to edit_game_path(@game) and return
    else 
      session[:errors_game_id] = nil
      session[:errors_game_messages] = nil
    end

    case params['game']['vulnerable_ns']
    when '0'
      @game.vulnerable_north_south = false
    when '1'
      @game.vulnerable_north_south = true
    end

    case params['game']['vulnerable_ew']
    when '0'
      @game.vulnerable_east_west = false
    when '1'
      @game.vulnerable_east_west = true
    end

    @game.dealer = params['game']['dealer']

    @game.north_cards = [
      params['game']['n_spades'],
      params['game']['n_hearts'],
      params['game']['n_diamonds'],
      params['game']['n_clubs']
    ].join(', ')

    @game.south_cards = [
      params['game']['s_spades'],
      params['game']['s_hearts'],
      params['game']['s_diamonds'],
      params['game']['s_clubs']
    ].join(', ')

    @game.east_cards = [
      params['game']['e_spades'],
      params['game']['e_hearts'],
      params['game']['e_diamonds'],
      params['game']['e_clubs']
    ].join(', ')

    @game.west_cards = [
      params['game']['w_spades'],
      params['game']['w_hearts'],
      params['game']['w_diamonds'],
      params['game']['w_clubs']
    ].join(', ')

    @game.save

    redirect_to game_set_path(@game.game_set_id)
  end

  def show; end

  def destroy
    @game = Game.find(params[:id])
    game_set_id = @game.game_set_id
    @game.destroy
    redirect_to game_set_path(game_set_id)
  end
end
