class LikesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @item = Item.find(params[:item_id])

    @like = Like.new(
      item_id: params[:item_id],
      user_id: current_user.id
    )

    if @like.save
      redirect_to item_path(@item)
    else
      render template: "items/show"
    end
  end

  def destroy
    @like = Like.find_by(item_id: params[:item_id], user_id: current_user.id)
    @like.destroy
    redirect_to item_path(params[:item_id])
  end

  private

  def like_params
    params.require(:like).permit(:item_id, :user_id)
  end

end
