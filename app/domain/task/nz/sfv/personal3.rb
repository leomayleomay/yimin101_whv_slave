module Task
  module NZ
    module Sfv
      class Personal3 < Task::NZ::Base
        protected

        def succeed!
          customer.personal3_did_succeed!
        end

        def fail_with_error!(message, backtrace)
          customer.personal3_did_fail_with_error!(message, backtrace)
        end

        def errors
          @errors ||= all(".ErrorMessageSmall").collect {|m| m.text}.select {|e| e != "&nbsp;*"}
        end

        def url
          "https://www.immigration.govt.nz/SilverFern/Wizard/Personal3.aspx?ApplicationId=#{application_id}&IndividualType=Primary&IndividualIndex=1"
        end

        def do_execute
          visit(url)
        end
      end
    end
  end
end
