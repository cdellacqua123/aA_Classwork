class SubsController < ApplicationController
    def index
        @subs= Sub.all
        render :index
    end

    def show
        @sub = Sub.find(params[:id])
        render :show
    end

    def new
        @sub = Sub.new
        render :new
    end

    def create
        @sub = Sub.new(sub_params)
        @sub.user_id = current_user.id
        if !@sub.save
            flash[:errors] = @sub.errors.full_messages
        end
        redirect_to subs_url
    end

    def edit
        @sub = Sub.find(params[:id])
        render :edit
    end

    def update
        @sub = Sub.find(params[:id])
        if @sub.update_attributes(sub_params)
            redirect_to subs_url
        else
            flash[:errors] = @sub.errors.full_messages
            render :edit
        end
    end

    # def destroy
    # end
    private
    def sub_params
        params.require(:sub).permit(:title, :description)
    end
end
