# frozen_string_literal: true

module Payment
  class PayFactory
    def initialize(pay_strategy, gateway_info)
      @pay_strategy = pay_strategy.new(gateway_info)
    end

    def customer_inquiry(data)
      @pay_strategy.customer_inquiry(data)
    end

    def pay(data)
      @pay_strategy.pay(data)
    end

    def tran_inquiry(data)
      @pay_strategy.tran_inquiry(data)
    end
  end
end
