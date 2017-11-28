class AdminsController < ApplicationController
	before_action :admin
	layout 'admins'
	def index
		@users = User.where.not(id: current_user.id)
	end
end
