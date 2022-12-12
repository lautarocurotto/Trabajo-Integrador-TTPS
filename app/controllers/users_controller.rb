class UsersController < ApplicationController
    before_action :authenticate_user!
    def show
        @user = User.find(params[:id])
        if current_user.role == 'client'
            if @user.id != current_user.id
                redirect_to :home
            end
        end
    end

    def index
        if current_user.role == 'client'
            redirect_to :home
          end
        @users = User.all
    end
    def edit
        if current_user.role != 'admin'
            redirect_to :home
        end
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
                format.html { redirect_to users_index_url, notice: "El usuario fue actualizado con éxito." }
                format.json { render :show, status: :edited, location: @user }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @user.errors, status: :unprocessable_entity }
            end
        end
    end
    def new
        if current_user.role != 'admin'
            redirect_to :home
        end
        @user = User.new
    end
    def create
        @user = User.new(user_params)
        puts @user.role
        if (@user.role != "staff")
            @user.assignedbranch = nil
        end
        respond_to do |format|
            if @user.save
              format.html { redirect_to users_index_url, notice: "El usuario fue creado con éxito." }
              format.json { render :show, status: :created, location: @user }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @user.errors, status: :unprocessable_entity }
            end
          end
    end
# DELETE /users/1 or /users/1.json
    def destroy
        @user = User.find(params[:id])
        if Appointment.find_by(user_id: @user_id)
            respond_to do |format|
                format.html { redirect_to users_index_url, notice: "El usuario no se puede eliminar porque tiene turnos asociados." }
                format.json { head :no_content }
            end
        else
            @user.destroy
            respond_to do |format|
                format.html { redirect_to users_index_url, notice: "El usuario fue eliminado con éxito." }
                format.json { head :no_content }
            end
        end
    end

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :role , :assignedbranch)
    end
end
