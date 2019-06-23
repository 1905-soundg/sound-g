class Admins::GenresController < ApplicationController

def create
		@genre = Genre.new(genre_params)

		if @genre.save
			flash[:notice] = "ジャンルを登録しました。"
		  redirect_back(fallback_location: root_path)
		else
			flash[:notice] = "ジャンルを入力してください。"
			redirect_back(fallback_location: root_path)

		end


	end

	private

    def genre_params
        params.require(:genre).permit(:genre)
    end

end
