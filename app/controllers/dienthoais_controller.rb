class DienthoaisController < ApplicationController
	
	def create_reply
		@reply = Dienthoai.new(params[:dienthoai])
		@reply.comment_id = params[:id]
		@reply.user_id = current_user.id
		if @reply.save
			@a = Dienthoai.find(params[:id])
			@a.update_attributes(:updated_at => Time.now)
	    redirect_to dienthoais_path
	  else
	    render 'index'
	  end
	end

	def thaoluan
	end

	def diendan
		@mobiles = Dienthoai.find_by_sql("select *from dienthoais where topic_id=#{params[:id]} order by updated_at DESC")
	end

	def new
		@mobile = Dienthoai.new
	end

	def create
		@mobile = Dienthoai.new(params[:dienthoai])
		@mobile.user_id = current_user.id
		@mobile.topic_id = params[:format].to_i
		if params[:upload].present?
			name = params[:upload][:datafile].original_filename
			directory = 'public/data'
			path = File.join(directory,name)
	    	File.open(path, "wb") { |f| f.write(params[:upload][:datafile].read)}
	    	@mobile.file_name = name
	    	@mobile.file_path = path	
		end
	    if @mobile.save
	    	flash[:success] = "Report upload success !"
	    	redirect_to dienthoais_path
	    else
	    	render 'new'
	    end
	end

	def index
		@mobiles = Dienthoai.all
	end

	def topic_dienthoai
	end

	def create_topic
		@topic = Tieude.new(params[:tieude])
		if @topic.save
	    	redirect_to dienthoais_path
	    else
	    	render 'index'
	    end
	end
end
