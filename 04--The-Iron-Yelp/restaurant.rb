require 'json'

class Restaurant
  attr_reader :name, :address, :website, :hours, :price, 
              :cuisines, :ratings

  def initialize(name, address, website, hours, price, 
              cuisines, ratings)
    @name = name
    @address = address
    @website = website
    @hours = hours
    @price = price
    @cuisines = cuisines
    @ratings = ratings
  end

  def to_s
    self.name 
  end

  def veggie
    if self.cuisines.include?("Vegetarian")
      put
  end

  

  def self.all
    restaurants_file = File.read "restaurants.json"
    restaurants_array = JSON.parse restaurants_file
    restaurants = restaurants_array.map do |restaurant_hash|
      Restaurant.new(restaurant_hash["name"], restaurant_hash["address"],
                restaurant_hash["website"], restaurant_hash["hours"], 
                restaurant_hash["price"], restaurant_hash["cuisines"], 
                restaurant_hash["ratings"]) 
    end
  end
end

#puts Restaurant.all.each{|restaurant| puts restaurant.to_s}
#puts Restaurant.all
puts Restaurant.all{|restaurant| puts restaurant.veggie}
#puts Restaurant.all 


