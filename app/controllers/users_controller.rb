class UsersController < ApplicationController
	before_filter :signed_in_user, only: [:show]
	def new
		@user= User.new
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
