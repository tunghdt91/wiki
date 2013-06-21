class EntertainmentsController < ApplicationController
	def aoe
		@aoe_new_post = Entertainment.new
		@aoes = Entertainment.where('catalog=?',"aoe")
	end

	def cdtl
		@cdtl_new_post = Entertainment.new
	end

	def fifa
		@fifa_new_post = Entertainment.new
	end

	def halflife
		@halflife_new_post = Entertainment.new
	end

	def show
		@entertainment = Entertainment.find(params[:id])
	end

	def create
		if params[:id]=="aoe"
			if params[:upload].present?
				name = params[:upload][:datafile].original_filename
				directory = 'public/img/market'
				path = File.join(directory,name)
	    	File.open(path, "wb") { |f| f.write(params[:upload][:datafile].read)}
	    	params[:entertainment][:picture]=name
	    end	

			params[:entertainment][:catalog]="aoe"
			entertainment= Entertainment.new(params[:entertainment])
			if entertainment.save
				flash[:success] = "OK"
				redirect_to aoe_entertainments_path
			else
				flash[:error] ="Failse"
				redirect_to aoe_entertainments_path
			end
		end

		if params[:id]=="cdtl"
			params[:entertainment][:catalog]="cdtl"
			entertainment= Entertainment.new(params[:entertainment])
			if entertainment.save
				flash[:success] = "OK"
				redirect_to cdtl_entertainments_path
			else
				flash[:error] ="Failse"
				redirect_to cdtl_entertainments_path
			end
		end

		if params[:id]=="fifa"
			params[:entertainment][:catalog]="fifa"
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
