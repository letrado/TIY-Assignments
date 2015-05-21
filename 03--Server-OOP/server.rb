require "webrick"
require "erb"

server = WEBrick::HTTPServer.new(:Port => 8000)

server.mount_proc "/home" do |request, response|
  response.body= File.read "home.html"
end


server.mount_proc "/shutdown" do |request, response|
  response.body = "Jajatopata, Auf widersehen, Au revoir, Ciao, Hasta Pronto, Ate Logo, Goodbye, etc."
  server.shutdown
end

server.start
