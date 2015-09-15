class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected 
		def authenticate_admin
			if session[:admin_id]
			# set current user object to @current_user object variable
				@current_admin = Admin.find session[:admin_id] 
				return true	
			else
				redirect_to(:controller => 'admins', :action => 'login')
				return false
			end
		end
		def save_login_state
			if session[:admin_id]
				redirect_to(:controller => 'admins', :action => 'home')
				return false
			else
				return true
			end
		end
end
