class UsersController < ApplicationController
    before_action :authorized, only: [:stay_logged_in]
    before_action :find, only: [:destroy, :update]

    def index
        @users = User.all
        render json: @users
    end
    
    def show
        render json: @user
    end

    def destroy
        @user.destroy
        render json: @user
    end

    def login
      @user = User.find_by(username: params[:username])

      if @user && @user.authenticate(params[:password])
        wristband = encode_token({user_id: @user.id})
        render json: {
          user: UserSerializer.new(@user),
          token: wristband
        }

      else
        render json: {error: "Incorrect username or password."}
      end

    end

    def stay_logged_in
      wristband = encode_token({user_id: @user.id})

      render json: {
        user: UserSerializer.new(@user),
        token: wristband
      }

    end

    def create
      @user = User.create(user_params)

      if @user.valid?
        wristband = encode_token({user_id: @user.id})

        render json: {
          user: UserSerializer.new(@user),
          token: wristband
        }

      elsif @user.errors.messages[:username]
        render json: {
            error: "Username #{@user.errors.messages[:username][0]}."
        }

      elsif @user.errors.messages[:password]
        render json: {
            error: "Password #{@user.errors.messages[:password][0]}."
        } 

      elsif @user.errors.messages[:hemisphere]
        render json: {
            error: "Hemisphere #{@user.errors.messages[:hemisphere][0]}."
        }
      end

    end


    def update
        @user.update(user_params)
        render json: @user
    end

    def find
        @user = User.find(params[:id])
    end

    private

    def user_params
      params.require(:user).permit(:username, :hemisphere)
    end

end
