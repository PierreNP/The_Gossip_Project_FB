class ApplicationController < ActionController::Base

    def authenticate_user
        if session[:user_id] == nil
        redirect_to new_session_path
        end 
    end

end