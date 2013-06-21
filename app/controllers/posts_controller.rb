class PostsController < ApplicationController
	def new
		@post = Post.new
	end

	def create
		@post = Post.new(params[:post])
		@post.user_id = current_user.id
		if @post.save
	    	flash[:success] = "Post upload success !"
	    	redirect_to posts_path
	    else
	    	render 'new'
	    end
	end

	def index
			@posts = Post.find_by_sql("select *from posts where topic_id=#{params[:choose].to_i} ")
	end



end
