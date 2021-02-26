class IngredientsController < ApplicationController
  before_action :set_ingredient, only: %i[show edit update destroy]

  # GET /ingredients or /ingredients.json
  def index
    @ingredients = Ingredient.all
  end

  # GET /ingredients/1 or /ingredients/1.json
  def show; end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(@ingredient_params)

    if @ingredient.save!
      redirect_to @ingredient
    else
      render :new
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  # Only allow a list of trusted parameters through.

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
