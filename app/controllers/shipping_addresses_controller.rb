class ShippingAddressesController < ApplicationController
  before_action :set_item

  def index
    @shipping_address = ShippingAddress.new
  end

  def create
    @shipping_address = ShippingAddress.new(shipping_address_params)
    @shipping_address.save!
    pay_item
    redirect_to root_path
  rescue StandardError
    redirect_to item_shipping_addresses_path
  end

  private

  def shipping_address_params
    params.require(:shipping_address).permit(
      :postal_code, :prefectures_id, :city, :house_number, :building_name, :phone_number, :token
    ).merge(item_id: params[:item_id])
  end

  def card_params
    params.permit(:token)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: card_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end