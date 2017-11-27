module AdminsHelper
	ADMIN = 1
	def admin
		if logged_in?
			unless current_user.role == ADMIN
				redirect_to tasks_path
			end
		else
			redirect_to login_path
		end
	end
end
