class RestrauntsController < ApplicationController

  def create
    @restraunt = Restraunt.find(params[:restruant_id])
    @review = Review.new(review_params)
    @review.restraunt = @restraunt

    if @review.save
      flash[:notice] = "Success!"
      redirect_to "/restraunts/#{@review.restruant_id}"

    elsif @review.rating.length == 0 || @review.body.length == 0
      flash[:notice] = "Body and Rating can't be blank."
      render template: "/restraunts/show"

    else
      flash.now[:notice] = "Your review couldn't be saved."
      render template: "/restraunts/show"
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body)
  end
end
