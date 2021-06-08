class OrderAddress
    include ActiveModel::Model
    attr_accessor :postal_code, :prefecture_id, :city,:address,:building_name,:phone_number, :user_id

    with_options presence: true do
      validates :postal_code, :prefecture_id
      validates :city,:address,:phone_number
      validates :user_id
    end

    def save
      order = Order.create(user_id: user_id)
      Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, phone_number: phone_number, building_name: building_name, order_id: order.id)
    end
end
