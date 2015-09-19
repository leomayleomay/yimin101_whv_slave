module Task
  module NZ
    module Whv
      class Login < Task::Base
        protected

        def succeed!
          customer.login_did_succeed!
        end

        def fail_with_error!(message, backtrace)
          customer.login_did_fail_with_error!(message, backtrace)
        end

        def url
          "https://www.immigration.govt.nz/secure/Login+Working+Holiday.htm"
        end

        def do_execute
          visit(url)

          fill_in("OnlineServicesLoginStealth_VisaLoginControl_userNameTextBox", with: customer.username)
          fill_in("OnlineServicesLoginStealth_VisaLoginControl_passwordTextBox", with: customer.password)

          find("#OnlineServicesLoginStealth_VisaLoginControl_loginImageButton").click
        end
      end
    end
  end
end