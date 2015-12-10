class GamesController < ApplicationController

  def edit
    @change_game = Game.find(params[:id])
  end

  def update
    @change_game = Game.find(params[:id])
    @change_game.update_attributes(game_params)
    redirect_to games_path
  end

  def show
    @game=Game.find(params[:id])
  end

  def index
    @all_games = Game.all
  end

  def new
    @new_game = Game.new
  end

  def create
    new_game = Game.new(game_params)
    new_game.save
    redirect_to root_path
  end

  def destroy
    Game.delete(params[:id])
    rediredt_to games_path
  end

  def game_params #umozliwia dostep do atrybutow stosowany do obrony danych przed innymi uzytkownikami
    params.require(:game).permit(:name,:number_players,:rate)
  end

end
