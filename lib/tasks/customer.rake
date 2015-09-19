require 'socket'

namespace :nz do
  namespace :customer do
    task :load_customer => :environment do
      hostname = Socket.gethostname
      customer_id = hostname.split('.').first if hostname
      @customer = Customer.find_by_id(customer_id) if customer_id
    end

    desc "signup the customers"
    task :signup => :load_customer do
      if @customer
        Task::NZ::Signup.new(@customer).execute

        if @customer.signup_failed?
          AdminMailer.failed_to_signup(@customer)
        end
      else
        AdminMailer.no_customer_found.deliver_now
      end
    end

    desc "apply WHV"
    task :whv => :load_customer do
      if @customer
        NZ::ApplyWhv.new(@customer).call
      else
        AdminMailer.no_customer_found.deliver_now
      end
    end

    desc "apply SFV"
    task :sfv => :load_customer do
      if @customer
        NZ::ApplySfv.new(@customer).call
      else
        AdminMailer.no_customer_found.deliver_now
      end
    end
  end
end