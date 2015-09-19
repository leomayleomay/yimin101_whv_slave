class NZ::WhvCustomer < Customer
  def self.events
    [
      "login",
      "signup",
      "apply_now",
      "personal1",
      "personal2",
      "personal3",
      "medical1",
      "character",
      "whv_specific",
      "submit",
      "pay"
    ].freeze
  end

  include EventHandler
end