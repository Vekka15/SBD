class ParticipationsController < ApplicationController
  def new
    @new_participation = Participation.new
  end

  def create
    participation = Participation.new(participation_params)
    participation.save
    redirect_to root_path
  end

  def participation_params
    params.require(:participation).permit(:match_id,:player_id)
  end
end
