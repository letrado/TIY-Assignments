car_data = IO.readlines("mtcars.csv")

class Car

attr_reader :name, :gas_mileage, :n_cylinders, :horsepower, :weight, :quarter_mile_time

	def initialize(name, gas_mileage, n_cylinders, horsepower, weight, quarter_mile_time)
		@name = name
		@gas_mileage = gas_mileage
		@n_cylinders = n_cylinders
		@horsepower = horsepower
		@weight = weight
		@quarter_mile_time = quarter_mile_time
	end
end

cars = car_data.map do |line|
	line.gsub('"', "")
	car_info = line.split(",")
Car.new(car_info[0], car_info[1].to_i, car_info[2].to_i, car_info[4].to_i, car_info[6].to_f, car_info[7].to_i)
end
puts cars.length
puts cars

puts cars.max_by{|car| car.gas_mileage}.gas_mileage

heavy_cars = cars.select{|car| car.weight > 3.5 }
puts heavy_cars
puts cars.map{|car| car.weight * 1000}

