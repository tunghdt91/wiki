class MyfilesController < ApplicationController
		before_filter :signed_in_user, only: [:index, :create]
	def index
		@myfile = Myfile.new
		@myfiles = Myfile.where("user_id=?",current_user.id)
	end
	def create
		if params[:upload].present?
			name = params[:upload][:datafile].original_filename
			if(name=="index.html" || name=="index.html.erb")
				flash[:error] = "Can't update file index.html or index.html.erb"
				redirect_to myfiles_path
			else
				directory = 'public/myfiles/'
				path = File.join(directory,name)
				if params[:myfile][:name_display]==""
					params[:myfile][:name_display]=name.to_s
	    	end
	    	File.open(path, "wb") { |f| f.write(params[:upload][:datafile].read)}
	    	params[:myfile][:name]=name
	    	params[:myfile][:user_id]=current_user.id
	    	Myfile.new(params[:myfile]).save
	    	redirect_to myfiles_path
	  	end
	  else
	  	flash[:error]="No file choose !"
	  	redirect_to myfiles_path
	  end  
	end
end
# 0972757550