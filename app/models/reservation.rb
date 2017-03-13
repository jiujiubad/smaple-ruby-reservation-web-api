class Reservation < ApplicationRecord

	validates_presence_of :train_id, :seat_number, :booking_code
	belongs_to :train

end
