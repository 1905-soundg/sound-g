class ArtistsController < ApplicationController


	def new
		@artist = Artist.new
	end

	def create
		@artist = Artist.new
		if @artist.save(artist_params)
		   redirect_to ('/')
		else
			render :new
		end

	end

	private

    def artist_params
        params.require(:artist).permit(:artist)
    end
end