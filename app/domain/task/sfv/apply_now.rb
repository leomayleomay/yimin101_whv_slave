module Task
  module Sfv
    class ApplyNow < Task::Base
      protected

      def succeed!
        uri = URI.parse(current_url)
        customer.application_id = uri.query.match(/ApplicationId=(\d+)/)[1]

        customer.apply_now_did_succeed!
      end

      def fail_with_error!(message, backtrace)
        customer.apply_now_did_fail_with_error!(message, backtrace)
      end

      def url
        "https://www.immigration.govt.nz/SilverFern/Application/Create.aspx?CountryId=46"
      end

      def do_execute
        visit(url)

        find("#ctl00_ContentPlaceHolder1_applyNowButton").click
      end
    end
  end
end
