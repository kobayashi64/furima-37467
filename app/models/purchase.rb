class Purchase < ApplicationRecord
  attr_accessor :token

  has_one :delivery
  belongs_to :user
  belongs_to :item

  #  validates :item_id, presence: true, foreign_key: true
  #  validates :user_id, presence: true, foreign_key: true
end
