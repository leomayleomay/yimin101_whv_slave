module Task
  module NZ
    class Signup < Task::Base
      protected

      def executed?
        false
      end

      def succeed!
        customer.signup_did_succeed!
      end

      def fail_with_error!(message, backtrace)
        customer.signup_did_fail_with_error!(message, backtrace)
      end

      def url
        "https://www.immigration.govt.nz/registration/default.aspx"
      end

      def do_execute
        visit(url)

        fill_in("registrationDetails_firstNameTextBox", with: customer.first_name)
        fill_in("registrationDetails_familyNameTextBox", with: customer.family_name)
        fill_in("registrationDetails_emailAddressTextBox", with: customer.email)
        fill_in("registrationDetails_userNameTextBox", with: customer.username)
        fill_in("registrationDetails_passwordTextBox", with: customer.password)
        fill_in("registrationDetails_passwordConfirmTextBox", with: customer.password)
        select(customer.secret_question, from: "registrationDetails_secretQuestionDropDownList")
        fill_in("registrationDetails_secretAnswerTextBox", with: customer.answer_to_secret_question)
        check("registrationDetails_agreeToConditionsCheckBox")

        find("#registerImageButton").click
      end
    end
  end
end
