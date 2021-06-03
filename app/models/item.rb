class Item < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions
    
    belongs_to :category
    belongs_to :sales_status
    belongs_to :fee_status
    belongs_to :prefecture
    belongs_to :scheduled_delivery
    has_one_attached :image
    belongs_to :user

    validates :image,:item_name,:item_info,:category_id,:sales_status_id,:fee_status_id,:prefecture_id,:scheduled_delivery_id,:item_price, presence: true
    validates :category_id,:sales_status_id,:fee_status_id,:prefecture_id,:scheduled_delivery_id, presence: true, numericality: {greater_than_or_equal_to: 1}
    validates :item_price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

    

end
