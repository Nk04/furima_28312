require 'rails_helper'

RSpec.describe ShippingAddress, type: :model do
  describe '商品購入' do
    before do
      @shipping_address = FactoryBot.build(:shipping_address)
    end

    it '全ての項目に正しい値が入力されていれば購入できること' do
      expect(@shipping_address).to be_valid
    end

    it '郵便番号が空では購入できないこと' do
      @shipping_address.postal_code = nil
      @shipping_address.valid?
      expect(@shipping_address.errors.full_messages).to include("Postal code can't be blank")
    end

    it '都道府県が空では購入できない事' do
      @shipping_address.prefectures_id = nil
      @shipping_address.valid?
      expect(@shipping_address.errors.full_messages).to include("Prefectures is not a number")
    end

    it '市区町村が空では購入できないこと' do
      @shipping_address.city = nil
      @shipping_address.valid?
      expect(@shipping_address.errors.full_messages).to include("City can't be blank")
    end

    it '番地が空では購入できないこと' do
      @shipping_address.house_number = nil
      @shipping_address.valid?
      expect(@shipping_address.errors.full_messages).to include("House number can't be blank")
    end

    it '電話番号が空では購入できないこと' do
      @shipping_address.phone_number = nil
      @shipping_address.valid?
      expect(@shipping_address.errors.full_messages).to include("Phone number can't be blank")
    end

    it '郵便番号にはハイフンが必要であること' do
      @shipping_address.postal_code = 0001111
      @shipping_address.valid?
      expect(@shipping_address.errors.full_messages).to include("Postal code is invalid")
    end

    it '電話番号は11桁までであること' do
      @shipping_address.phone_number = 123456789012
      @shipping_address.valid?
      expect(@shipping_address.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
    end
  end
end
