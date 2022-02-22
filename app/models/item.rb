class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  with_options numericality: { other_than: 1, message: '項目に「---」以外を選択してください' } do
    validates :category_id
    validates :condition_id
    validates :delivery_charge_id
    validates :days_to_ship_id
    validates :prefecture_id
  end

  with_options presence: true do
    validates :image
    validates :product_name
    validates :description
    validates :category_id
    validates :condition_id
    validates :delivery_charge_id
    validates :prefecture_id
    validates :days_to_ship_id
    validates :price
    validates :user_id
  end
  validates :price,
            numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                            message: '半角数字を使用してください' }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :days_to_ship
  belongs_to :prefecture
end
