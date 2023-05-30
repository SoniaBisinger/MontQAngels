class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.string :location
      t.date :arrival_date
      t.integer :quantity
      t.boolean :validate

      t.timestamps
    end
  end
end
