class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update]

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user =User.new
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to [@user], notice: 'Usuario ha sido creado' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, alert: 'Se encontraron errores. Revisar por favor' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
	end

	def edit
	end

	def update
		if @user.update user_params
			redirect_to users_path, notice: "El Usuario #{@user.full_name} se modificó correctamente."
		else
			render :edit, alert: 'Error en:'
		end
	end

	private
		def user_params
			# policy(@user).permitted_attributes
			params.require(:user).permit(:full_name, :email, :password, :password_confirmation)
		end
		def set_user
			@user = User.find(params[:id])
		end
end