class Customer < ActiveRecord::Base
  has_many :application_events

  def female?
    gender == "Female"
  end

  def full_name
    [given_name, family_name.upcase].join(" ")
  end

  def given_name
    [given_name_1, given_name_2, given_name_3].compact.join(" ")
  end

  def country_name_of_birth
    ISO3166::Country[country_of_birth].name
  end

  def country_name
    ISO3166::Country[country].name
  end
end
