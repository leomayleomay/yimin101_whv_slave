class CreateApplicationEvents < ActiveRecord::Migration
  def change
    create_table :application_events do |t|
      t.integer :customer_id
      t.string :name
      t.boolean :successful
      t.text :message
      t.text :backtrace, limit: 2000

      t.timestamps null: false
    end
  end
end
