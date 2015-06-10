class Fixnum

	def to_roman
		array = %w(zero I II III IV V VI VII VIII IX X)
		xs = %w(zero IX X XI XII XIII XIV XV XVI XVII XVIII XIX XX)
		case self
		when (1..10)			
			array[self]		
		when (11..20)			
			xs[self - 8]
		when (21..40)
			if self < 31
			"X" + xs[self - 18]
			elsif self < 40
				"XX" + xs[self - 28]
			else
				"XL"
			end
		when (41..50)
			if self < 50
				"XL" + array[self - 40]
			else
				"L"
			end
		when (51..89)
			if self <= 60
				"L" + array[self - 50]
			elsif self <= 70
				"L" + xs[self - 58]
			elsif self <= 80
				"LX" + xs[self - 68]
			else
				"LXX" + xs[self - 78]
			end
			


			
		

			

		
		# if self == 1
		# 	"I"
		# else
		# 	"II"
		# end
		end
	end
end
