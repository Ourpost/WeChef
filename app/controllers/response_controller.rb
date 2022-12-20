class ResponseController < ApplicationController
    skip_before_action :verify_authenticity_token, only:[:aaa, :bbb]
    def index

    end

    def aaa
        response = Newebpay::MpgResponse.new(params[:TradeInfo])
        @response_hash = response.result
        @order_no = response.order_no
        @status = response.status
        #render html: {order_no: response.order_no, trans_no: response.trans_no}
        # p "-" * 50
        # p @re_hash
        # p @re_hash[:PaymentType]
        # p @re_hash.class
        # p "-" * 50


    end

    def bbb
        render html:params
    end
end
