class UsersController < ApplicationController
    def create
        #debugger
        render json: params
    end
end