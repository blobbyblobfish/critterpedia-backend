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
      @user = User.create(create_user_params)

      if @user.valid?
        wristband = encode_token({user_id: @user.id})

        render json: {
          user: UserSerializer.new(@user),
          token: wristband
        }

      else 
        render json: {
            error: "Error."
        }
      end

    end


    def update
        @user.update(update_user_params)

        if @user.valid? 
            render json: @user

        else
            render json: {error: "Error #{@user.errors.messages}"}
        end 

    end

    def find
        @user = User.find(params[:id])
    end

    private

    def create_user_params
        params.permit(:username, :hemisphere, :password)
    end

    def update_user_params
      params.require(:user).permit(:username, :hemisphere)
    end

end
