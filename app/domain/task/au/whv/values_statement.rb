module Task
  module AU
    module Whv
      class ValuesStatement < Task::AU::Base
        protected

        def succeed!
          customer.values_statement_did_succeed!
        end

        def fail_with_error!(message, backtrace)
          customer.values_statement_did_fail_with_error!(message, backtrace)
        end

        def errors
          @errors ||= all("font ul li").collect {|e| e.text}
        end

        def url
          "https://online.immi.gov.au/visas/valuesStatement.do"
        end

        def do_execute
          visit(url)

          fill_in("applicant_name_family", with: customer.family_name)
          fill_in("applicant_name_given", with: customer.given_name_1)
          select(customer.gender, from: "applicant_sex")
          select(customer.date_of_birth.strftime("%d"), from: "applicant_dob_day")
          select(customer.date_of_birth.strftime("%b"), from: "applicant_dob_month")
          select(customer.date_of_birth.strftime("%Y"), from: "applicant_dob_year")
          select(customer.marital_status, from: "applicant_marital_status")
          fill_in("applicant_birth_town", with: customer.city_of_birth)
          select(customer.country_of_birth, from: "applicant_birth_country")
          select(customer.country_of_residence, from: "applicant_offshore_residential_country")
          fill_in("applicant_travel_passport_number", with: customer.passport_number)
          select(customer.passport_country, from: "applicant_travel_passport_country")
          select(customer.passport_nationality, from: "applicant_travel_passport_nationality")
          select(customer.passport_issue_date.strftime("%d"), from: "applicant_travel_passport_issue_day")
          select(customer.passport_issue_date.strftime("%b"), from: "applicant_travel_passport_issue_month")
          select(customer.passport_issue_date.strftime("%Y"), from: "applicant_travel_passport_issue_year")
          select(customer.passport_expiry_date.strftime("%d"), from: "applicant_travel_passport_expiry_day")
          select(customer.passport_expiry_date.strftime("%b"), from: "applicant_travel_passport_expiry_month")
          select(customer.passport_expiry_date.strftime("%Y"), from: "applicant_travel_passport_expiry_year")
          fill_in("applicant_travel_passport_issue_place", with: customer.passport_issue_place)


          click_button("Save")
        end
      end
    end
  end
end
