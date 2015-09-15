class Customer < ActiveRecord::Base
  has_many :application_events

  scope :successful, -> {joins(:application_events).merge(ApplicationEvent.payment_successful).uniq}
end