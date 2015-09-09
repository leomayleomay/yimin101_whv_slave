class AdminMailer < ActionMailer::Base
  default from: "slave@yimin101.com", to: "leomayleomay@gmail.com", body: ''

  def failed_to_signup(customer)
    mail(
      subject: "Cannot signup customer #{customer.id} on immigration website"
    )
  end

  def no_customer_found
    mail(
      subject: "No customer found"
    )
  end
end
