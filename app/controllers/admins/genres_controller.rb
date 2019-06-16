class Admins::GenresController < ApplicationController

def create
		@genre = Genre.new(genre_params)
		@genre.save
		redirect_to ('/')
	end

	private

    def genre_params
        params.require(:genre).permit(:genre)
    end

end
