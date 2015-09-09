namespace :customer do
  desc :load_customer => :environment do
    @customer = Customer.find_by_id(ENV['HOSTNAME'].split('.')[0])
  end

  desc "signup the customers"
  task :signup => :load_customer do
    if @customer
      Task::Signup.new(@customer).execute

      if @customer.failed_signup?
        AdminMailer.failed_to_signup(@customer)
      end
    else
      AdminMailer.no_customer_found.deliver_now
    end
  end

  desc "apply WHV"
  task :whv => :load_customer do
    if @customer
      ApplyWhv.new(@customer).call
    else
      AdminMailer.no_customer_found.deliver_now
    end
  end
end