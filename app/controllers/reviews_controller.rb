class ReviewsController < ApplicationController
before_action :set_restaurant, only: [:new, :create]
# we need @restaurant in our `simple_form_for`
  def new
    @review = Review.new
  end

def create
  @review = Review.new(review_params)
  @review.restaurant = @restaurant
  if @review.save
    redirect_to restaurant_path(@restaurant)
  else
    render :new
  end
end

private

def set_restaurant
  @restaurant = Restaurant.find(params[:restaurant_id])
  # localhost3000/restaurants/restaurantId
end

def review_params
  params.require(:review).permit(:rating, :content)
end
end
