class PurchaseDelivery
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :address, :building_name, :telephone_number, :purchase_id,
                :token

  # deliveryのvalidates
  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: '「3桁ハイフン4桁」の半角で入力してください' }
    validates :prefecture_id, numericality: { other_than: 1, message: '項目に「---」以外を選択してください' }
    validates :telephone_number, format: { only_integer: true, with: /\A\d{10,11}\z/, message: '10桁以上11桁以内の半角数値で入力してください' }
    validates :city
    validates :address
    validates :token
  end

  # purchaseのvalidates
  validates :item_id, presence: true
  validates :user_id, presence: true

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id, token: token)

    Delivery.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address,
                    building_name: building_name, telephone_number: telephone_number, purchase_id: purchase.id)
  end
end
