class ResponseController < ApplicationController
    skip_before_action :verify_authenticity_token, only:[:aaa, :bbb]
    def index

    end

    def aaa
        response = Newebpay::MpgResponse.new(params[:TradeInfo])
        @response_hash = response.result
        @order_no = response.order_no
        @status = response.status

    end

    def bbb
        render html:params
    end
end
