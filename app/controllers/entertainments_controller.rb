class EntertainmentsController < ApplicationController
	before_filter :signed_in_user, only: [:aoe, :other, :fifa, :halflife]

	def index
		@entertainments=Entertainment.find(:all, :order => "updated_at DESC")
	end
	
	def aoe
		@aoe_new_post = Entertainment.new
		@aoes = Entertainment.where('catalog=?',"aoe")
	end

	def other
		@other_new_post = Entertainment.new
		@others= Entertainment.where('catalog=?','other')
	end

	def fifa
		@fifa_new_post = Entertainment.new
		@fifas = Entertainment.where('catalog=?',"fifa")
	end

	def halflife
		@halflife_new_post = Entertainment.new
		@halflifes = Entertainment.where('catalog=?',"halflife")
	end

	def show
		@entertainment = Entertainment.find(params[:id])
		tmp = @entertainment.viewed + 1
		@entertainment.update_attributes(viewed: tmp)
		# @entertainment.entertainmentposts=@entertainment.entertainmentposts.paginate(page: params[:page], per_page: 5)
	end

	def comment
     @entertainment = Entertainment.find_by_id(params[:id].to_i)
     content = params[:content]
     @entertainment.entertainmentposts.create!(content: content,user_id: current_user.id)
     @entertainment.update_attributes(updated_at: Entertainmentpost.last.updated_at)
     redirect_to entertainment_path(params[:id].to_i)
	end

	def create
		if params[:id]=="aoe"
			params[:entertainment][:catalog]="aoe"
			params[:entertainment][:user_post]=current_user.name
			entertainment= Entertainment.new(params[:entertainment])
			if entertainment.save
				flash[:success] = "OK"
				redirect_to aoe_entertainments_path
			else
				flash[:error] ="Failse"
				redirect_to aoe_entertainments_path
			end
		end

		if params[:id]=="other"
			params[:entertainment][:catalog]="other"
			params[:entertainment][:user_post]=current_user.name
			entertainment= Entertainment.new(params[:entertainment])
			if entertainment.save
				flash[:success] = "OK"
				redirect_to other_entertainments_path
			else
				flash[:error] ="Failse"
				redirect_to other_entertainments_path
			end
		end

		if params[:id]=="fifa"
			params[:entertainment][:catalog]="fifa"
			params[:entertainment][:user_post]=current_user.name
			entertainment= Entertainment.new(params[:entertainment])
			if entertainment.save
				flash[:success] = "OK"
				redirect_to fifa_entertainments_path
			else
				flash[:error] ="Failse"
				redirect_to fifa_entertainments_path
			end
		end

		if params[:id]=="halflife"
			params[:entertainment][:catalog]="halflife"
			params[:entertainment][:user_post]=current_user.name
			entertainment= Entertainment.new(params[:entertainment])
			if entertainment.save
				flash[:success] = "OK"
				redirect_to halflife_entertainments_path
			else
				flash[:error] ="Failse"
				redirect_to halflife_entertainments_path
			end
		end


	end
end
