class Admins::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
  	@user = User.find(params[:id])
  	@address = Address.new
<<<<<<< HEAD
    @addresses = Address.all
=======
    @addresses = @user.addresses
>>>>>>> a3a637c34969b05c884e1e94a382189fb4ea6e95
  end

end
