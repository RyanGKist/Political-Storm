module CurrentUser
    extend ActiveSupport::Concern
  
    included do
      helper_method :current_user
    end
  
    private
  
    # Looks up the current user.
    # When a user logs in, the session[:user_id] is set.
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  end