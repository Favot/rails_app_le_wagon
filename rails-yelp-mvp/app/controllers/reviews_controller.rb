class ReviewsController < ApplicationController
  before_action :set_reviews, only: %i[index]
  before_action :set_review, only: %i[show]

  def index; end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new # needed to instantiate the form_for
  end

  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant

    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end

    # no need for app/views/reviews/create.html.erb
  end

  def show; end

  private

  def review_params
    params.require(:review).permit(:name, :rating, :content, :restaurant_id)
  end

  def set_reviews
    @reviews = Review.all
  end

  def set_review
    @review = Review.find(params[:id])
  end
end
