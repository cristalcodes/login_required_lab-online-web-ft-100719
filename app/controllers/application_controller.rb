class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


    def current_user
      session[:name]
    end

    def home
      if !session[:name]
        redirect_to controller: 'sessions', action: 'new'
      end
    end

    private

    def require_login
      if !current_user
        redirect_to controller: 'sessions', action: 'new'
      end
    end



end


# solution code:
# def hello
#     redirect_to controller: 'sessions', action: 'new' unless session[:name]
#   end
#
#   def current_user
#     session[:name]
#   end
#
#   private
#
#   def require_logged_in
#     redirect_to controller: 'sessions', action: 'new' unless current_user
#   end
