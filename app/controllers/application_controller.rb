class ApplicationController < ActionController::Base #User::ApplicationController?
  before_action :authenticate_user!,except: [:top, :about]
  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_path(@user.id) #@user.id? user.id?
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protected        #private? protected?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email]) #, :postcode, :prefecture_code, :address_city, :address_street, :address_building
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end
end
