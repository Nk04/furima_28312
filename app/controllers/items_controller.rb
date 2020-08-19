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
    begin
      @item.save
    rescue StandardError
      render :new
    end
    redirect_to root_path
  end

  def show
  end

  def edit
  end

  def update
    begin
      @item.update(item_params)
    rescue StandardError
      render :edit
    end
    redirect_to item_path
  end

  def destroy
    begin
      @item.destroy
    rescue StandardError
      render :edit
    end
    redirect_to root_path
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
