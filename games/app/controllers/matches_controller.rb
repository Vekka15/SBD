class MatchesController < ApplicationController
  def index
    @all_matches = Match.all
  end

  def new
    @match = Match.new
  end

  def create
    match = Match.new(match_params)
    match.save
    redirect_to root_path
  end

  def match_params
    params.require(:match).permit(:time,:seats_number,:price,:game_id,:convention_id)
  end
end
