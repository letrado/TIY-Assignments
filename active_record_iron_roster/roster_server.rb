require "webrick"
require "./roster"

server = WEBrick::HTTPServer.new(:Port => 8000)

server.mount_proc "/home" do |request, response|
  @roster = Roster.all
  template = ERB.new(File.read "roster_home.html")
  response.body = template.result
end



server.start
