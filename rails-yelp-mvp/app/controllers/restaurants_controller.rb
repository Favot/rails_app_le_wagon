class RestaurantsController < ApplicationController
  before_action :set_restaurants, only: %i[index]
  before_action :set_restaurant, only: %i[show]

  def index; end

  def show; end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

  def set_restaurants
    @restaurants = Restaurant.all
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
