class Admins::ArtistsController < ApplicationController
	before_action :authenticate_admin!

	def new
		@artist = Artist.new
		@genre = Genre.new
		@label = Label.new
	end

	def create
		@artist = Artist.new(artist_params)
		if @artist.save
			flash[:notice] = "アーティストを登録しました。"
		  redirect_back(fallback_location: root_path)
		else
			flash[:alert] = "アーティストを入力してください。"
			redirect_back(fallback_location: root_path)

		end

	end

	private

    def artist_params
        params.require(:artist).permit(:artist)
    end

end
