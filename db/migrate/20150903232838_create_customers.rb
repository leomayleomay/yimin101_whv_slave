class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.integer :user_id, null: false
      t.string :type, null: false
      t.string :email, null: false
      t.string :username, null: false
      t.string :password, null: false
      t.string :secret_question, null: false
      t.string :secret_answer, null: false
      t.string :family_name, null: false
      t.string :given_name_1, null: false
      t.string :given_name_2
      t.string :given_name_3
      t.string :other_names
      t.string :preferred_title
      t.string :other_title
      t.string :gender
      t.date :date_of_birth
      t.string :country_of_birth
      t.string :street_number
      t.string :street_name
      t.string :suburb
      t.string :city
      t.string :province
      t.string :zipcode
      t.string :country
      t.string :phone_daytime
      t.string :phone_night
      t.string :phone_mobile
      t.string :fax
      t.string :passport_number
      t.date :passport_expiry_date
      t.string :identification_type
      t.date :identification_issued_date
      t.date :identification_expiry_date
      t.string :industry
      t.string :occupation
      t.string :renal_dialysis
      t.string :tuberculosis
      t.string :cancer
      t.string :heart_disease
      t.string :disability
      t.string :hospitalisation
      t.string :residential_care
      t.string :pregnant
      t.text :medical_conditions, limit: 2000
      t.string :tuberculosis_risk
      t.string :imprisionment_of_5_years_or_more
      t.string :imprisionment_of_12_months_or_more
      t.string :removal_order
      t.string :deported
      t.date :deportion_date
      t.string :deportion_country
      t.string :charged
      t.string :convicted
      t.string :under_investigation
      t.string :excluded
      t.string :removed
      t.text :exclude_removal_details, limit: 2000
      t.string :previous_whv_permit
      t.string :sufficient_funds
      t.date :intended_travel_date
      t.date :intended_leave_date
      t.string :length_of_stay
      t.string :been_to_nz_before
      t.date :when_in_nz_date
      t.string :sufficient_funds_for_onward_ticket
      t.string :read_requirements
      t.string :application_id

      t.timestamps null: false
    end
  end
end
