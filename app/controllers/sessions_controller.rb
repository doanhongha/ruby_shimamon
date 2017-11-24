class SessionsController < ApplicationController
  before_action :logged_in_user, only: [:destroy]
  def login
    if logged_in?
      redirect_to users_path
    else
      render 'new'
    end
  end

  def create
    if logged_in?
      redirect_to users_path
    else
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        log_in(user)
        redirect_to "users"
      else 
        flash.now[:'alert-danger'] = 'User/password error!'
        render 'new'
      end
    end
  end

  def destroy
  	log_out
  	redirect_to root_url
  end

end
