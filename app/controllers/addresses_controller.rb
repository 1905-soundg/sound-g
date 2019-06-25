class AddressesController < ApplicationController
	before_action :authenticate_user!

	def index
		@user = current_user
	    @address = Address.new
	    @addresses = @user.addresses
	end

	def create
		@address = Address.new(address_params)
		@address.user_id = params[:user_id]
		@address.save
		redirect_to  new_user_order_path, notice: 'お届け先新規登録しました'
	end

	def update
		@address = Address.find(params[:id])
		@address.update(address_params)
		redirect_to user_addresses_path
	end

	def destroy
		@address = Address.find(params[:id])
		@address.destroy
		redirect_to user_addresses_path
	end

    private

    def address_params
        params.require(:address).permit(:name, :postalcode, :address)
    end

end
