class UsersController < ApplicationController
	# before_action :logged_in_user, only: [:new, :create]
	def index
		@users = User.all
	end
	def register
		if logged_in?
	      redirect_to users_path
	    else
			@user = User.new
			render 'new'
		end
	end

	def create
		if logged_in?
	      redirect_to users_path
	    else
		    @user = User.new(user_params)

		    respond_to do |format|
		      if @user.save
		        format.html { redirect_to '/login', notice: 'User was successfully created.' }
		        format.json { render :show, status: :created, location: @user }
		      else
		        format.html { render :new }
		        format.json { render json: @user.errors, status: :unprocessable_entity }
		      end
		    end
		end
  	end
  	private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :role)
    end
end
