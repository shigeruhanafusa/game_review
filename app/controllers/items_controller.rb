class ItemsController < ApplicationController

  def index
    @items = Item.all
    @ratings = Rating.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :index
    end
  end

  def show
    @item = Item.find(params[:id])
    @like = Like.new()
    @ratings = @item.ratings.includes(:evaluation)
  end

  private

  def item_params
    params.require(:item).permit(:title, :text, :genre_id).merge(user_id: current_user.id)
  end
end
