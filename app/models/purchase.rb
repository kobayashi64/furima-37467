class Purchase < ApplicationRecord
  attr_accessor :token

  has_one :delivery
  belongs_to :user
  belongs_to :item

end
