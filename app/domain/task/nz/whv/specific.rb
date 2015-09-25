module Task
  module NZ
    module Whv
      class Specific < Task::NZ::Base
        protected

        def succeed!
          customer.specific_did_succeed!
        end

        def fail_with_error!(message, backtrace)
          customer.specific_did_fail_with_error!(message, backtrace)
        end

        def errors
          return @errors if @errors

          tab = find("#ctl00_ContentPlaceHolder1_wizardPageHeader_nav_sectionTabs_TabHeaders_ctl03_statusImage")
          if tab[:title] == "Completed"
            @errors = []
          else
            @errors = ["WHV Specific fails, please login to check"]
          end

          @errors
        end

        def url
          "https://www.immigration.govt.nz/WorkingHoliday/Wizard/WorkingHolidaySpecific.aspx?ApplicationId=#{application_id}&IndividualType=Primary&IndividualIndex=1"
        end

        def do_execute
          visit(url)

          # select(customer.previous_sfv_permit_visa, from: "ctl00_ContentPlaceHolder1_offshoreDetails_commonWHSQuestions_previousWhsPermitVisaDropDownList")
          select("No", from: "ctl00_ContentPlaceHolder1_offshoreDetails_commonWHSQuestions_previousWhsPermitVisaDropDownList")
          # select(customer.sufficient_funds_holiday, from: "ctl00_ContentPlaceHolder1_offshoreDetails_commonWHSQuestions_sufficientFundsHolidayDropDownList")
          select("Yes", from: "ctl00_ContentPlaceHolder1_offshoreDetails_commonWHSQuestions_sufficientFundsHolidayDropDownList")
          select(customer.intended_travel_date.to_date.strftime("%d"), from: "ctl00_ContentPlaceHolder1_offshoreDetails_intendedTravelDateDatePicker_Day")
          select(customer.intended_travel_date.to_date.strftime("%b"), from: "ctl00_ContentPlaceHolder1_offshoreDetails_intendedTravelDateDatePicker_Month")
          select(customer.intended_travel_date.to_date.strftime("%Y"), from: "ctl00_ContentPlaceHolder1_offshoreDetails_intendedTravelDateDatePicker_Year")
          # select(customer.length_of_stay, from: "ctl00_ContentPlaceHolder1_offshoreDetails_lengthOfStay_lengthOfStayDropDownList")
          select("12 Months", from: "ctl00_ContentPlaceHolder1_offshoreDetails_lengthOfStay_lengthOfStayDropDownList")
          select(customer.been_to_nz, from: "ctl00_ContentPlaceHolder1_offshoreDetails_beenToNzDropDownList")
          if customer.when_in_nz.present?
            select(customer.when_in_nz.to_date.strftime("%d"), from: "ctl00_ContentPlaceHolder1_offshoreDetails_whenInNZDatePicker_Day")
            select(customer.when_in_nz.to_date.strftime("%b"), from: "ctl00_ContentPlaceHolder1_offshoreDetails_whenInNZDatePicker_Month")
            select(customer.when_in_nz.to_date.strftime("%Y"), from: "ctl00_ContentPlaceHolder1_offshoreDetails_whenInNZDatePicker_Year")
          end
          select("Yes", from: "ctl00_ContentPlaceHolder1_offshoreDetails_requirementsQuestions_sufficientFundsOnwardTicketDropDownList")
          select("Yes", from: "ctl00_ContentPlaceHolder1_offshoreDetails_requirementsQuestions_readRequirementsDropDownList")

          find("#ctl00_ContentPlaceHolder1_wizardPageFooter_wizardPageNavigator_validateButton").click
        end
      end
    end
  end
end
