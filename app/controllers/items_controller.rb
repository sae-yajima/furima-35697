class ItemsController < ApplicationController
    before_action :authenticate_user!,only:[:new,:create]
    def  index
        # query = "SELECT * FROM items"
        # @items = Item.find_by_sql(query)  
    end

    # def new
    #     @item = Item.new
        
    # end

    # def create
    #     @item = Item.new
    # end
   
   end
