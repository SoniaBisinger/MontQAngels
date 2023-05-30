class Toilet_paper < ApplicationRecord
  t.string :color
  t.integer :thickness
  t.string :scent
  t.integer :length
  t.integer :price
  t.boolean :used, default: false
  t.boolean :premium, default: false

validates :thickness, :scent, :length, :price, :used, :premium, :color, presence: true
end
