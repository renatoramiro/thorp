class ApplicationController < ActionController::Base
  protect_from_forgery
  layout :define_layout

  def after_sign_in_path_for(resource)
  	posts_url
  end

  def define_layout
  	if devise_controller? && action_name == 'edit'
  		'dashboard'
  	else
  		'application'
  	end
  end
end
