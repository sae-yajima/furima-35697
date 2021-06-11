class OrderAddress
    include ActiveModel::Model
    attr_accessor :token
    attr_accessor :postal_code, :prefecture_id, :city,:address,:building,:phone_number, :user_id,:item_id

    with_options presence: true do
      validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
      validates :prefecture_id, numericality: {greater_than_or_equal_to: 2}
      validates :city,:address
      validates :phone_number, format: { with: /\A\d{10,11}\z/}
      validates :user_id
      validates :item_id
      validates :token
    end


    def save
      order = Order.create(user_id: user_id ,item_id: item_id)
      Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, phone_number: phone_number, building: building, order_id: order.id)
    end
end
