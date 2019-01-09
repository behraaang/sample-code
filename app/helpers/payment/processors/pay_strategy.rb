module Payment
  module Processors
    # Abstract Class
    class PayStrategy
      def initialize(gateway_info)
        raise NotImplementedError, 'Please define the method.'
      end

      def customer_inquiry(data)
        raise NotImplementedError, 'Please define the method.'
      end

      def pay(data)
        raise NotImplementedError, 'Please define the method.'
      end

      def tran_inquiry(data)
        raise NotImplementedError, 'Please define the method.'
      end
    end
  end
end
