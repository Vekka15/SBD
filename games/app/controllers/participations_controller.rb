class ParticipationsController < ApplicationController

  def show
    @participation = Participation.find(params[:id])
  end

  def index
    @all_participation = Participation.all
    @player= Player.find(params[:player_id])
  end

  def new
    @new_participation = Participation.new
    @player = Player.find(params[:player_id])
  end

  def create
      numer= params[:participation][:match_id]
      number_of_players = Participation.count(numer)
      number_of_seats = Match.find(numer).seats_number
    if number_of_players < number_of_seats
      participation = Participation.new(participation_params)
      participation.player_id=params[:player_id]
      participation.save
      redirect_to root_path
    else
      @player = Player.find(params[:player_id])
      flash[:error]="Too many players"
      redirect_to new_player_participation_path(@player)
    end
  end

  def destroy
    Participation.delete(params[:id])
    redirect_to root_path
  end

  def participation_params
    params.require(:participation).permit(:match_id)
  end
end
