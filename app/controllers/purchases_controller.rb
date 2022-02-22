class PurchasesController < ApplicationController
  before_action :move_to_signed_in, only: [:index]
  before_action :set_item, only:[:index,:create]

  def index
    @purchase_delivery = PurchaseDelivery.new

    if @item.purchase.present?
      redirect_to root_path 
      return
    end

    redirect_to root_path if current_user.id == @item.user_id
  end

  def create
    @purchase_delivery = PurchaseDelivery.new(purchase_params)

    if @purchase_delivery.valid?
      pay_itmem
      @purchase_delivery.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_delivery).permit(:post_code, :prefecture_id, :city, :address, :building_name, :telephone_number).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  def move_to_signed_in
    redirect_to user_session_path unless user_signed_in?
  end

  def pay_itmem
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: @purchase_delivery.token,
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
