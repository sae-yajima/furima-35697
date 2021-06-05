class ItemsController < ApplicationController
    before_action :authenticate_user!,except:[:index,:show]
    before_action :set_item, only: [:edit,:show,:update]
    before_action :move_to_index, only: [:edit,:update,:destroy]
    
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
        else
        render :new
        end
    end


    def show
       
    end

    def destroy
        item = Item.find(params[:id])
        item.destroy
        redirect_to root_path
      end




    def edit
       
    end


      def update
        
        if  @item.update(item_params)
            redirect_to item_path(params[:id])
        else
            render :edit
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