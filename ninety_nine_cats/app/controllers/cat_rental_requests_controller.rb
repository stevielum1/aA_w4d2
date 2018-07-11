class CatRentalRequestsController < ApplicationController
  
  def index
    @requests = CatRentalRequest.all
    render :index
  end
  
  # def show
  #   @request = CatRentalRequest.find_by(id: params[:id])
  #   render :show
  # end
  
  def new
    @cats = Cat.all
    render :new
  end
  
  def create
    @request = CatRentalRequest.new(cat_rental_params)
    if @request.save
      redirect_to cat_url(@request.cat_id)
    else
      render json: @request.errors.full_messages, status: 422
    end
  end
  
  def cat_rental_params
    params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date)
  end
end