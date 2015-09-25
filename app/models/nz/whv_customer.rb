class NZ::WhvCustomer < Customer
  store_accessor :fields, *Settings::Fields.nz.whv_customer.flatten

  def self.events
    Settings::Events.nz.whv_customer
  end

  include EventHandler
end
