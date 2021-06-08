class OrdersController < ApplicationController
    before_action :authenticate_user!, except: :index
    def index
        @item = Item.find(params[:item_id])
    end

    def new
        @order_address = OrderAddress.new
    end
  
    def create
       @order_address = Order.new(order_params)
       if @order_address.valid?
         @order_address.save
        redirect_to rppt_path
       else
        render :new
       end
    end






    private
    def order_params
        params.require(:order_address).permit(:postal_code, :prefecture, :city,:address,:phone_number,:building_name).merge(user_id: current_user.id)
    end
end
