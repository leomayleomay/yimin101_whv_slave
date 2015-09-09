class AdminMailer < ActionMailer::Base
  default from: "slave@yimin101.com", to: "devops.yimin101@gmail.com", body: ''

  def failed_to_signup(customer)
    mail(
      subject: "[#{ENV['HOSTNAME']}] Cannot signup customer #{customer.id} on immigration website"
    )
  end

  def no_customer_found
    mail(
      subject: "[#{ENV['HOSTNAME']}] No customer found"
    )
  end
end
