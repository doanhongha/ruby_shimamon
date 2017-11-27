class AdminsController < ApplicationController
	before_action :admin
	def index
		@users = User.all
	end
end
