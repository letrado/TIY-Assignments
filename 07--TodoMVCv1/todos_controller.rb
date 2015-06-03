require 'webrick'
require './todos.rb'

server = WEBrick::HTTPServer.new(Port: 8000, DocumentRoot: "./public")


server.mount_proc "/todos" do |request, response|
  # populate some instance variables in here
  @todos = Todo.all
  template = ERB.new(File.read "index.html.erb")
  response.body = template.result
end

# there are several URLs that must be handled




server.mount_proc "/create_todo" do |request, response|
  # handle data coming in from the form
  @create_todo = Todo.create(request.query).update({:complete => false})
  response.set_redirect WEBrick::HTTPStatus::MovedPermanently, "/todos"
  # the above line saves you from needing to make a separate template to show a new todo by itself
  # in general, POST requests from forms should be redirected that way
end

server.mount_proc "/active" do |request, response|
  # handle data coming in from the form
  @todos = Todo.where(complete: false)
  template = ERB.new(File.read "index.html.erb")
  response.body = template.result
  # the above line saves you from needing to make a separate template to show a new todo by itself
  # in general, POST requests from forms should be redirected that way
end

server.mount_proc "/completed" do |request, response|
  # handle data coming in from the form
  @todos = Todo.where(complete: true)
  template = ERB.new(File.read "index.html.erb")
  response.body = template.result
  # the above line saves you from needing to make a separate template to show a new todo by itself
  # in general, POST requests from forms should be redirected that way
end



server.mount_proc "/shutdown" do |request, response|
  response.body = "Bye"
  server.shutdown
end

# The above code takes care of all the cases where you know *exactly* what the URL is in advance.

# The below code is necessary for cases where you know only a pattern, which you can match
# with a regular expression
# the pattern this class handles - which your link URLs and form actions should also match -
# is to start the URL with "/todo/" followed by an integer followed by another string
# like "/todo/11/whatever"
# the reason it matches that pattern is the call to server.mount "/todo/", MyServlet
# which comes after the MyServlet class is defined

class TodoServlet < WEBrick::HTTPServlet::AbstractServlet

  def do_GET(request, response)
    # this method handles GET requests to your server like "/todo/4/edit" - 
    # really any GET request that has "/todo/" in it 
    # you will need to add some code so the template displays properly
    # and lets you edit a single todo
    template = ERB.new(File.read "index.html.erb")
    response.body = template.result(binding) # binding is required here.
  end

  def do_POST(request, response)

    request.path =~ /todo\/(\d+)/
    id = $1
    # response.body = "I think I now have an id, #{id}"
    @todo = Todo.find(id)
    if request.path =~ /todo\/(\d+)\/checkbox/
      @todo.toggle!(:complete)
      response.set_redirect WEBrick::HTTPStatus::MovedPermanently, "/todos"
    elsif request.path =~ /todo\/(\d+)\/delete/
      @todo.destroy
      response.set_redirect WEBrick::HTTPStatus::MovedPermanently, "/todos"
    end
    # this method handles any POST request that matches a pattern like "/todo/5/update" or "/todo/47/destroy" etc
    # note that there are two aspects of that pattern that change; you'll need to write code to handle 
    # requests to do several different kinds of things to your todo items
    # remember how to get back to the main page after updating or destroying your todo
  end

end
server.mount "/todo/", TodoServlet # this catches requests to the server that begin with "/todo/" and
                                 # has the MyServlet class deal with them
server.start
