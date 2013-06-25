class HomesController < ApplicationController
	before_filter :signed_in_user, only: [:new, :create, :comment]
	
	def home
		@home_posts= Home.all
		# @homes= Home.paginate(page: params[:page], per_page: 3)
	end

	def edit
		@home = Home.find(params[:id])
	end

	def new
		@home = Home.new
	end

	def update
		@home = Home.find(params[:id])
	 	@home.update_attributes(params[:home])
	 	redirect_to root_path
	end

	def show
		@home = Home.find(params[:id])
		tmp = @home.viewed + 1
		@home.update_attributes(viewed: tmp)
		@homecomments = @home.homecomments.paginate(page: params[:page], per_page: 5)
	end

	def create
		params[:home][:user_id]=current_user.id
		params[:home][:viewed]= 1 
		params[:home][:comment]=0
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

		def destroy
		Home.find(params[:id]).destroy
		this_posts = Homecomment.where('home_id=?',params[:id])
		this_posts.each do |t|
				Homecomment.find(t.id).destroy
		end
		redirect_to root_path
		end

end
