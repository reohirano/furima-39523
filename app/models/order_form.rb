class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :area_id, :city, :block, :building, :phone_number, :token

  with_options presence: true do
   # orderモデル
    validates :user_id
    validates :item_id
   # sippng addressモデル
    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :area_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :block
    validates :phone_number, format: { with: /\A[0-9]{11}\z/, message: 'is invalid' }
    validates :token
  end

  def save
   order = Order.create(user_id: user_id, item_id: item_id)
    # ストロングパラメーターでデータが運ばれ、それらが保存のタイミングで「order_id」が生成され、保存される。
   SippingAddress.create(order_id: order.id, postcode: postcode, area_id: area_id, city: city, block: block, building: building, phone_number: phone_number)
  end
end