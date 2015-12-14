class ConventionsController < ApplicationController

  def edit
    @change_convention = Convention.find(params[:id])
  end

  def update
    @change_convention = Convention.find(params[:id])
  if  @change_convention.update_attributes(convention_params)
    redirect_to conventions_path
  else
    flash[:alert]="Pusty element"
    document.alert("pusty element")
    render 'edit'
  end
  end

  def show
    @convention = Convention.find(params[:id])
  end

  def index
    @all_conventions = Convention.all
  end

  def new
    @convention = Convention.new
  end

  def create
      convention = Convention.new(convention_params)
    if convention.save
      redirect_to conventions_path
    else
      flash[:alert]="Popełniony jest błąd"
      @convention = Convention.new
      render 'new'
    end
  end

  def destroy
    Convention.delete(params[:id])
    redirect_to conventions_path
  end

  def search
    @convention = Convention.where("name ~* ?", "#{params[:text]}[a-b]*")
  end

  def convention_params #umozliwia dostep do atrybutow stosowany do obrony danych przed innymi uzytkownikami
    params.require(:convention).permit(:name,:start,:end,:country,:level)
  end
end
