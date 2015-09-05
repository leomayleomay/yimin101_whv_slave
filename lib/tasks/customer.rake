namespace :customer do
  desc "signup the customers"
  task :signup => :environment do
    customer = Customer.find_by_id(CUSTOMER_ID) if CUSTOMER_ID

    if customer
      Task::Signup.new(customer).execute

      if customer.failed_signup?
        AdminMailer.failed_to_signup(customer)
      end
    else
      AdminMailer.no_customer_found(CUSTOMER_ID).deliver_now
    end
  end

  desc "apply WHV"
  task :whv => :environment do
    customer = Customer.find_by_id(CUSTOMER_ID) if CUSTOMER_ID

    if customer
      ApplyWhv.new(customer).call
    else
      AdminMailer.no_customer_found(CUSTOMER_ID).deliver_now
    end
  end
end