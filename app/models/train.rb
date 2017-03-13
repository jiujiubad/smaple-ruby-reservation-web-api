class Train < ApplicationRecord

	validates_presence_of :number
	has_many :reservations

  # ["1A", "1B", "1C", "1D", "1F", "2A", "2B", "2C", "2D", "2F", "3A", "3B", "3C", "3D", "3F", "4A", "4B", "4C", "4D", "4F", "5A", "5B", "5C", "5D", "5F", "6A", "6B", "6C", "6D", "6F", "7A", "7B", "7C", "7D", "7F", "8A", "8B", "8C", "8D", "8F", "9A", "9B", "9C", "9D", "9F", "10A", "10B", "10C", "10D", "10F", "11A", "11B", "11C", "11D", "11F", "12A", "12B", "12C", "12D", "12F", "13A", "13B", "13C", "13D", "13F"]
	SEATS = begin
		(1..13).to_a.map do |series|
			["A","B","C","D","F"].map do |letter|
			 "#{series}#{letter}"
			end
		end
	end.flatten

	def available_seats
		# TODO: SEATS 扣掉已經訂位的資料
		return SEATS
	end

end
