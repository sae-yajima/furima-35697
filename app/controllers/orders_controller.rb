class OrdersController < ApplicationController
    before_action :authenticate_user!, only:[:index,:show]
    def index
        @item = Item.find(params[:item_id])
        @order_address = OrderAddress.new
    end

    
    def create
       @item = Item.find(params[:item_id])
       @order_address = OrderAddress.new(order_params)
    
       if @order_address.valid?
        pay_item
         @order_address.save
        redirect_to root_path
       else
        render :index
       end
    end






    private
    def order_params
        params.require(:order_address).permit(:postal_code, :prefecture_id, :city,:address,:phone_number,:building,).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token]) 
    end

    def pay_item
        Payjp.api_key = "sk_test_a6c758ad73e533ebd5f529af" # 自身のPAY.JPテスト秘密鍵を記述しましょう
        Payjp::Charge.create(
            amount:  @item.item_price,
            card: order_params[:token],   
            currency: 'jpy'       
        )
    end
end
