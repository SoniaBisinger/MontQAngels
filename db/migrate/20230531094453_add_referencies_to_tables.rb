class AddReferenciesToTables < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookings, :user, foreign_key: true
    add_reference :bookings, :toilet_paper, foreign_key: true
    add_reference :toilet_papers, :user, foreign_key: true
    add_reference :toilet_papers, :booking, foreign_key: true 
  end
end
