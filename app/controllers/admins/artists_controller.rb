class Admins::ArtistsController < ApplicationController

	def new
		@artist = Artist.new
	end

	def create
		@artist = Artist.new
		@artist.save(artist_params)
		redirect_to ('/')
	end

	private

    def artist_params
        params.require(:artist).permit(:artist)
    end
end
