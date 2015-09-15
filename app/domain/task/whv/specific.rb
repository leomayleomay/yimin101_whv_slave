module Task
  module Whv
    class Specific < Task::Base
      protected

      def succeed!
        customer.whv_specific_did_succeed!
      end

      def fail_with_error!(message, backtrace)
        customer.whv_specific_did_fail_with_error!(message, backtrace)
      end

      def url
        "https://www.immigration.govt.nz/WorkingHoliday/Wizard/WorkingHolidaySpecific.aspx?ApplicationId=#{application_id}&IndividualType=Primary&IndividualIndex=1"
      end

      def do_execute
        visit(url)

        select(customer.previous_whv_permit, from: "ctl00_ContentPlaceHolder1_offshoreDetails_commonWHSQuestions_previousWhsPermitVisaDropDownList")
        # select(customer.sufficient_funds, from: "ctl00_ContentPlaceHolder1_offshoreDetails_commonWHSQuestions_sufficientFundsHolidayDropDownList")
        select("Yes", from: "ctl00_ContentPlaceHolder1_offshoreDetails_commonWHSQuestions_sufficientFundsHolidayDropDownList")
        select(customer.intended_travel_date.strftime("%d"), from: "ctl00_ContentPlaceHolder1_offshoreDetails_intendedTravelDateDatePicker_Day")
        select(customer.intended_travel_date.strftime("%b"), from: "ctl00_ContentPlaceHolder1_offshoreDetails_intendedTravelDateDatePicker_Month")
        select(customer.intended_travel_date.strftime("%Y"), from: "ctl00_ContentPlaceHolder1_offshoreDetails_intendedTravelDateDatePicker_Year")
        # select(customer.length_of_stay, from: "ctl00_ContentPlaceHolder1_offshoreDetails_lengthOfStay_lengthOfStayDropDownList")
        select("12 Months", from: "ctl00_ContentPlaceHolder1_offshoreDetails_lengthOfStay_lengthOfStayDropDownList")
        select(customer.been_to_nz_before, from: "ctl00_ContentPlaceHolder1_offshoreDetails_beenToNzDropDownList")
        if customer.when_in_nz_date.present?
          select(customer.when_in_nz_date.strftime("%d"), from: "ctl00_ContentPlaceHolder1_offshoreDetails_whenInNZDatePicker_Day")
          select(customer.when_in_nz_date.strftime("%b"), from: "ctl00_ContentPlaceHolder1_offshoreDetails_whenInNZDatePicker_Month")
          select(customer.when_in_nz_date.strftime("%Y"), from: "ctl00_ContentPlaceHolder1_offshoreDetails_whenInNZDatePicker_Year")
        end
        # select(customer.sufficient_funds_for_onward_ticket, from: "ctl00_ContentPlaceHolder1_offshoreDetails_requirementsQuestions_sufficientFundsOnwardTicketDropDownList")
        select("Yes", from: "ctl00_ContentPlaceHolder1_offshoreDetails_requirementsQuestions_sufficientFundsOnwardTicketDropDownList")
        # select(customer.read_requirements, from: "ctl00_ContentPlaceHolder1_offshoreDetails_requirementsQuestions_readRequirementsDropDownList")
        select("Yes", from: "ctl00_ContentPlaceHolder1_offshoreDetails_requirementsQuestions_readRequirementsDropDownList")

        find("#ctl00_ContentPlaceHolder1_wizardPageFooter_wizardPageNavigator_validateButton").click
      end
    end
  end
end
