module Task
  module AU
    module Whv
      class Login < Task::AU::Base
        protected

        def succeed!
          customer.login_did_succeed!
        end

        def fail_with_error!(message, backtrace)
          customer.login_did_fail_with_error!(message, backtrace)
        end

        def url
          "https://online.immi.gov.au/lusc/login"
        end

        def do_execute
          visit(url)

          fill_in("Username", with: customer.signup_username)
          fill_in("Password", with: customer.signup_password)

          click_button("Login")
          click_button("Continue")
        end
      end
    end
  end
end
