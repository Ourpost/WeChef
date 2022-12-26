class ResponseController < ApplicationController
    skip_before_action :verify_authenticity_token, only:[:index]

    def index
        response = Newebpay::MpgResponse.new(params[:TradeInfo])
        @response_hash = response.result
        @order_no = response.order_no
        @status = response.status
    end

end
