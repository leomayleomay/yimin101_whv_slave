module Task
  module NZ
    module Whv
      class Character < Task::NZ::Base
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

          # select(customer.character_imprisonment_5_years, from: "ctl00_ContentPlaceHolder1_character_imprisonment5YearsDropDownList")
          # select(customer.character_imprisonment_12_months, from: "ctl00_ContentPlaceHolder1_character_imprisonment12MonthsDropDownList")
          # select(customer.character_removal_order, from: "ctl00_ContentPlaceHolder1_character_removalOrderDropDownList")
          # select(customer.character_deported, from: "ctl00_ContentPlaceHolder1_character_deportedDropDownList")
          # if customer.character_deported_date.present?
          #   select(customer.character_deported_date.strftime("%d"), from: "ctl00_ContentPlaceHolder1_character_deportedDateDatePicker_Day")
          #   select(customer.character_deported_date.strftime("%b"), from: "ctl00_ContentPlaceHolder1_character_deportedDateDatePicker_Month")
          #   select(customer.character_deported_date.strftime("%Y"), from: "ctl00_ContentPlaceHolder1_character_deportedDateDatePicker_Year")
          # end
          # select(customer.character_country, from: "ctl00_ContentPlaceHolder1_character_countryDropDownList") if customer.deportion_country.present?
          # select(customer.character_charged, from: "ctl00_ContentPlaceHolder1_character_chargedDropDownList")
          # select(customer.character_convicted, from: "ctl00_ContentPlaceHolder1_character_convictedDropDownList")
          # select(customer.character_under_investigation, from: "ctl00_ContentPlaceHolder1_character_underInvestigationDropDownList")
          # select(customer.character_excluded, from: "ctl00_ContentPlaceHolder1_character_excludedDropDownList")
          # select(customer.character_removed, from: "ctl00_ContentPlaceHolder1_character_removedDropDownList")
          # fill_in("ctl00_ContentPlaceHolder1_character_excludeRemovedDetailsTextbox", with: customer.character_exclude_removed_details) if customer.character_exclude_removed_details.present?

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
end
