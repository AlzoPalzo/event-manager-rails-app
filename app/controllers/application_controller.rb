class ApplicationController < ActionController::Base
    def home
        redirect_to user_path
    end
end
