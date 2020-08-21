class ShippingAddressesController < ApplicationController
  before_action :set_item, only: [:index]

  def index
    @shipping_address = ShippingAddress.new
  end

  def create
    @shipping_address = ShippingAddress.new(shipping_address_params)
    @shipping_address.save!
    redirect_to root_path
  rescue StandardError
    binding.pry
    render :index
  end

  private

  def shipping_address_params
    params.require(:shipping_address).permit(
      :postal_code, :prefectures_id, :city, :house_number, :building_name, :phone_number
    ).merge(item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
