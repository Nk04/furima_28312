class ShippingAddressesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :set_item_purchase
  before_action :not_current_user_and_souldout_item

  def index
    @shipping_address = ShippingAddress.new
  end

  def create
    @shipping_address = ShippingAddress.new(shipping_address_params)
    (@shipping_address && @item_purchase).save!
    pay_item
    redirect_to root_path
  rescue StandardError
    redirect_to item_shipping_addresses_path
  end

  private

  def shipping_address_params
    params.require(:shipping_address).permit(
      :postal_code, :prefectures_id, :city, :house_number, :building_name, :phone_number
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

  def set_item_purchase
    @item_purchase = ItemPurchase.new(item_id: params[:item_id], user_id: current_user.id)
  end

  def not_current_user_and_souldout_item
    if @item.user_id == current_user.id || @item.item_purchase != nil
      redirect_to root_path
    end
  end
end