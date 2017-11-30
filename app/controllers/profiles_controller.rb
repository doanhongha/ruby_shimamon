class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show]

  def new
    @profile = Profile.new
  end

  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      redirect_to @profile
    else
      render 'new'
    end
  end

  def show
  end
  private
  def set_profile
    @profile = Profile.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def profile_params
    params.require(:profile).permit(:fullname, :introduce, :avatar)
  end
end
