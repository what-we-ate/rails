class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :complete_profile, only: [:show, :edit]
  before_action :assign_profile, only: [:show, :edit, :update]

  def show
  end

  def new
    redirect_to(profile_url) && return if profile.present?
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(user: current_user)
    @profile.save(validate: false)
    if @profile.update(profile_params.merge(user_attributes: user_params.merge(id: current_user.id)))
      redirect_to(profile_url, notice: "Thanks! Your profile has successfully been saved")
    else
      flash.alert = "Please fill in the required fields"
      render(:new)
    end
  end

  def edit
  end

  def update
    if profile.update(profile_params.merge(user_attributes: user_params.merge(id: current_user.id)))
      redirect_to(profile_url, notice: "Your profile has successfully been saved")
    else
      render(:edit)
    end
  end

  private

  def complete_profile
    redirect_to(new_profile_url, profile_prompt: "Please complete your profile") if profile.blank?
  end

  def assign_profile
    @profile = profile
  end

  def profile
    current_user.profile
  end

  def user_params
    params.require(:profile).require(:user).permit(:first_name, :last_name)
  end

  def profile_params
    params.require(:profile).permit(profile_attributes)
  end

  def profile_attributes
    %i(date_of_birth profession greeting bio mobile_number favorite_cuisine date_of_birth_visible mobile_number_visible)
  end
end
