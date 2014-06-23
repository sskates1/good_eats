class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.order(created_at: :desc)
  end

  def home
    @restaurants = Restaurant.order(created_at: :desc).limit(10)
    render :index
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
      flash[:notice] = "Success!"
      redirect_to '/restaurants'
    else
      flash.now[:notice] = "Your restaurant couldn't be saved."
      render :new
    end
  end


  private

  def restaurant_params
    params.require(:restaurant).permit(:name,:address, :city, :state, :zip, :description, :category)
  end
end
