class ChangingDateType < ActiveRecord::Migration[7.0]
  def change
    change_column :bookings, :arrival_date, :datetime
  end
end
