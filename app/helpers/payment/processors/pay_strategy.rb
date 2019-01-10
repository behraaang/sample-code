# frozen_string_literal: true

module Payment
  module Processors
    # Abstract Class
    class PayStrategy
      def initialize(_gateway_info)
        raise NotImplementedError, 'Please define the method.'
      end

      def customer_inquiry(_data)
        raise NotImplementedError, 'Please define the method.'
      end

      def pay(_data)
        raise NotImplementedError, 'Please define the method.'
      end

      def tran_inquiry(_data)
        raise NotImplementedError, 'Please define the method.'
      end
    end
  end
end
