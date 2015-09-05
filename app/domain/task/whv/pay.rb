module Task
  module Whv
    class Pay < Task::Base
      protected

      def executed?
        false
      end

      def succeed!
        customer.pay_did_succeed!
      end

      def fail_with_error!(message, backtrace)
        customer.pay_did_fail_with_error!(message, backtrace)
      end

      def url
        "https://www.immigration.govt.nz/PaymentGateway/OnLinePayment.aspx?SourceUrl=https://www.immigration.govt.nz/WorkingHoliday/Application/SubmitConfirmation.aspx?ApplicationId=#{application_id}&ApplicationId=#{application_id}&ProductId=2"
      end

      def do_execute
        visit(url) if current_url != url

        fill_in("ctl00_ContentPlaceHolder1_payorNameTextBox", with: customer.full_name)
        find("#ctl00_ContentPlaceHolder1_okImageButton").click

        find("#card_type_#{Figaro.env.cc_type}").click
        fill_in("cardnumber", with: Figaro.env.cc_number)
        fill_in("cardverificationcode", with: Figaro.env.cc_cvv)
        select(Figaro.env.cc_exp_month, from: "expirymonth")
        select(Figaro.env.cc_exp_year, from: "expiryyear")
        fill_in("cardholder", with: Figaro.env.cc_holder_name)

        find("#pay_button").click
      end
    end
  end
end
