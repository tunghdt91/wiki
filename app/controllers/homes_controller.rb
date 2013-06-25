class HomesController < ApplicationController
	before_filter :signed_in_user, only: [:new, :create, :comment]
	
	def home
		@home_posts= Home.all
	end

	def new
		@home = Home.new
	end

	def show
		@home = Home.find(params[:id])
		tmp = @home.viewed + 1
		@home.update_attributes(viewed: tmp)
	end

	def create
		params[:home][:user_id]=current_user.id
		@home = Home.new(params[:home])
		if @home.save
			flash[:success]="Complete"
			redirect_to root_path
		else
			render 'new'
		end
	end

	def comment
		 @home = Home.find_by_id(params[:id].to_i)
     content = params[:content]
     @home.homecomments.create!(content: content,user_id: current_user.id)
     tmp = @home.comment + 1
     @home.update_attributes(comment: tmp)
     redirect_to home_path(params[:id].to_i)
	end
end
