class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
    @item = Item.order('created_at DESC')
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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to item_path
  end

  private

  def item_params
    params.require(:item).permit(
      :name, :comment, :image, :category_id, :status_id, :delivery_fee_id, :shipping_origin_id, :shipping_date_id, :price
    ).merge(user_id: current_user.id)
  end
end
