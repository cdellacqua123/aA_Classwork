class UsersController < ApplicationController
    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            # Loginto that user
            log_in(@user) # Write definition in ApplicationController
            # redirect to that user's page
            redirect_to user_url(@user)
        else
            render :new
        end
    end

    private

    def user_params
        params.require(:user).permit(:user_name, :password_digest, :session_token)
    end
end
