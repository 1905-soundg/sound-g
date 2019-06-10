class GenresController < ApplicationController

	def create
		@genre = Genre.new
		@genre.save(genre_params)
		redirect_to ('/')
	end

	private

    def genre_params
        params.require(:genre).permit(:genre)
    end

end