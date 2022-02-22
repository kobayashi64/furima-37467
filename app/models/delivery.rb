class Delivery < ApplicationRecord
  # with_options presence: true do
  #   validates :prefecture_id
  #   validates :city
  #   validates :address
  #   validates :telephone_number
  #   validates :purchase_id
  #  end

  belongs_to :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
