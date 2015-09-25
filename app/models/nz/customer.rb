class NZ::Customer < Customer
  store_accessor :fields, *Settings::Fields.nz

  def female?
    personal_details_gender == "Female"
  end

  def personal_details_first_name
    [personal_details_given_name_1, personal_details_given_name_2, personal_details_given_name_3].compact.join(' ')
  end

  def personal_details_full_name
    [personal_details_first_name, personal_details_family_name.upcase].join(' ')
  end
end
