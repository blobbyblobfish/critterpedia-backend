class UserCrittersController < ApplicationController
    before_action :authorized, only: [:create]

    def create
        @user_critter = @user.user_critters.create(user_critter_params)
        render json: @user_critter
    end

    def destroy
        @user_critter = UserCritter.find(params[:id])
        @user_critter.destroy
        render json: @user_critter
    end

    private

    def user_critter_params
        params.permit(:critter_id)
    end
    
end
