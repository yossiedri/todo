
class UsersController < ApplicationController
    
  before_filter :authenticate, :except => [:new, :create]
  before_filter :correct_user, :only => [:show,:edit,:update,:destroy]
  
  # def index
  #   @title = "My todo tasks"
  #   @tasks = Todotask.paginate(
  #           :page => params[:page],
  #           :per_page => 10,
  #           :include => [])
  # end

  def show
   	  @user = User.find(params[:id])
      
      @title = "My todo tasks"
      @tasks = Todotask.paginate(
            :page => params[:page],
            :per_page => 10,
            :include => [])

  end

  def new
  		@title = "Register by email"
  		@user = User.new
  end

  def create
  	@user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "welcome to the todo task"
      redirect_to  @user
    else
      @title = "Register by email"
      render 'new'
    end
  end

  def edit
    @title = "Edit user"
  end

  def update
    @title = "Edit user"

    if(@user.update_attributes(params[:user]))
      flash[:success] = "Profile updated successfuly"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
     @user.destroy
     redirect_to users_path , :flash => {:success => "User destroyed"}
  end  

  private
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end

end
