class CocktailsController < ApplicationController

  before_action :find_cocktail_id, only: %i[edit show destroy]

  def index
    @cocktails = Cocktail.all
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)

    if @cocktail.save
      redirect_to @cocktail
    else
      render :new
    end
  end

  def new
    @cocktail = Cocktail.new
  end

  def edit
  end

  def show
  end


  def destroy
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def find_cocktail_id
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
