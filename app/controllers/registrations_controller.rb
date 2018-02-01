class RegistrationsController < ApplicationController
    layout 'empty'

    def new 
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            session[:user_id] = @user.id
            redirect_to root_url , success: "Thanks for Signing up!"
        else
            render :new
        end
    end

    private
    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
end        
