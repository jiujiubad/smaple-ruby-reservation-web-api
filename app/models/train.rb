class Train < ApplicationRecord

	validates_presence_of :number
	has_many :reservations

	mount_uploader :train_logo, TrainLogoUploader

  # ["1A", "1B", "1C", "2A", "2B", "2C", "3A", "3B", "3C", "4A", "4B", "4C", "5A", "5B", "5C", "6A", "6B", "6C"]
	SEATS = begin
		(1..6).to_a.map do |series|
			["A","B","C"].map do |letter|
			 "#{series}#{letter}"
			end
		end
	end.flatten

	def available_seats
		# 所有 SEATS 扣掉已經訂位的資料
		return SEATS - self.reservations.pluck(:seat_number)
	end

end
