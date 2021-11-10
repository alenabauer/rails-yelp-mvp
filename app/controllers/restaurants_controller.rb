class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all.sort_by { |hash| hash[:name] }
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @review = Review.new
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant.id)
    else
      render :new
    end
  end

  def reviews
    @restaurant = Restaurant.find(params[:id])
    @review = Review.new(review_params)
    @review.restaurant_id = @restaurant.id
    if @review.save
      redirect_to restaurant_path(@restaurant.id)
    else
      render :show
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category, :phone_number)
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
