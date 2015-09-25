class NZ::SfvCustomer < Customer
  store_accessor :fields, *Settings::Fields.nz.sfv_customer.flatten

  def self.events
    Settings::Events.nz.sfv_customer
  end

  include EventHandler
end
