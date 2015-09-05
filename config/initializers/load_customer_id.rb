if File.exists?(Rails.root.join("CUSTOMER_ID"))
  CUSTOMER_ID = File.read(Rails.root.join('CUSTOMER_ID')).chop.freeze
else
  CUSTOMER_ID = nil
end