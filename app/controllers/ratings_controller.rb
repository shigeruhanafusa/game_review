class RatingsController < ApplicationController
  
  def create
    @item = Item.find(params[:item_id])
    @rating = Rating.new(rating_params)
    if @rating.valid?
      @rating.save
      redirect_to item_path(@item[:id])
    else
      render :new
    end
  end

  private

  def rating_params
    params.permit(:evaluation).merge(item_id: params[:item_id])
  end
end
