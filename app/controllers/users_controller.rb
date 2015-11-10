class UsersController < ApplicationController
	def index
		@user = User.all
	end
	def new
		@user = User.new

	end

	def create
		@user = User.create(user_params)
		puts params
		if @user.save
		redirect_to user_path(@user.id)
	else
		redirect_to root_path
	end
	end

	def show
		@user = User.find(params[:id])
	end




	private

	def user_params
		params.require(:user).permit(:name, :email, :password)
	end

end
