class ItemsController < ApplicationController
    before_action :authenticate_user!,expect:[:index,:show]
    before_action :set_item, only: [:edit, :show]
    before_action :move_to_index, only: [:edit,:update]
    
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


    def show
        # @item = Item.find(params[:id])
      end


      def edit
        # @item = Item.find(params[:id])
        
        
      end


      def update
        @item = Item.find(params[:id])
        @item.update(item_params)
        if @item.save
            redirect_to item_path(params[:id])
       
        end
      end







    

   




private
def item_params
    params.require(:item).permit(:image,:item_name,:item_info,:category_id,:sales_status_id,:fee_status_id,:prefecture_id,:scheduled_delivery_id,:item_price).merge(user_id: current_user.id)
end

def set_item
    @item = Item.find(params[:id])
  end


def move_to_index
   
    unless @item.user_id == current_user.id
        redirect_to root_path
    end   
 end




   end