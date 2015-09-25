module Task
  module NZ
    module Sfv
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
            @errors = ["SFV Specific fails, please login to check"]
          end

          @errors
        end

        def url
          "https://www.immigration.govt.nz/SilverFern/Wizard/SilverFernSpecific.aspx?ApplicationId=#{application_id}&IndividualType=Primary&IndividualIndex=1"
        end

        def do_execute
          visit(url)
        end
      end
    end
  end
end
