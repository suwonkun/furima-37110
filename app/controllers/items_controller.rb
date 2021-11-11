class ItemsController < ApplicationController
  before_action :authenticate_user!,except: [:index]
  def index
    @items = Item.all
  end
  def new
    @item = Item.new
  end
  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to new_item_path
    else
      render 'new'
    end
  end

  private
  
  def item_params
    params.require(:item).permit(:item_name,:explanation,:category_id,:status_id,:derivery_charge_id,:area_id,:days_to_ship_id,:price, :image).merge(user_id: current_user.id)
  end
end
  