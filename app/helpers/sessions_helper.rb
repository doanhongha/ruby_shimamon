module SessionsHelper
	def log_in(user)
		session[:user_id] = user.id
	end

	def remember(user)
		user.remember
		cookies.permanent.signed[:user_id] = user.id
		cookies.permanent[:remember_token] = user.remember_token
	end

	def current_user
		@current_user ||=User.find_by(id: session[:user_id])
		#a = a|| b <-> a ||= b y nghia: a = nil thi gan a = b khong thi thoi
		return @current_user
	end

	def log_out
		session.delete(:user_id)
		@current_user = nil
	end
	#return true if exits current_user, false if do'nt exits current_user
	def logged_in?
       !current_user.nil?
    end

	def logged_in_user
		unless logged_in?
	        redirect_to login_path
	    end
	end

	def redirect_login
		unless logged_in?
			redirect_to login_path
		end
	end

	def fillnav
		if !current_user.nil?
			if current_user.role == 1
				raw('
					<ul class="dropdown-menu">
			            <li><a href="/admin/index">'+@current_user.name+'</a></li>
			            <li><a data-method="delete" href="/logout">Logout</a></li>
			        </ul>
					')
			else
				raw('
					<ul class="dropdown-menu">
			            <li><a href="/users/' + @current_user.id.to_s + '">'+@current_user.name+'</a></li>
			            <li><a data-method="delete" href="/logout">Logout</a></li>
			        </ul>
					')
			end
		else
			'<ul class="dropdown-menu">
	            <li><a href="/register">Register</a></li>
	            <li><a href="/login">Login</a></li>
	        </ul>'.html_safe
		end
	end
	
end

