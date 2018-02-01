class SessionsController < ApplicationController 
    layout 'empty'

    def new; end

    def create
      user = User.find_by(email: params[:email].downcase)
  
      if Services::User::Authenticate.new(user).call(params[:password])
        session[:user_id] = user.id
        redirect_to root_url, success: 'Successful Signin'
      else
        session[:return_to] = nil
        redirect_to login_url, error: 'Invalid Email/Password combination'
      end
    end


    def destroy 
        reset_session
        redirect_to root_url, error: 'Succesfully Signed Out'
    end

end