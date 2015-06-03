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
    render :index
  end

  def completed
	 @todos = Todo.where(complete: true)
	 @all_todos_count = Todo.count
	 @flag = 'completed'
   render :index
  end

  def create
  	hash = request.query
    hash["name"].strip!
    if hash["name"].length > 0 #if something was typed
    	Todo.create(hash) #then save the todo
	end
      redirect_to '/todo'
  end

  def toggle_all
  	Todo.toggle_all
    redeirect_to "/todo"
  end

  def clear_completed
  	Todo.clear_completed
    redeirect_to "/todo"
  end

  def edit 
  end


  def update
  end


  def toggle

  end


  def destroy
  end






end
