class HomeController < ApplicationController
	before_action :logged_in_user
	def index
		redirect_to tasks_path
	end
	def search
		if params[:key] && params[:status]
			@result = Task.where('name LIKE ?', "%#{params[:key]}%").where(status: params[:status])
			if @result.empty?
				@error = 'result could not found!'
			end
		else
			@error = 'error!'
			redirect_to tasks_path
		end
	end
end
