class Music < ApplicationRecord

	belongs_to :disc, inverse_of: :musics

	belongs_to :artist

end
