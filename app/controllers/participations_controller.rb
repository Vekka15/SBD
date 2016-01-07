#zrobic zeby tworzyło się normalnie tak jak kazy inny obiekt żeby routy nie były zależne od graczy
#zastanowic sie czy zrobic uczestnictwa u gracza do edycji czy tylko do wyswietlania
#póki co mozna zostawic tak jak jest
#w przypadku reszty najlepiej narazie zrobic tylko wyswietlanie powiazanych obiektów
class ParticipationsController < ApplicationController

  def edit
    @change_participation = Participation.find(params[:id])
  end

  def update
    @change_participation = Participation.find(params[:id])
    if  @change_participation.update_attributes(participation_params)
      redirect_to participations_path
    else
      render 'edit'
    end
  end

  def show
    @participation = Participation.find(params[:id])
  end
#dodac tez wypisywanie wszystkich dostepnych uczestnictw
  def index
      @all_participation = Participation.all
      if params[:player_id]!=nil
        @player= Player.find(params[:player_id])
      else
        @player=nil
      end
  end

  def new
    @new_participation = Participation.new
  end
# niech wybiera z dostepnych za pomoca radio buttona wypisujemy wszystkie rozgrywki jakie sa i gracz sobie wybiera ten interesujacy go
  def create
      #numer= params[:participation][:match_id]
      @new_participation = Participation.new(participation_params)
      if @new_participation.save
      number_of_players = Participation.count(numer)
      number_of_seats = Match.find(numer).seats_number
      if number_of_players < number_of_seats
        @new_participation = Participation.new(participation_params)
        @new_participation.save
        redirect_to participations_path
      else
        #@player = Player.find(params[:player_id])
        render 'new'
      end
    else
      #@player = Player.find(params[:player_id])
      render 'new'
  end
  end

  def destroy
    Participation.delete(params[:id])
    redirect_to root_path
  end

  def participation_params
    params.require(:participation).permit(:player_id,:match_id)
  end
end
