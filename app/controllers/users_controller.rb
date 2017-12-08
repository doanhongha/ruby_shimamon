class UsersController < ApplicationController
	before_action :logged_in_user, only: [:index, :edit, :update, :show]
	before_action :admin, only: [:destroy, :index]
  require 'aws-sdk-ses'
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
        Aws.config.update({credentials: Aws::Credentials.new(ENV["ACCESS_KEY_ID"], ENV["SECRET_ACCESS_KEY"])})
        ses = Aws::SES::Client.new(
            :region => 'us-east-1'
        )
        ses.send_email(
            {
                destination: {
                    to_addresses: [@user.email]
                },
                message: {
                    body: {
                        text: {
                            charset: 'UTF-8',
                            data: 'Thank you!'
                        }
                    },
                    subject: {
                        charset: 'UTF-8',
                        data: 'mail subject'
                    }
                },
                source: 'doanhong.ha@monstar-lab.com'
            }
        )
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
    	redirect_back(fallback_location: root_path)
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
