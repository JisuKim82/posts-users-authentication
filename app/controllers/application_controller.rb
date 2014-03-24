class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
    def current_user_can?(action, object)
      case action
      when :edit
        object.editable_by?(current_user)
      when :read
        object.readable_by?(current_user)
      end
      #object.send("#{action}able_by?", current_user)
    end
    helper_method :current_user_can?

    def login_required
      if !logged_in?
        redirect_to login_path, :notice => "Login required!!!"
      end
    end

    def logged_in?
      !!session[:user_id]
    end
    helper_method :logged_in?

    def current_user
      @current_user ||= User.find(session[:user_id]) if logged_in?
    end
    helper_method :current_user
end
