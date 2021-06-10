require 'rails_helper'

RSpec.describe Item, type: :model do
 before do
  
  @item = FactoryBot.build(:item)
 end

 describe '商品情報入力'do
  context '商品出品できる時'do
  it '全ての値が正しく入力されていれば出品できる'do
    expect(@item).to be_valid
   end
 end

 context '商品出品できない時'do
  it 'imageが空だと出品できない'do
   @item.image = nil
   @item.valid?
   expect(@item.errors.full_messages).to include("Image can't be blank")
  end

  it 'nameが空だと出品できない'do
   @item.item_name = ''
   @item.valid?
   expect(@item.errors.full_messages).to include("Item name can't be blank")
  end

  it 'infoが空だと出品できない'do
   @item.item_info = ''
   @item.valid?
   expect(@item.errors.full_messages).to include("Item info can't be blank")
  end

  it 'categoryが未選択だと出品できない'do
   @item.category_id = 0
   @item.valid?
   expect(@item.errors.full_messages).to include("Category must be greater than or equal to 1")
  end

  it 'sales-statusが未選択だと出品できない'do
   @item.sales_status_id = 0
   @item.valid?
   expect(@item.errors.full_messages).to include("Sales status must be greater than or equal to 1")
  end

  it 'fee-statusが未選択だと出品できない'do
   @item.fee_status_id = 0
   @item.valid?
   expect(@item.errors.full_messages).to include("Fee status must be greater than or equal to 1")
  end

  it 'prefectureが未選択だと出品できない'do
   @item.prefecture_id = 0
   @item.valid?
   expect(@item.errors.full_messages).to include("Prefecture must be greater than or equal to 1")
  end

  it 'scheduled-deliveryが未選択だと出品できない'do
   @item.scheduled_delivery_id = 0
   @item.valid?
   expect(@item.errors.full_messages).to include("Scheduled delivery must be greater than or equal to 1")
  end

  it 'priceが空だと出品できない'do
   @item.item_price = ''
   @item.valid?
   expect(@item.errors.full_messages).to include("Item price can't be blank")
  end

    it 'priceが全角数字だと出品できない:全角英数混合(全角英語のみ)' do
     @item.item_price = '１５００ '
     @item.valid?
     expect(@item.errors.full_messages).to include("Item price is not a number")  
    end

    it 'priceが299円以下だと出品できない'do
    @item.item_price = 299
    @item.valid?
    expect(@item.errors[:item_price]).to include("must be greater than or equal to 300")
    end

    it 'priceが10,000,000円以上だと出品できない'do
    @item.item_price = 10,000,000
    @item.valid?
    expect(@item.errors[:item_price]).to include("is not a number")

    end



   end
  end
end