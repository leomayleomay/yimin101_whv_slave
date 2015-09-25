class NZ::Customer < Customer
  store_accessor :fields, *Settings::Fields.nz

  def female?
    gender == "Female"
  end

  def first_name
    [given_name_1, given_name_2, given_name_3].compact.join(' ')
  end

  def full_name
    [first_name, family_name.upcase].join(' ')
  end
end
