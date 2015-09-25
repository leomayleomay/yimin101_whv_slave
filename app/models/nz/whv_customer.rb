class NZ::WhvCustomer < NZ::Customer
  def self.events
    Settings::Events.nz.whv
  end

  include EventHandler
end
