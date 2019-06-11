class AddressesController < ApplicationController

	def create
		@address = Address.new(address_params)
		@address.user_id = params[:user_id]
		@address.save
		redirect_to user_path(@address.user_id)
	end

	def update
		@address = Address.find(params[:id])
		@address.update(address_params)
		redirect_to user_path(@address.user_id)
	end

	def destroy
		@address = Address.find(params[:id])
		@address.destroy
		redirect_to user_path(@address.user_id)
	end

    private

    def address_params
        params.require(:address).permit(:name, :postalcode, :address)
    end

end
