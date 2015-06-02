class TodoController < ApplicationController

  def index
  	  @todos = Todo.all
  	  @all_todos_count = Todo.count
      @flag = 'all'
  end

  def active
  	@todos = Todo.where(complete: false)
    @all_todos_count = Todo.count
    @flag = 'active'
  end

  def competed
	 @todos = Todo.where(complete: true)
	 @all_todos_count = Todo.count
	 @flag = 'completed'
  end

  def create_todo
  	hash = request.query
    hash["name"].strip!
    if hash["name"].length > 0 #if something was typed
    	Todo.create(hash) #then save the todo
	end
  end

  def toggle_all
  	Todo.toggle_all
  end

  def clear_completed
  	Todo.clear_completed
  end




end
