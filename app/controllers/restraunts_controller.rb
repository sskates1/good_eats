class RestruantsController < ApplicationController
  def index
    @restruants = Restrant.order(:created_at).limit(10)
  end

  def show
    @restruant = Restrant.find(params[:id])
    @review = Review.new
  end

  def new
    @restruant = Restrant.new
  end

  def create
    @restruant = Restrant.new(restraunt_params)

    if @restruant.save
      flash[:notice] = "Success!"
      redirect_to '/restruants'
    else
      flash.now[:notice] = "Your restruant couldn't be saved."
      render :new
    end
  end


  private

  def restraunt_params
    params.require(:restruant).permit(:address, :city, :state, :zip, :description, :catagory)
  end
end
