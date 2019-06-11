class AddressesController < ApplicationController

	def create
		@address = Address.new
		@address.save(address_params)
		redirect_to ('/')
	end

	def update
		@address =Address.find(params[:id])
		@address.update(address_params)
		redirect_to ('/')
	end

	def destroy
		@address =Address.find(params[:id])
		@address.destroy
		redirect_to ('/')
	end

    private

    def address_params
        params.require(:address).permit(:address)
    end

end
