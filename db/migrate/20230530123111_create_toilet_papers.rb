class CreateToiletPapers < ActiveRecord::Migration[7.0]
  def change
    create_table :toilet_papers do |t|
      t.string :color
      t.string :thikness
      t.string :scent
      t.integer :lenght
      t.integer :price
      t.boolean :used
      t.boolean :premium

      t.timestamps
    end
  end
end
