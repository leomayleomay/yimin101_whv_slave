module Task
  module Sfv
    class Personal1 < Task::Base
      protected

      def succeed!
        customer.personal1_did_succeed!
      end

      def fail_with_error!(message, backtrace)
        customer.personal1_did_fail_with_error!(message, backtrace)
      end

      def url
        "https://www.immigration.govt.nz/SilverFern/Wizard/Personal1.aspx?ApplicationId=#{application_id}&IndividualType=Primary&IndividualIndex=1"
      end

      def do_execute
        visit(url)
      end
    end
  end
end
