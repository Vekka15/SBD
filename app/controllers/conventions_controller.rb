class ConventionsController < ApplicationController

  def edit
    @change_convention = Convention.find(params[:id])
  end

  def update
    @change_convention = Convention.find(params[:id])
    if  @change_convention.update_attributes(convention_params)
      redirect_to conventions_path
    else
      render 'edit'
    end
  end

  def show
    @convention = Convention.find(params[:id])
  end

  def index
    @all_conventions = Convention.all
    @all_matches = Match.all
  end

  def new
    @convention = Convention.new
  end

  def create
      @convention = Convention.new(convention_params)
    if @convention.save
      redirect_to conventions_path
    else
      render 'new'
    end
  end

  def destroy
    if Convention.destroy(params[:id])
      redirect_to conventions_path
    else
      flash[:error]="Nie można usunąć - do konwentu należą mecze"
      redirect_to conventions_path
    end
  end

  def search
    @convention = Convention.where("name ~* ?", "#{params[:text]}[a-b]*")
    @all_matches= Match.all
  end

  def convention_params #umozliwia dostep do atrybutow stosowany do obrony danych przed innymi uzytkownikami
    params.require(:convention).permit(:name,:start,:end,:country,:level)
  end
end
