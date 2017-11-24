class ApplicationController < ActionController::Base
	before_action :set_lan
  	protect_from_forgery with: :exception
  	include SessionsHelper
  	include UsersHelper

  	def set_lan
		I18n.locale = params[:lan] || I18n.default_locale
	end

end
