class ItemsController < ApplicationController
  before_action :authenticate_user!,except: [:index,:show]
  before_action :set_item, only: [:edit, :show,:update,:destroy]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end
  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  def show
  end

  def edit
    unless @item.user_id == current_user.id && @item.buy.blank?
      redirect_to action: :index
    end
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @item.destroy if current_user.id == @item.user.id
    redirect_to root_path
  end
 

  private
  
  def item_params
    params.require(:item).permit(:item_name,:explanation,:category_id,:status_id,:derivery_charge_id,:area_id,:days_to_ship_id,:price, :image).merge(user_id: current_user.id)
  end
  def set_item
    @item = Item.find(params[:id])
  end
end
  