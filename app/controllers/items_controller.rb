class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :name, :comment, :image, :category_id, :status_id, :delivery_fee_id, :shipping_origin_id, :shipping_date_id, :price
    ).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
