class PlayersController < ApplicationController

  def edit
    @change_player = Player.find(params[:id])
    @change_player.team_name = Team.find(@change_player.team_id).name
  end

  def update
    @change_player = Player.find(params[:id])
    if @change_player.update_attributes(player_params)
      redirect_to players_path
    else
      flash[:alert]="Failed editing"
      render 'edit'
    end
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
    if params[:player][:team_name]!=""
      team=Team.find_by_name(params[:player][:team_name])
      new_player.team_id=team.id
      if new_player.save
        redirect_to players_path
      else
        flash[:alert]="Failed creating"
        @new_player=Player.new
        render 'new'
      end
    else
      flash[:alert]="Failed creating"
      @new_player=Player.new
      render 'new'
    end
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
