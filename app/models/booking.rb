class Booking < ApplicationRecord
    belongs_to :user
    belongs_to :toilet_paper
    
end
