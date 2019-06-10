class LabelsController < ApplicationController

	def create
		@label = Label.new
		@label.save(label_params)
		redirect_to ('/')
	end

	private

    def label_params
        params.require(:label).permit(:label)
    end

end