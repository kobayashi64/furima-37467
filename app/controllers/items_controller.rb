class ItemsController < ApplicationController
  before_action :move_to_signed_in, only: [:edit, :new, :destroy]
  before_action :set_item, only: [:show, :edit, :update,:destroy]

  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    redirect_to root_path unless @item.user_id == current_user.id
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    if @item.user_id == current_user.id
      @item.destroy
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :product_name, :description, :price, :category_id, :condition_id, :delivery_charge_id,
                                 :prefecture_id, :days_to_ship_id).merge(user_id: current_user.id)
  end

  def move_to_signed_in
    redirect_to user_session_path unless user_signed_in?
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
