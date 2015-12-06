class ParticipationsController < ApplicationController
  def new
    @new_participation = Participation.new
    @player = Player.find(params[:player_id])
  end

  def create
    participation = Participation.new(participation_params)
    participation.player_id=params[:player_id]
    participation.save
    redirect_to root_path
  end

  def participation_params
    params.require(:participation).permit(:match_id)
  end
end
