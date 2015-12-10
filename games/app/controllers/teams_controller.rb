class TeamsController < ApplicationController

  def edit
    @change_team = Team.find(params[:id])
  end

  def update
    @change_team = Team.find(params[:id])
    @change_team.update_attributes(team_params)
    redirect_to teams_path
  end

  def show
    @team = Team.find(params[:id])
  end

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

  def destroy
    Team.delete(params[:id])
    redirect_to teams_path
  end

  def team_params #umozliwia dostep do atrybutow stosowany do obrony danych przed innymi uzytkownikami
    params.require(:team).permit(:name,:city,:symbol,:level)
  end

end
