class GamesController < ApplicationController

  def edit
    @change_game = Game.find(params[:id])
  end

  def update
    @change_game = Game.find(params[:id])
    if @change_game.update_attributes(game_params)
      redirect_to games_path
    else
      render 'edit'
    end
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
    @new_game = Game.new(game_params)
    if  @new_game.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    if Match.find_by_game_id(params[:id]) == nil
      Game.delete(params[:id])
      redirect_to games_path
    else
      @all_games = Game.all
      flash[:error]="Z tej gry korzystają jakieś rozgrywki."
      render 'index'
    end
  end

  def search
    @game = Game.where("name ~* ?", "#{params[:text]}[a-b]*")
  end

  def game_params #umozliwia dostep do atrybutow stosowany do obrony danych przed innymi uzytkownikami
    params.require(:game).permit(:name,:time,:number_players,:rate)
  end

end
