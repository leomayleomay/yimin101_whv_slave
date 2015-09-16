class Customer < ActiveRecord::Base
  has_many :application_events

  scope :successful, -> {joins(:application_events).merge(ApplicationEvent.payment_successful).uniq}

  def female?
    gender == "Female"
  end

  def full_name
    [given_name_1, given_name_2, given_name_3, family_name.upcase].compact.join(' ')
  end
end
