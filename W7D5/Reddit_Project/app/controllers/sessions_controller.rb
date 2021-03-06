class SessionsController < ApplicationController
    before_action :require_login!, only: :destroy
    before_action :require_logout!, only: [:new, :create]

    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.find_by_credentials(
            params[:user][:username],
            params[:user][:password]
        )

        if @user.save
            login!(@user)
            redirect_to users_url
        else
            flash[:errors] = ['Invalid Username or Password']
            render :new
        end
    end

    def destroy
        logout!
        redirect_to new_session_url  
    end
end
