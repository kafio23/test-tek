class Api::V1::UsersController < ApplicationController
	before_action :authenticate_request!

	def index
		@users = User.all if current_user.admin?
		render json: @users
	end
end