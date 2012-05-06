class SessionsController < ApplicationController
  
  def new
  	@title = "Get In..."
  end

  def create
    debugger
    user = User.authenticate(params[:session][:email])
    
    if user.nil?
      flash.now[:error] = "Invalid email."
      @title = "Please register..."
      render 'new'
    else
      sign_in user
      redirect_back_or user
    end
  end

  def destroy
  	sign_out
  	redirect_to(root_path)
  end

end
