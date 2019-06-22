class Admins::UsersController < ApplicationController
  def index
    @users = User.page(params[:page]).reverse_order.per(20)
  end

  def show
  	@user = User.find(params[:id])
  	@address = Address.new
    @addresses = @user.addresses
    @orders = @user.orders
  end

end
