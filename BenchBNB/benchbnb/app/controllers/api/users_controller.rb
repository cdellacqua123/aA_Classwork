class Api::UsersController < ApplicationController

    def create
        @user = User.new(user_params)
        if @user.save
            login(@user)
        else
            render json: "Something went wrong", @user.errors
        end
    end

    private
    
    def user_params
        params.require(:user).permit(:username, :password)
    end
end
