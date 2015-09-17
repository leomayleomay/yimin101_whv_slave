module Task
  module Whv
    class Character < Task::Base
      protected

      def succeed!
        customer.character_did_succeed!
      end

      def fail_with_error!(message, backtrace)
        customer.character_did_fail_with_error!(message, backtrace)
      end

      def errors
        return @errors if @errors

        tab = find("#ctl00_ContentPlaceHolder1_wizardPageHeader_nav_sectionTabs_TabHeaders_ctl02_statusImage")
        if tab[:title] == "Completed"
          @errors = []
        else
          @errors = ["Character fails, please login to check"]
        end

        @errors
      end

      def url
        "https://www.immigration.govt.nz/WorkingHoliday/Wizard/Character.aspx?ApplicationId=#{application_id}&IndividualType=Primary&IndividualIndex=1"
      end

      def do_execute
        visit(url)

        # select(customer.imprisionment_of_5_years_or_more, from: "ctl00_ContentPlaceHolder1_character_imprisonment5YearsDropDownList")
        # select(customer.imprisionment_of_12_months_or_more, from: "ctl00_ContentPlaceHolder1_character_imprisonment12MonthsDropDownList")
        # select(customer.removal_order, from: "ctl00_ContentPlaceHolder1_character_removalOrderDropDownList")
        # select(customer.deported, from: "ctl00_ContentPlaceHolder1_character_deportedDropDownList")
        # if customer.deportion_date.present?
        #   select(customer.deportion_date.strftime("%d"), from: "ctl00_ContentPlaceHolder1_character_deportedDateDatePicker_Day")
        #   select(customer.deportion_date.strftime("%b"), from: "ctl00_ContentPlaceHolder1_character_deportedDateDatePicker_Month")
        #   select(customer.deportion_date.strftime("%Y"), from: "ctl00_ContentPlaceHolder1_character_deportedDateDatePicker_Year")
        # end
        # select(customer.deportion_country, from: "ctl00_ContentPlaceHolder1_character_countryDropDownList") if customer.deportion_country.present?
        # select(customer.charged, from: "ctl00_ContentPlaceHolder1_character_chargedDropDownList")
        # select(customer.convicted, from: "ctl00_ContentPlaceHolder1_character_convictedDropDownList")
        # select(customer.under_investigation, from: "ctl00_ContentPlaceHolder1_character_underInvestigationDropDownList")
        # select(customer.excluded, from: "ctl00_ContentPlaceHolder1_character_excludedDropDownList")
        # select(customer.removed, from: "ctl00_ContentPlaceHolder1_character_removedDropDownList")
        # fill_in("ctl00_ContentPlaceHolder1_character_excludeRemovedDetailsTextbox", with: customer.exclude_removal_details) if customer.exclude_removal_details.present?

        select("No", from: "ctl00_ContentPlaceHolder1_character_imprisonment5YearsDropDownList")
        select("No", from: "ctl00_ContentPlaceHolder1_character_imprisonment12MonthsDropDownList")
        select("No", from: "ctl00_ContentPlaceHolder1_character_removalOrderDropDownList")
        select("No", from: "ctl00_ContentPlaceHolder1_character_deportedDropDownList")
        select("No", from: "ctl00_ContentPlaceHolder1_character_chargedDropDownList")
        select("No", from: "ctl00_ContentPlaceHolder1_character_convictedDropDownList")
        select("No", from: "ctl00_ContentPlaceHolder1_character_underInvestigationDropDownList")
        select("No", from: "ctl00_ContentPlaceHolder1_character_excludedDropDownList")
        select("No", from: "ctl00_ContentPlaceHolder1_character_removedDropDownList")

        find("#ctl00_ContentPlaceHolder1_wizardPageFooter_wizardPageNavigator_validateButton").click
      end
    end
  end
end
