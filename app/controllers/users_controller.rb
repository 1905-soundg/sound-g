class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
<<<<<<< HEAD
		@user = User.new
		@users = User.all
=======
		@address = Address.new
		@addresses = @user.addresses
>>>>>>> a3a637c34969b05c884e1e94a382189fb4ea6e95
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)
<<<<<<< HEAD
		redirect_to user_path(@users.user_id)
=======
		sign_in(@user, bypass: true)
		redirect_to user_path(@user.id)
>>>>>>> a3a637c34969b05c884e1e94a382189fb4ea6e95
	end

	def destroy
	end

    private

    def user_params
        params.require(:user).permit(:address_id, :last_name, :first_name, :last_name_k, :first_name_k, :postalcode, :address, :telephone_number, :email, :password)
    end

end

private

 def user_params
     params.require(:user).permit(:last_name, :first_name, :last_name_k, :first_name_k, :postalcode, :address, :telephone_number, :email, :password)
 end

end
