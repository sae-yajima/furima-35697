FactoryBot.define do
  factory :item do
    image                    {Faker::Lorem.sentence}
    item_name                {"test"}
    item_info                {"aaa"}
    category_id              {1}
    sales_status_id          {1}
    fee_status_id            {1}
    prefecture_id            {1}
    scheduled_delivery_id    {1}
    item_price               {1500}
    association :user     
    
    after(:build) do |item|
      item.image.attach(io: File.open('spec/images/test.png'), filename: 'test.png')
    end
  end
end
