require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id,)
    sleep(0.1)
  end

  describe '購入情報入力'do
    context '商品購入できる時'do
      it '全ての値が正しく入力されていれば購入できる'do
        expect(@address).to be_valid
       end
       it 'buildingは空でも購入できる'do
        @address.building = ''
        expect(@address).to be_valid
       end
      
    end

    context '商品購入できない時' do
      it 'postal_codeが空だと購入できない'do
      @address.postal_code = ''
      @address.valid?
      expect(@address.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid")
      end

      it 'postal_codeが全角数字だと購入できない(全角英語のみ)' do
        @address.postal_code= ' １２３４５６７ '
        @address.valid?
        expect(@address.errors.full_messages).to include("Postal code is invalid") 
      end

      it 'postal_codeは半角のハイフンを含まないと購入できない' do
        @address.postal_code= ' 123-4567 '
        @address.valid?
        expect(@address.errors.full_messages).to include("Postal code is invalid") 
      end

      it 'prefectureが空だと購入できない' do
        @address.prefecture_id = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Prefecture can't be blank", "Prefecture is not a number")
      end
      it 'prefectureが未選択だと購入できない' do
        @address.prefecture_id = 1
        @address.valid?
        expect(@address.errors.full_messages).to include("Prefecture must be greater than or equal to 2")
      end
      it 'cityが空だと購入できない' do
        @address.city = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと購入できない' do
        @address.address = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと購入できない' do
        @address.phone_number = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number can't be blank","Phone number is invalid")
      end
      it 'phone_numberが全角数字だと購入できない(全角英語のみ)' do
        @address.phone_number = ' ０９０１２３４５６７８ '
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number is invalid") 
      end
      it 'phone_numberが英数混合だと購入できない' do
        @address.phone_number = ' a0901234567'
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number is invalid") 
      end
      it 'phone_numberは12桁以上だと購入できない' do
        @address.phone_number = ' 090123456789 '
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number is invalid") 
      end
      it 'user_idがないと購入できない'do
      @address.user_id = nil
      @address.valid?
      expect(@address.errors.full_messages).to include()
      end
      it 'item_idがないと購入できない'do
      @address.item_id = nil
      @address.valid?
      expect(@address.errors.full_messages).to include()
      end
      it "tokenが空では購入できないこと" do
        @address.token = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Token can't be blank")
     end
    end
  end
end
