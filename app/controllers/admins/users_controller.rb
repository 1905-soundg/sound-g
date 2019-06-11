class Admins::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
  	@user = User.find(params[:id])
  	@address = Address.new
  end

end
