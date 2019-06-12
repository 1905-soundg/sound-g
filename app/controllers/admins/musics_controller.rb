class Admins::MusicsController < ApplicationController



	private

    def genre_params
        params.require(:music).permit(:title, :track_number)
    end

end
