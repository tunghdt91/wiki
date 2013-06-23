class UsersController < ApplicationController
	before_filter :signed_in_user, only: [:show]
	
	def new
		@user= User.new
	end

	def index
	end

	def show
		@user= User.find(params[:id])
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			flash[:success] = "Thank You !\nYour Account is Created."
			sign_in @user
			redirect_to root_path
		else
		render 'new'
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if params[:upload].present?
				name = params[:upload][:datafile].original_filename
				directory = 'public/img'
				img_show_path='/img/'+name.to_s
				path = File.join(directory,name)
	    	File.open(path, "wb") { |f| f.write(params[:upload][:datafile].read)}
	    	if @user.update_attributes(avatar_path: img_show_path)
					flash[:success] = "Updated avatar"
					sign_in @user
					redirect_to user_path(params[:id])
				else
					flash[:error] = "Error update avatar !"
					sign_in @user
					redirect_to user_path(params[:id])
		    end
    else
				respond_to do |format|
				if @user.update_attributes(params[:user])
					sign_in @user
					format.html { redirect_to root_path ,notice: 'Account was success updated!'}
					format.json {head :no_content}
				else
					format.html {render action: "edit"}
					format.json {render json: @user.errors,status: :unprocessable_entity}	
				end
			end
		end
	end
end
