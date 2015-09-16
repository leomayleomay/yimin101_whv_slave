module Task
  module Sfv
    class Personal2 < Task::Base
      protected

      def succeed!
        customer.personal2_did_succeed!
      end

      def fail_with_error!(message, backtrace)
        customer.personal2_did_fail_with_error!(message, backtrace)
      end

      def url
        "https://www.immigration.govt.nz/SilverFern/Wizard/Personal2.aspx?ApplicationId=#{application_id}&IndividualType=Primary&IndividualIndex=1"
      end

      def do_execute
        visit(url)
      end
    end
  end
end
