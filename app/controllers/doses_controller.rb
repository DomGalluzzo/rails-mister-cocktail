class DosesController < ApplicationController

  before_action :find_cocktail_id, only: %i[create new]

  def index
    @doses = Dose.all
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail

    if @dose.save
      redirect_to @dose.cocktail
    else
      render :new
    end
  end

  def new
    @dose = Dose.new
  end

  def destroy
    @dose = dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path
  end

  private

  def find_cocktail_id
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

end
