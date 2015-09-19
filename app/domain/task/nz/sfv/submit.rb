module Task
  module NZ
    module Sfv
      class Submit < Task::Base
        protected

        def succeed!
          customer.submit_did_succeed!
        end

        def fail_with_error!(message, backtrace)
          customer.submit_did_fail_with_error!(message, backtrace)
        end

        def url
          "https://www.immigration.govt.nz/SilverFern/Application/Submit.aspx?ApplicationId=#{application_id}"
        end

        def do_execute
          visit(url)
        end
      end
    end
  end
end