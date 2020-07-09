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
        if @user.errors.messages[:password] && @user.errors.messages[:hemisphere]
            render json: {
                error: "Username #{@user.errors.messages[:username][0]}. Password #{@user.errors.messages[:password][0] || "cannot be entered without valid username"}. Hemisphere #{@user.errors.messages[:hemisphere][0]}."
            }
        elsif @user.errors.messages[:password]
            render json: {
                error: "Username #{@user.errors.messages[:username][0]}. Password #{@user.errors.messages[:password][0]}."
            }
        elsif @user.errors.messages[:hemisphere]
            render json: {
                error: "Username #{@user.errors.messages[:username][0]}. Hemisphere #{@user.errors.messages[:password][0]}."
            }  
        else
            render json: {
                error: "Username #{@user.errors.messages[:username][0]}."
            }
        end

      elsif @user.errors.messages[:password]
            if @user.errors.messages[:hemisphere]
                render json: {
                    error: "Password #{@user.errors.messages[:password][0]}. Hemisphere #{@user.errors.messages[:hemisphere][0]}."
                }
            else
                render json: {
                    error: "Password #{@user.errors.messages[:password][0]}."
                } 
            end

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
      params.permit(:username, :password, :hemisphere)
    end

end
