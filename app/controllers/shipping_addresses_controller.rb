class ShippingAddressesController < ApplicationController
  def index
    @shipping_addresses = ShippingAddress.new
  end

  def create
  end
end
