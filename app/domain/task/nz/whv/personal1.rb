module Task
  module NZ
    module Whv
      class Personal1 < Task::NZ::Base
        protected

        def succeed!
          customer.personal1_did_succeed!
        end

        def fail_with_error!(message, backtrace)
          customer.personal1_did_fail_with_error!(message, backtrace)
        end

        def errors
          @errors ||= all(".ErrorMessageSmall").collect {|m| m.text}.select {|e| e != "&nbsp;*"}
        end

        def url
          "https://www.immigration.govt.nz/WorkingHoliday/Wizard/Personal1.aspx?ApplicationId=#{application_id}&IndividualType=Primary&IndividualIndex=1"
        end

        def do_execute
          visit(url)

          fill_in("ctl00_ContentPlaceHolder1_personDetails_familyNameTextBox", with: customer.personal_details_family_name)
          fill_in("ctl00_ContentPlaceHolder1_personDetails_givenName1Textbox", with: customer.personal_details_given_name_1)
          fill_in("ctl00_ContentPlaceHolder1_personDetails_givenName2Textbox", with: customer.personal_details_given_name_2) if customer.personal_details_given_name_2.present?
          fill_in("ctl00_ContentPlaceHolder1_personDetails_givenName3Textbox", with: customer.personal_details_given_name_3) if customer.personal_details_given_name_3.present?
          fill_in("ctl00_ContentPlaceHolder1_personDetails_otherNamesTextBox", with: customer.personal_details_other_names) if customer.personal_details_other_names.present?
          select(customer.personal_details_title, from: "ctl00_ContentPlaceHolder1_personDetails_titleDropDownList")
          fill_in("ctl00_ContentPlaceHolder1_personDetails_otherTitleTextBox", with: customer.personal_details_other_title) if customer.personal_details_other_title.present?
          select(customer.personal_details_gender, from: "ctl00_ContentPlaceHolder1_personDetails_genderDropDownList")
          select(customer.personal_details_date_of_birth.strftime("%d"), from: "ctl00_ContentPlaceHolder1_personDetails_dateOfBithDatePicker_Day")
          select(customer.personal_details_date_of_birth.strftime("%b"), from: "ctl00_ContentPlaceHolder1_personDetails_dateOfBithDatePicker_Month")
          select(customer.personal_details_date_of_birth.strftime("%Y"), from: "ctl00_ContentPlaceHolder1_personDetails_dateOfBithDatePicker_Year")
          # select(customer.personal_details_country, from: "ctl00_ContentPlaceHolder1_personDetails_CountryDropDownList")
          select("China", from: "ctl00_ContentPlaceHolder1_personDetails_CountryDropDownList")
          fill_in("ctl00_ContentPlaceHolder1_addressContactDetails_address_streetNumberTextbox", with: customer.address_street_number) if customer.address_street_number.present?
          fill_in("ctl00_ContentPlaceHolder1_addressContactDetails_address_address1TextBox", with: customer.address_address_1)
          fill_in("ctl00_ContentPlaceHolder1_addressContactDetails_address_suburbTextBox", with: customer.address_suburb) if customer.address_suburb.present?
          fill_in("ctl00_ContentPlaceHolder1_addressContactDetails_address_cityTextBox", with: customer.address_city)
          fill_in("ctl00_ContentPlaceHolder1_addressContactDetails_address_provinceStateTextBox", with: customer.address_province_state) if customer.address_province_state.present?
          fill_in("ctl00_ContentPlaceHolder1_addressContactDetails_address_postalCodeTextBox", with: customer.address_postal_code) if customer.address_postal_code.present?
          # select(customer.address_country, from: "ctl00_ContentPlaceHolder1_addressContactDetails_address_countryDropDownList")
          select("China", from: "ctl00_ContentPlaceHolder1_addressContactDetails_address_countryDropDownList")
          fill_in("ctl00_ContentPlaceHolder1_addressContactDetails_contactDetails_phoneNumberTextBox", with: customer.contact_details_phone_number) if customer.contact_details_phone_number.present?
          fill_in("ctl00_ContentPlaceHolder1_addressContactDetails_contactDetails_phoneNumberNightTextBox", with: customer.contact_details_phone_number_night) if customer.contact_details_phone_number_night.present?
          fill_in("ctl00_ContentPlaceHolder1_addressContactDetails_contactDetails_phoneNumberMobileTextBox", with: customer.contact_details_phone_number_mobile)
          fill_in("ctl00_ContentPlaceHolder1_addressContactDetails_contactDetails_faxNumberTextbox", with: customer.contact_details_fax_number) if customer.contact_details_fax_number.present?
          fill_in("ctl00_ContentPlaceHolder1_addressContactDetails_contactDetails_emailAddressTextBox", with: customer.contact_details_email_address)
          select("No", from: "ctl00_ContentPlaceHolder1_hasAgent_representedByAgentDropdownlist")
          select("Email", from: "ctl00_ContentPlaceHolder1_communicationMethod_communicationMethodDropDownList")
          select("Yes", from: "ctl00_ContentPlaceHolder1_hasCreditCard_hasCreditCardDropDownlist")

          find("#ctl00_ContentPlaceHolder1_wizardPageFooter_wizardPageNavigator_validateButton").click
        end
      end
    end
  end
end
