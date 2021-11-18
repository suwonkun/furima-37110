class BuysController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index,:create]
  def index
    if @item.user_id == current_user.id || @item.buy.present? 
      redirect_to root_path
    end
    @buyer_address = BuyerAddress.new
  end

 
  def create
    @buyer_address = BuyerAddress.new(buy_params)
    if @buyer_address.valid?
      pay_item
      @buyer_address.save
      redirect_to root_path
    else
      render 'index'
    end
  end
  
  private
  
  def buy_params
    params.permit(:postal_code, :area_id, :municipalities, :address, :building_name,:telephone_number,:token,:item_id ).merge(user_id: current_user.id)
  end

  def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  Payjp::Charge.create(
    amount: @item[:price],
    card: buy_params[:token],    
    currency: 'jpy'                 
  )
  end
  def set_item
    @item = Item.find(params[:item_id])
   end

end
