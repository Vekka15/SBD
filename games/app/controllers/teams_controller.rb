class TeamsController < ApplicationController
  def index
    @all_team = Team.all
    @all_player = Player.all
  end

  def new
    @new_team = Team.new
  end

  def create
    new_team = Team.new(team_params)
    new_team.save
    redirect_to root_path
  end

  def team_params #umozliwia dostep do atrybutow stosowany do obrony danych przed innymi uzytkownikami
    params.require(:team).permit(:name,:city,:symbol,:level)
  end

end
