class PlayersController < ApplicationController
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

  def player_params #umozliwia dostep do atrybutow stosowany do obrony danych przed innymi uzytkownikami
    params.require(:player).permit(:nickname,:name,:surname,:age)
  end

  def team_name
    params.require(:player).permit(:team_name)
  end
end
