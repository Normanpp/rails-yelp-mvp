class RestaurantsController < ApplicationController

  before_action :require_restaurant, only: [:show]

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save
    redirect_to restaurant_path(@restaurant)
  end

  def show
    ratings = @restaurant.reviews.pluck(:rating)
    ratings.size.positive? ? @rating = ratings.sum / ratings.size : @rating = 'nd'
  end

  def index
    @restaurants = Restaurant.all
  end

  private

  def require_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

end
