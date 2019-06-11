class Admins::LabelsController < ApplicationController

	def create
		@label = Label.new(label_params)
		@label.save
		redirect_to ('/')
	end

	private

    def label_params
        params.require(:label).permit(:label)
    end
end
