module Payment
  class PayFactory
    def initialize(pay_strategy: pay_strategy, gateway_info: gateway_info)
      @pay_strategy = pay_strategy.new(gateway_info: gateway_info)
    end

    def customer_inquiry(data: data)
      @pay_strategy.customer_inquiry(data: data)
    end

    def pay(data: data)
      @pay_strategy.pay(data: data)
    end

    def tran_inquiry(data: data)
      @pay_strategy.tran_inquiry(data: data)
    end
  end
end
