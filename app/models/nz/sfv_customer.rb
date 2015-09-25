class NZ::SfvCustomer < NZ::Customer
  def self.events
    Settings::Events.nz.sfv
  end

  include EventHandler
end
