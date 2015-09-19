module Task
  module NZ
    module Sfv
      class Medical1 < Task::Base
        protected

        def succeed!
          customer.medical1_did_succeed!
        end

        def fail_with_error!(message, backtrace)
          customer.medical1_did_fail_with_error!(message, backtrace)
        end

        def errors
          return @errors if @errors

          tab = find("#ctl00_ContentPlaceHolder1_wizardPageHeader_nav_sectionTabs_TabHeaders_ctl01_statusImage")
          if tab[:title] == "Completed"
            @errors = []
          else
            @errors = ["Health fails, please login to check"]
          end

          @errors
        end

        def url
          "https://www.immigration.govt.nz/SilverFern/Wizard/Medical1.aspx?ApplicationId=#{application_id}&IndividualType=Primary&IndividualIndex=1"
        end

        def do_execute
          visit(url)
        end
      end
    end
  end
end