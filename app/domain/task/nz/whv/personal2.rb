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

          fill_in("ctl00_ContentPlaceHolder1_identification_passportNumberTextBox", with: customer.identification_passport_number)
          fill_in("ctl00_ContentPlaceHolder1_identification_confirmPassportNumberTextBox", with: customer.identification_passport_number)
          select(customer.identification_passport_expiry_date.strftime("%d"), from: "ctl00_ContentPlaceHolder1_identification_passportExpiryDateDatePicker_Day")
          select(customer.identification_passport_expiry_date.strftime("%b"), from: "ctl00_ContentPlaceHolder1_identification_passportExpiryDateDatePicker_Month")
          select(customer.identification_passport_expiry_date.strftime("%Y"), from: "ctl00_ContentPlaceHolder1_identification_passportExpiryDateDatePicker_Year")

          select(customer.identification_other_identification, from: "ctl00_ContentPlaceHolder1_identification_otherIdentificationDropdownlist")
          select(customer.identification_other_issue_date.strftime("%d"), from: "ctl00_ContentPlaceHolder1_identification_otherIssueDateDatePicker_Day")
          select(customer.identification_other_issue_date.strftime("%b"), from: "ctl00_ContentPlaceHolder1_identification_otherIssueDateDatePicker_Month")
          select(customer.identification_other_issue_date.strftime("%Y"), from: "ctl00_ContentPlaceHolder1_identification_otherIssueDateDatePicker_Year")

          if customer.identification_other_expiry_date.present?
            select(customer.identification_other_expiry_date.strftime("%d"), from: "ctl00_ContentPlaceHolder1_identification_otherExpiryDateDatePicker_Day")
            select(customer.identification_other_expiry_date.strftime("%b"), from: "ctl00_ContentPlaceHolder1_identification_otherExpiryDateDatePicker_Month")
            select(customer.identification_other_expiry_date.strftime("%Y"), from: "ctl00_ContentPlaceHolder1_identification_otherExpiryDateDatePicker_Year")
          end

          find("#ctl00_ContentPlaceHolder1_wizardPageFooter_wizardPageNavigator_validateButton").click
        end
      end
    end
  end
end
