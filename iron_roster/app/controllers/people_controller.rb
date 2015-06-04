class PeopleController < ApplicationController
  def index
    @persons = Person.all
  end

  def show
    @person = Person.find(params[:id])
  end

  def new
    @person = Person.new
  end

  def create
    Person.create(params.require(:person)
      .permit(:name, :subject_id, :github_account))
    redirect_to people_url
  end

  def edit
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.find(params[:id])
    @person.update(params.require(:person)
      .permit(:name, :subject_id, :github_account))
    redirect_to person_path(@person)
  end
end

