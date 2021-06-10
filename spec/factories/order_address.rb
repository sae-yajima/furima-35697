FactoryBot.define do
    factory :order_address do
      postal_code            {"123-4567"}
      city                   {"新宿区"}
      address                {'1-1'}
      building               {"ああ"}
      prefecture_id          {2}
      phone_number           {'09012345678'}
      
  
    end
  end
  