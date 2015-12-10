class PlayersController < ApplicationController

  def edit
    @change_player = Player.find(params[:id])
  end

  def update
    @change_player = Player.find(params[:id])
    @change_player.update_attributes(player_params)
    redirect_to players_path
  end

  def show
    @player = Player.find(params[:id])
  end

  def index
    @all_player = Player.all
  end

  def new
    @new_player = Player.new
  end

  def create
    new_player= Player.new(player_params)
    team=Team.find_by_name(params[:player][:team_name])
    new_player.team_id=team.id
    new_player.save
    redirect_to root_path
  end

  def destroy
    Player.delete(params[:id])
    redirect_to players_path
  end

  def player_params #umozliwia dostep do atrybutow stosowany do obrony danych przed innymi uzytkownikami
    params.require(:player).permit(:nickname,:name,:surname,:age)
  end

  def team_name
    params.require(:player).permit(:team_name)
  end
end
