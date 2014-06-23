class ReviewsController < ApplicationController

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant

    if @review.save
      flash[:notice] = "Success!"
      redirect_to "/restaurants/#{@review.restaurant_id}"

    elsif @review.rating.length == 0 || @review.body.length == 0
      flash[:notice] = "Body and Rating can't be blank."
      render template: "/restaurants/show"

    else
      flash.now[:notice] = "Your review couldn't be saved."
      render template: "/restaurants/show"
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body)
  end
end
