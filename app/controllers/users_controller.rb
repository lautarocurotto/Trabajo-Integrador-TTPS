class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
    end

    def index
        @users = User.all
    end
    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @minimum_password_length = 6
        puts 'ENTRÉ AL EDIT'
        puts @user
        puts params[:user]
        respond_to do |format|
            if @user.update(params.require(:user).permit(:email, :password, :password_confirmation, :role , :assignedbranch)) 
                format.html { redirect_to users_index_url, notice: "User was successfully updated." }
                format.json { render :show, status: :edited, location: @user }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @user.errors, status: :unprocessable_entity }
            end
        end
    end
    def new
        @user = User.new
    end
    def create
        @user = User.new(user_params)
        respond_to do |format|
            if @user.save
              format.html { redirect_to users_index_url, notice: "User was successfully created." }
              format.json { render :show, status: :created, location: @user }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @user.errors, status: :unprocessable_entity }
            end
          end
    end

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :role , :assignedbranch)
    end
end
