class DosesController < ApplicationController
  before_action :set_dose, only: %i[show index]

  # GET /doses or /doses.json
  def index
    @doses = Dose.all
  end

  # GET /doses/1 or /doses/1.json
  def show; end

  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail

    if @dose.save!
      redirect_to \(@cocktail)
    else
      render 'cocktails/show'
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_dose
    @dose = Dose.find(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
  # Only allow a list of trusted parameters through.
end
