module Task
  module Whv
    class Personal1 < Task::Base
      protected

      def succeed!
        customer.personal1_did_succeed!
      end

      def fail_with_error!(message, backtrace)
        customer.personal1_did_fail_with_error!(message, backtrace)
      end

      def url
        "https://www.immigration.govt.nz/WorkingHoliday/Wizard/Personal1.aspx?ApplicationId=#{application_id}&IndividualType=Primary&IndividualIndex=1"
      end

      def do_execute
        visit(url)

        fill_in("ctl00_ContentPlaceHolder1_personDetails_familyNameTextBox", with: customer.family_name)
        fill_in("ctl00_ContentPlaceHolder1_personDetails_givenName1Textbox", with: customer.given_name_1)
        fill_in("ctl00_ContentPlaceHolder1_personDetails_givenName2Textbox", with: customer.given_name_2) if customer.given_name_2.present?
        fill_in("ctl00_ContentPlaceHolder1_personDetails_givenName3Textbox", with: customer.given_name_3) if customer.given_name_3.present?
        fill_in("ctl00_ContentPlaceHolder1_personDetails_otherNamesTextBox", with: customer.other_names) if customer.other_names.present?
        select(customer.preferred_title, from: "ctl00_ContentPlaceHolder1_personDetails_titleDropDownList")
        fill_in("ctl00_ContentPlaceHolder1_personDetails_otherTitleTextBox", with: customer.other_title) if customer.other_title.present?
        select(customer.gender, from: "ctl00_ContentPlaceHolder1_personDetails_genderDropDownList")
        select(customer.date_of_birth.strftime("%d"), from: "ctl00_ContentPlaceHolder1_personDetails_dateOfBithDatePicker_Day")
        select(customer.date_of_birth.strftime("%b"), from: "ctl00_ContentPlaceHolder1_personDetails_dateOfBithDatePicker_Month")
        select(customer.date_of_birth.strftime("%Y"), from: "ctl00_ContentPlaceHolder1_personDetails_dateOfBithDatePicker_Year")
        # select(customer.country_name_of_birth, from: "ctl00_ContentPlaceHolder1_personDetails_CountryDropDownList")
        select("China", from: "ctl00_ContentPlaceHolder1_personDetails_CountryDropDownList")
        fill_in("ctl00_ContentPlaceHolder1_addressContactDetails_address_streetNumberTextbox", with: customer.street_number) if customer.street_number.present?
        fill_in("ctl00_ContentPlaceHolder1_addressContactDetails_address_address1TextBox", with: customer.street_name)
        fill_in("ctl00_ContentPlaceHolder1_addressContactDetails_address_suburbTextBox", with: customer.suburb) if customer.suburb.present?
        fill_in("ctl00_ContentPlaceHolder1_addressContactDetails_address_cityTextBox", with: customer.city)
        fill_in("ctl00_ContentPlaceHolder1_addressContactDetails_address_provinceStateTextBox", with: customer.province) if customer.province.present?
        fill_in("ctl00_ContentPlaceHolder1_addressContactDetails_address_postalCodeTextBox", with: customer.zipcode) if customer.zipcode.present?
        # select(customer.country_name, from: "ctl00_ContentPlaceHolder1_addressContactDetails_address_countryDropDownList")
        select("China", from: "ctl00_ContentPlaceHolder1_addressContactDetails_address_countryDropDownList")
        fill_in("ctl00_ContentPlaceHolder1_addressContactDetails_contactDetails_phoneNumberTextBox", with: customer.phone_daytime) if customer.phone_daytime.present?
        fill_in("ctl00_ContentPlaceHolder1_addressContactDetails_contactDetails_phoneNumberNightTextBox", with: customer.phone_night) if customer.phone_night.present?
        fill_in("ctl00_ContentPlaceHolder1_addressContactDetails_contactDetails_phoneNumberMobileTextBox", with: customer.phone_mobile)
        fill_in("ctl00_ContentPlaceHolder1_addressContactDetails_contactDetails_faxNumberTextbox", with: customer.fax) if customer.fax.present?
        fill_in("ctl00_ContentPlaceHolder1_addressContactDetails_contactDetails_emailAddressTextBox", with: customer.email)
        select("No", from: "ctl00_ContentPlaceHolder1_hasAgent_representedByAgentDropdownlist")
        select("Email", from: "ctl00_ContentPlaceHolder1_communicationMethod_communicationMethodDropDownList")
        select("Yes", from: "ctl00_ContentPlaceHolder1_hasCreditCard_hasCreditCardDropDownlist")

        find("#ctl00_ContentPlaceHolder1_wizardPageFooter_wizardPageNavigator_validateButton").click
      end
    end
  end
end
