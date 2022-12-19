class ResponseController < ApplicationController
    skip_before_action :verify_authenticity_token, only:[:aaa, :bbb]
    def index

    end

    def aaa
        response = Newebpay::MpgResponse.new(params[:TradeInfo])
        @re_hash = response.result
        @order_no = response.order_no
        #render html: {order_no: response.order_no, trans_no: response.trans_no}
    end

    def bbb
        render html:params
    end
end
