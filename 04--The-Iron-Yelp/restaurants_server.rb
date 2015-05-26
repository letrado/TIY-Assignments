require "webrick"
require "erb"
require "json"
require "./restaurant"


server = WEBrick::HTTPServer.new(:Port => 8000)

restaurants_file = File.read "restaurants.json"
restaurants_array = JSON.parse restaurants_file

server.mount_proc "/home" do |request, response|
	template = ERB.new(File.read "restaurants_home.html.erb")
	response.body = template.result
end



server.mount_proc "/shutdown" do |request, response|
	response.body = "Jajatopata, Auf widersehen, Au revoir, Ciao, Hasta Pronto, Ate Logo, Goodbye, See You, I wouldn't Want to be You!"
	server.shutdown
end

server.mount_proc "/cuisines" do |request, response|
	#@cuisines = "cuisines"
	#@restaurants = restaurants_hash.select{|restaurant| restaurant["cuisines"].include?("Vegetarian")}

	template = ERB.new(File.read "cuisines.html.erb")
	response.body = template.result

end

server.mount_proc "/vegetarian" do |request, response|
	@cuisines = "Vegetarian"
	@restaurants = Restaurant.all

	template = ERB.new(File.read "cuis_temp.html.erb")
	response.body = template.result

end

server.mount_proc "/price" do |request, response|

	template = ERB.new(File.read "price.html.erb")
	response.body = template.result

end



server.start
