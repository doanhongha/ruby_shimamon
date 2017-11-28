class UsersController < ApplicationController
	before_action :logged_in_user, only: [:index, :edit, :update, :show]
	before_action :admin, only: [:destroy]
	def index
		@users = User.where.not(id: current_user.id)
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

  	def edit
		set_user
	end

	def update
		set_user
		if @user.update_attributes(user_params)
			redirect_to user_path
		else
			redirect_to tasks_path
		end
	end

	def show
		set_user
		@tasks = Task.where(assign: @user.id)
	end

	def destroy
		set_user
		@user.destroy
		redirect_to tasks_path
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
