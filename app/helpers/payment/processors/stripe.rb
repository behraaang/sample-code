module Payment
  module Processors
    class Stripe < PayStrategy
      def initialize(gateway_info)
        # Here you will initialize the gateway instance by the account config
        # of your choice if you have multiple destinations. or maybe based on your user.
      end

      def customer_inquiry(data)
        # The customer Inquiry logic for customer paying using Wallet goes here
      end

      def pay(data)
        # implement your payment using Wallet option logic logic here
      end

      def tran_inquiry(data)
        # Implement get transaction status for a Wallet payment option here
      end
    end
  end
end
