class UsersController < ApplicationController
    before_action :find_user, only: [:show, :edit, :update]

    def new
        @user = User.new
    end
    
    def create
        user = User.new(user_params)
        if user.valid?
            user.save
            redirect_to user
        else
            flash[:user_error] = user.errors.full_messages
            redirect_to new_user_path       
        end
    end
    
    def show
        
    end

    def edit

    end
    
    def update
        @user.update(user_params)
        if @user.valid?
            redirect_to @user
            flash[:update_success] = "Profile successfully updated!"
        else
            flash[:user_error] = @user.errors.full_messages
            redirect_to edit_user_path       
        end
    end

    private

    def find_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :age, :bio)
    end
end
