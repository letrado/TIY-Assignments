require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './fixnuma'

class NumberToRomanTest < MiniTest::Test

	def test_1_to_I
		assert_equal "I", 1.to_roman
	end

	def test_2_to_II
		assert_equal "II", 2.to_roman
	end

	def test_3_to_III
		assert_equal "III", 3.to_roman
	end

	def test_8_to_VIII
		assert_equal "VIII", 8.to_roman
	end

	def test_9_to_IX
		assert_equal "IX", 9.to_roman
	end

	def test_12_to_XII
		assert_equal "XII", 12.to_roman
	end

	def test_18_to_XII
		assert_equal "XVIII", 18.to_roman
	end

	def test_19_to_XIX
		assert_equal "XIX", 19.to_roman
	end

	def test_23_to_XXIII
		assert_equal "XXIII", 23.to_roman
	end

	def test_29_to_XXIX
		assert_equal "XXIX", 29.to_roman
	end

	def test_32_to_XXIX
		assert_equal "XXXII", 32.to_roman
	end

	def test_38_to_XXXVIII
		assert_equal "XXXVIII", 38.to_roman
	end

	def test_39_to_XXXIX
		assert_equal "XXXIX", 39.to_roman
	end

	def test_40_to_XL
		assert_equal "XL", 40.to_roman
	end

	def test_45_to_XLV
		assert_equal "XLV", 45.to_roman
	end

	def test_47_to_XLVII
		assert_equal "XLVII", 47.to_roman
	end

	def test_50_to_L
		assert_equal "L", 50.to_roman
	end

	def test_51_to_LI
		assert_equal "LI", 51.to_roman
	end

	def test_57_to_LVII
		assert_equal "LVII", 57.to_roman
	end

	def test_60_to_LX
		assert_equal "LX", 60.to_roman
	end

	def test_80_to_LXXX
		assert_equal "LXXX", 80.to_roman
	end

	def test_87_to_LXXXVII
		assert_equal "LXXXVII", 87.to_roman
	end



end
