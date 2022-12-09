class OrdersController < ApplicationController
  
    def index
       @orders = order.all
    end

    def new
    end
    
    def create
    end
    
    def show
    end

    def edit  
    end
end
