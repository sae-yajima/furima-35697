class ItemsController < ApplicationController
    before_action :authenticate_user!,only:[:new,:create]
    def  index
        
        @items = Item.all.order(created_at:"desc")
    end

    def new
        @item = Item.new
        
    end

    def create
        @item = Item.new(item_params)
        if @item.save
           return redirect_to root_path
        end
        render:new
    end
   




private
def item_params
    params.require(:item).permit(:image,:item_name,:item_info,:category_id,:sales_status_id,:fee_status_id,:prefecture_id,:scheduled_delivery_id,:item_price).merge(user_id: current_user.id)
end






   end
