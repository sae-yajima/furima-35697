class Item < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    
    belongs_to :category
    belongs_to :sales_status
    belongs_to :fee_status
    belongs_to :prefecture
    belongs_to :scheduled_delivery
    has_one_attached :image
    belongs_to :user
    has_one :order
    

    with_options presence: true do
    validates  :image
    validates  :item_name
    validates  :item_info
    validates  :category_id
    validates  :category_id
    validates  :sales_status_id
    validates  :fee_status_id
    validates  :prefecture_id
    validates  :scheduled_delivery_id
    validates  :item_price
    end
    with_options numericality: {other_than: 1} do
      validates :category_id
      validates :sales_status_id
      validates :fee_status_id
      validates :prefecture_id
      validates :scheduled_delivery_id
    end   
   
    validates :item_price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

end
