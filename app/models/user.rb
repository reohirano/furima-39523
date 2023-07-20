class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   validates :nickname, presence: true
   validates :family_name, presence: true
   validates :first_name, presence: true
   validates :family_name_kana, presence: true
   validates :first_name_kana, presence: true
   validates :birth_day, presence: true
   validates :family_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
   validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
   validates :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
   validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
   with_options presence: true do
     PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
     validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers'

    end
end

