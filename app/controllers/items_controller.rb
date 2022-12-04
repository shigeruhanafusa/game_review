class ItemsController < ApplicationController
  def index
    @items = Item.all
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

  private

  def item_params
    params.permit(:title).merge(user_id: current_user.id)
  end

end
