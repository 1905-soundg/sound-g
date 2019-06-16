class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
		@address = Address.new
		@addresses = @user.addresses
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		sign_in(@user, bypass: true)
		redirect_to user_path(@user.id)
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to root_path
	end

    private

    def user_params
        params.require(:user).permit(:address_id, :last_name, :first_name, :last_name_k, :first_name_k, :postalcode, :address, :telephone_number, :email, :password)
    end

end


