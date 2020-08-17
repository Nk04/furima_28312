require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '新規出品' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/test_image.png')
    end

    it '全ての項目に正しい値が入力されていれば出品できること' do
      expect(@item).to be_valid
    end

    it '商品名が空なら出品できないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it '画像が空なら出品できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it '商品の説明が、空なら出品できないこと' do
      @item.comment = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Comment can't be blank")
    end

    it '発送元の地域についての情報が、空なら出品できないこと' do
      @item.shipping_origin = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping origin is not a number')
    end

    it '価格についての情報が、空なら出品できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end

    it '価格の範囲が、¥300~¥9,999,999の間であること' do
      @item.price = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end
    it '価格の範囲が、¥300~¥9,999,999の間であること' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end
  end
end
