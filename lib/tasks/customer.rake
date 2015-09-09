namespace :customer do
  desc :load_customer => :environment do
    @customer = Marshal.load(Rails.root.join("customer.dump"))
  end

  desc "signup the customers"
  task :signup => :environment do
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
  task :whv => :environment do
    if @customer
      ApplyWhv.new(@customer).call
    else
      AdminMailer.no_customer_found.deliver_now
    end
  end
end
