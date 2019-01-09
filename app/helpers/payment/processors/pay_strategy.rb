module Payment
  module Processors
    # Abstract Class
    class PayStrategy
      def initialize(gateway_info: gateway_info)
        raise NotImplementedError, 'Please define the method.'
      end

      def customer_inquiry(data: data)
        raise NotImplementedError, 'Please define the method.'
      end

      def pay(data: data)
        raise NotImplementedError, 'Please define the method.'
      end

      def tran_inquiry(data: data)
        raise NotImplementedError, 'Please define the method.'
      end
    end
  end
end
