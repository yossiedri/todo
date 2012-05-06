class TodotasksController < ApplicationController

  def index
    @todotasks = Todotask.all
  end


  def show
    @todotask = Todotask.find(params[:id])
  end

 
  def new
    @todotask = Todotask.new
  end

 
  def edit
    @todotask = Todotask.find(params[:id])
  end

 
  def create
    
    debugger
    @todotask = current_user.todotasks.build(params[:todotask])

    if @todotask.save
      redirect_to current_user, notice: 'Todotask was successfully created.'
    else
      render action: "new"    
    end
   
  end

  
  def update
    @todotask = Todotask.find(params[:id])

    if @todotask.update_attributes(params[:todotask])
       redirect_to current_user, notice: 'Todotask was successfully updated.'
    else
      render action: "edit" 
    end
   
  end

  
  def destroy
    @todotask = Todotask.find(params[:id])
    @todotask.destroy
    redirect_to current_user
  end
end
