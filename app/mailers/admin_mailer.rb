class AdminMailer < ActionMailer::Base
  default from: "slave@yimin101.com", to: "leomayleomay@gmail.com", body: ''

  def failed_to_signup(customer)
    mail(
      subject: "Cannot signup customer #{customer.id} on immigration website"
    )
  end

  def no_customer_found(customer_id)
    if customer_id
      mail(
        subject: "No customer found for #{customer_id}"
      )
    else
      mail(
        subject: "No CUSTOMER_ID set for the slave"
      )
    end
  end
end