module Task
  module NZ
    module Whv
      class Personal2 < Task::NZ::Base
        protected

        def succeed!
          customer.personal2_did_succeed!
        end

        def fail_with_error!(message, backtrace)
          customer.personal2_did_fail_with_error!(message, backtrace)
        end

        def errors
          @errors ||= all(".ErrorMessageSmall").collect {|m| m.text}.select {|e| e != "&nbsp;*"}
        end

        def url
          "https://www.immigration.govt.nz/WorkingHoliday/Wizard/Personal2.aspx?ApplicationId=#{application_id}&IndividualType=Primary&IndividualIndex=1"
        end

        def do_execute
          visit(url)

          fill_in("ctl00_ContentPlaceHolder1_identification_passportNumberTextBox", with: customer.passport_number)
          fill_in("ctl00_ContentPlaceHolder1_identification_confirmPassportNumberTextBox", with: customer.passport_number)
          select(customer.passport_expiry_date.to_date.strftime("%d"), from: "ctl00_ContentPlaceHolder1_identification_passportExpiryDateDatePicker_Day")
          select(customer.passport_expiry_date.to_date.strftime("%b"), from: "ctl00_ContentPlaceHolder1_identification_passportExpiryDateDatePicker_Month")
          select(customer.passport_expiry_date.to_date.strftime("%Y"), from: "ctl00_ContentPlaceHolder1_identification_passportExpiryDateDatePicker_Year")

          select(customer.other_identification, from: "ctl00_ContentPlaceHolder1_identification_otherIdentificationDropdownlist")
          select(customer.other_issue_date.to_date.strftime("%d"), from: "ctl00_ContentPlaceHolder1_identification_otherIssueDateDatePicker_Day")
          select(customer.other_issue_date.to_date.strftime("%b"), from: "ctl00_ContentPlaceHolder1_identification_otherIssueDateDatePicker_Month")
          select(customer.other_issue_date.to_date.strftime("%Y"), from: "ctl00_ContentPlaceHolder1_identification_otherIssueDateDatePicker_Year")

          if customer.other_expiry_date.present?
            select(customer.other_expiry_date.to_date.strftime("%d"), from: "ctl00_ContentPlaceHolder1_identification_otherExpiryDateDatePicker_Day")
            select(customer.other_expiry_date.to_date.strftime("%b"), from: "ctl00_ContentPlaceHolder1_identification_otherExpiryDateDatePicker_Month")
            select(customer.other_expiry_date.to_date.strftime("%Y"), from: "ctl00_ContentPlaceHolder1_identification_otherExpiryDateDatePicker_Year")
          end

          find("#ctl00_ContentPlaceHolder1_wizardPageFooter_wizardPageNavigator_validateButton").click
        end
      end
    end
  end
end
