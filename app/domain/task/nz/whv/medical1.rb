module Task
  module NZ
    module Whv
      class Medical1 < Task::NZ::Base
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
          "https://www.immigration.govt.nz/WorkingHoliday/Wizard/Medical1.aspx?ApplicationId=#{application_id}&IndividualType=Primary&IndividualIndex=1"
        end

        def do_execute
          visit(url)

          # select(customer.medical_conditions_renal_dialysis, from: "ctl00_ContentPlaceHolder1_medicalConditions_renalDialysisDropDownList")
          # select(customer.medical_conditions_tuberculosis, from: "ctl00_ContentPlaceHolder1_medicalConditions_tuberculosisDropDownList")
          # select(customer.medical_conditions_cancer, from: "ctl00_ContentPlaceHolder1_medicalConditions_cancerDropDownList")
          # select(customer.medical_conditions_heart_disease, from: "ctl00_ContentPlaceHolder1_medicalConditions_heartDiseaseDropDownList")
          # select(customer.medical_conditions_disability, from: "ctl00_ContentPlaceHolder1_medicalConditions_disabilityDropDownList")
          # select(customer.medical_conditions_hospitalisation, from: "ctl00_ContentPlaceHolder1_medicalConditions_hospitalisationDropDownList")
          # select(customer.medical_conditions_residential_care, from: "ctl00_ContentPlaceHolder1_medicalConditions_residentailCareDropDownList")
          # select(customer.medical_conditions_pregnancy_status, from: "ctl00_ContentPlaceHolder1_medicalConditions_pregnancy_pregnancyStatusDropDownList") if customer.female?
          # fill_in("ctl00_ContentPlaceHolder1_medicalConditions_healthDetailsIntergenTextBox", with: customer.medical_conditions_health_details) if customer.medical_conditions_health_details.present?
          # select(customer.medical_conditions_tb_risk, from: "ctl00_ContentPlaceHolder1_medicalConditions_tbRiskDropDownList")

          select("No", from: "ctl00_ContentPlaceHolder1_medicalConditions_renalDialysisDropDownList")
          select("No", from: "ctl00_ContentPlaceHolder1_medicalConditions_tuberculosisDropDownList")
          select("No", from: "ctl00_ContentPlaceHolder1_medicalConditions_cancerDropDownList")
          select("No", from: "ctl00_ContentPlaceHolder1_medicalConditions_heartDiseaseDropDownList")
          select("No", from: "ctl00_ContentPlaceHolder1_medicalConditions_disabilityDropDownList")
          select("No", from: "ctl00_ContentPlaceHolder1_medicalConditions_hospitalisationDropDownList")
          select("No", from: "ctl00_ContentPlaceHolder1_medicalConditions_residentailCareDropDownList")
          select("No", from: "ctl00_ContentPlaceHolder1_medicalConditions_pregnancy_pregnancyStatusDropDownList") if customer.female?
          select("No", from: "ctl00_ContentPlaceHolder1_medicalConditions_tbRiskDropDownList")

          find("#ctl00_ContentPlaceHolder1_wizardPageFooter_wizardPageNavigator_validateButton").click
        end
      end
    end
  end
end
