class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
		@address = Address.new
		@addresses = @user.addresses
	end

	def update
	end

	def destroy
	end
end
