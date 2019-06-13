class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
		@user = User.new
		@users = User.all
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		redirect_to user_path(@users.user_id)
	end

	def destroy
	end
end

private

 def user_params
     params.require(:user).permit(:last_name, :first_name, :last_name_k, :first_name_k, :postalcode, :address, :telephone_number, :email, :password)
 end

end
