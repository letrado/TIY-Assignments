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
    @todos = Todo.all
    todo = @todos.find(params[:id])
    todo.being_edited = true
    render :index
  end


  def update
    todo = @todos.find(params[:id])
    hash = request.query
    hash["name"].strip!
    if hash["name"].length > 0
      todo.update(hash)
    else
      todo.destroy
    end
    redeirect_to "/todo"
  end


  def toggle
    todo = Todo.find(params[:id])
    todo.toggle!(:complete)
    redirect_to '/todo'
  end


  def destroy
    todo = Todo.find(params[:id])
    todo.destroy
    redirect_to '/todo'
  end






end
