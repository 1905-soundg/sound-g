class Admins::DiscsController < ApplicationController

	private

    def genre_params
        params.require(:disc).permit(:disc_number)
    end

end
