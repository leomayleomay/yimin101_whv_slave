class Customer < ActiveRecord::Base
  has_many :application_events
end
