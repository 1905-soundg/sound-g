class Admins::LabelsController < ApplicationController

	def create
		@label = Label.new(label_params)

		if @label.save
			flash[:notice] = "レーベルを登録しました。"
		  redirect_back(fallback_location: root_path)
		else
			flash[:alert] = "レーベルを入力してください。"
			redirect_back(fallback_location: root_path)

		end

	end

	private

    def label_params
        params.require(:label).permit(:label)
    end
end
