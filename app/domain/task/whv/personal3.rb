module Task
  module Whv
    class Personal3 < Task::Base
      protected

      def succeed!
        customer.personal3_did_succeed!
      end

      def fail_with_error!(message, backtrace)
        customer.personal3_did_fail_with_error!(message, backtrace)
      end

      def url
        "https://www.immigration.govt.nz/WorkingHoliday/Wizard/Personal3.aspx?ApplicationId=#{application_id}&IndividualType=Primary&IndividualIndex=1"
      end

      def do_execute
        visit(url) if current_url != url

        fill_in("ctl00_ContentPlaceHolder1_generalPersonal_industryControl_optionListSearch_SearchStringTextBox", with: customer.industry)
        find("#ctl00_ContentPlaceHolder1_generalPersonal_industryControl_optionListSearch_SearchImageButton").click
        find("#ctl00_ContentPlaceHolder1_generalPersonal_industryControl_optionListSearch_SearchResultRepeater_ctl01_selectImageButton").click

        fill_in("ctl00_ContentPlaceHolder1_generalPersonal_occupationControl_optionListSearch_SearchStringTextBox", with: customer.occupation)
        find("#ctl00_ContentPlaceHolder1_generalPersonal_occupationControl_optionListSearch_SearchImageButton").click
        find("#ctl00_ContentPlaceHolder1_generalPersonal_occupationControl_optionListSearch_SearchResultRepeater_ctl01_selectImageButton").click

        find("#ctl00_ContentPlaceHolder1_wizardPageFooter_wizardPageNavigator_validateButton").click
      end
    end
  end
end
