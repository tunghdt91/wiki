class HomecommentsController < ApplicationController
	def destroy
		home_id = Homecomment.find(params[:id]).home_id
		@home = Home.find(home_id)
		tmp = @home.comment - 1
		id_topic=Homecomment.find(params[:id]).home_id
		@home.update_attributes(comment: tmp)
		Homecomment.find(params[:id]).destroy
    flash[:success] = "Post destroyed !"
    redirect_to home_path(id_topic)
	end
end
