class PaymentsController < ApplicationController
    def create
        # 要記得附上該筆訂單的資訊，才有辦法建立付款喔！
        order = Order.find(1)
        @form_info = Newebpay::Mpg.new(order).form_info
    end
    
    def notify_response
        response = Newebpay::MpgResponse.new(params[:TradeInfo])
    end
end
