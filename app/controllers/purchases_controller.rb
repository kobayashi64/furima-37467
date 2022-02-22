class PurchasesController < ApplicationController
  before_action :move_to_signed_in, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    @purchase_delivery = PurchaseDelivery.new

    redirect_to root_path if @item.purchase.present?

    redirect_to root_path if current_user.id == @item.user_id
  end

  def create
    @item = Item.find(params[:item_id])
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
    redirect_to root_path unless user_signed_in?
  end

  def pay_itmem
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: @purchase_delivery.token,
      currency: 'jpy'
    )
  end
end
