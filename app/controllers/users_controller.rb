class UsersController < ApplicationController
	before_action :authenticate_user!

	def show
		@user = User.unscoped.find(params[:id])
		if current_user.id != @user.id
	    redirect_to root_path
	    end
		@address = Address.new
		@addresses = @user.addresses.page(params[:addresses_page]).reverse_order.per(5)
		@favorites = @user.favorites.all
		@orders = @user.orders.page(params[:orders_page]).reverse_order.per(5)
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
