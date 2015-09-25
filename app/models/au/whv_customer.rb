class AU::WhvCustomer < Customer
  def self.events
    [
      "login",
      "signup",
      "apply_now",
      "values_statement"
    ].freeze
  end

  include EventHandler
end