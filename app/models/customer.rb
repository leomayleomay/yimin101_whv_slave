class Customer < ActiveRecord::Base
  # http://api.rubyonrails.org/classes/ActiveRecord/Store.html
  store :fields, coder: JSON

  has_many :application_events

  scope :paid, -> { joins(:application_events).merge(ApplicationEvent.payment_successful).uniq }
end
