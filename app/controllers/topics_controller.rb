class TopicsController < ApplicationController
	
	def diendan
	end
	
	def index
	end

	def new
	end

	def create
		@topic = Topic.new(params[:topic])
		if @topic.save
	    	redirect_to topics_path
	    else
	    	render 'index'
	    end
	end

	def destroy
		@topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to topics_path
	end

end
