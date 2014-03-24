class SessionsController < ApplicationController
  

  def new

  end

  def create
    @user = User.find_by(:email => params[:email])

    if @user && @user.authenticate(params[:password]) # we could also confirm a password
      session[:user_id] = @user.id
      redirect_to "/posts"
    else
      flash[:notice]="Invalid Login"
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to "/posts", :notice => "You're logged out"
  end
end
