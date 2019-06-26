class Admins::UsersController < ApplicationController
	before_action :authenticate_admin!
  def index
    @user = User.unscoped.all
    @users = @user.page(params[:page]).reverse_order.per(20)
  end



  def show
  	@user = User.unscoped.find(params[:id])
  	@address = Address.new
    @addresses = @user.addresses.page(params[:addresses_page]).reverse_order.per(5)
    @orders = @user.orders.page(params[:orders_page]).reverse_order.per(5)
  end



  private

    def user_params
        params.require(:user).permit(:address_id, :last_name, :first_name, :last_name_k, :first_name_k, :postalcode, :address, :telephone_number, :email, :password, :user_status)
    end


end
