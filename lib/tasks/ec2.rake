namespace :ec2 do
  task :create => :environment do
    Customer.find_each do |customer|
      system("bash", "-c", "ALIAS=#{customer.id} ROLES=app cap rubber:create")
      system("bash", "-c", "cap rubber:bootstrap")
    end
  end

  task :destroy_all do
    system("bash", "-c", "echo yes | cap rubber:destroy_all")
  end
end