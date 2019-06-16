class Admins::ArtistsController < ApplicationController

	def new
		@artist = Artist.new
		@genre = Genre.new
		@label = Label.new
	end

	def create
		@artist = Artist.new(artist_params)
		@artist.save
		redirect_to ('/')
	end

	private

    def artist_params
        params.require(:artist).permit(:artist)
    end

end
