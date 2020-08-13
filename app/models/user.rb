class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  KANA_REGEX = /\A[ァ-ン]+\z/.freeze
  NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze

  validates :nick_name, presence: true
  validates :password, presence: true, length: { minimum: 6 }, format: { with: PASSWORD_REGEX }, confirmation: true
  validates :family_name, presence: true, format: { with: NAME_REGEX }
  validates :first_name, presence: true, format: { with: NAME_REGEX }
  validates :family_name_kana, presence: true, format: { with: KANA_REGEX }
  validates :first_name_kana, presence: true, format: { with: KANA_REGEX }
  validates :birthday, presence: true
end
