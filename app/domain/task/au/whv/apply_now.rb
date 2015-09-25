module Task
  module AU
    module Whv
      class ApplyNow < Task::AU::Base
        protected

        def succeed!
          customer.apply_now_did_succeed!
        end

        def fail_with_error!(message, backtrace)
          customer.apply_now_did_fail_with_error!(message, backtrace)
        end

        def url
          "https://online.immi.gov.au/visas/applyNow.do?form=WHM"
        end

        def do_execute
          visit(url)

          click_button("I have read and agree to the terms and conditions")
        end
      end
    end
  end
end