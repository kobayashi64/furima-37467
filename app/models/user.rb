class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :family_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' }
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' }
    validates :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カナ文字を使用してください' }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カナ文字を使用してください' }
    validates :nickname
    validates :birthday
  end
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数を両方含む必要があります' }

  has_many :items
end
