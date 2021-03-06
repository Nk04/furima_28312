class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  # association
  has_many :items
  has_many :item_purchases

  # validation
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  KANA_REGEX = /\A[ァ-ン]+\z/.freeze
  NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze

  with_options presence: true do
    validates :nick_name
    validates :birthday
    validates :password, length: { minimum: 6 }, format: { with: PASSWORD_REGEX }, confirmation: true
    with_options format: { with: NAME_REGEX } do
      validates :family_name
      validates :first_name
    end
    with_options format: { with: KANA_REGEX } do
      validates :family_name_kana
      validates :first_name_kana
    end
  end
end
