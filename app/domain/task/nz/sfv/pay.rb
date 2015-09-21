module Task
  module NZ
    module Sfv
      class Pay < Task::NZ::Base
        protected

        def succeed!
          customer.pay_did_succeed!
        end

        def fail_with_error!(message, backtrace)
          customer.pay_did_fail_with_error!(message, backtrace)
        end

        def url
          "https://www.immigration.govt.nz/PaymentGateway/OnLinePayment.aspx?SourceUrl=https://www.immigration.govt.nz/SilverFern/Application/SubmitConfirmation.aspx?ApplicationId=#{application_id}&ApplicationId=#{application_id}&ProductId=2"
        end

        def do_execute
          visit(url)
        end
      end
    end
  end
end
