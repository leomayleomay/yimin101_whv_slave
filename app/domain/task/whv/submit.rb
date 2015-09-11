module Task
  module Whv
    class Submit < Task::Base
      protected

      def succeed!
        customer.submit_did_succeed!
      end

      def fail_with_error!(message, backtrace)
        customer.submit_did_fail_with_error!(message, backtrace)
      end

      def url
        "https://www.immigration.govt.nz/WorkingHoliday/Application/Submit.aspx?ApplicationId=#{application_id}"
      end

      def do_execute
        visit(url)

        check("ctl00_ContentPlaceHolder1_falseStatementCheckBox")
        check("ctl00_ContentPlaceHolder1_notesCheckBox")
        check("ctl00_ContentPlaceHolder1_circumstancesCheckBox")
        check("ctl00_ContentPlaceHolder1_warrantsCheckBox")
        check("ctl00_ContentPlaceHolder1_informationCheckBox")
        check("ctl00_ContentPlaceHolder1_healthCheckBox")
        check("ctl00_ContentPlaceHolder1_adviceCheckBox")
        check("ctl00_ContentPlaceHolder1_registrationCheckBox")
        check("ctl00_ContentPlaceHolder1_entitlementCheckbox")
        check("ctl00_ContentPlaceHolder1_permitExpiryCheckBox")
        check("ctl00_ContentPlaceHolder1_medicalInsuranceCheckBox")

        find("#ctl00_ContentPlaceHolder1_submitImageButton").click
      end
    end
  end
end
