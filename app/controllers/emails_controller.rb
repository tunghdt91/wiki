class EmailsController < ApplicationController
	before_filter :signed_in_user, only: [:create, :new, :inbox, :sent, :show, :unread]
	# filter user nao doc mail user day
	def new
		@email = Email.new
		@users = User.all
	end

	def unread
		@emails = Email.find_by_sql("Select *from emails where to_user='#{current_user.email}' and mark_read = 'f' order by created_at DESC")
	end

	def show
		@email = Email.find(params[:id])
		@email.update_attributes(mark_read: true)
	end

	def inbox
		@emails = Email.where("to_user=?",current_user.email)
	end

	def sent
		@emails = Email.where('from_user=?',current_user.email);
	end

	def create
		@email = Email.new(params[:email])
		@email.from_user = current_user.email
		respond_to do |format|
			if @email.save
   	    	 	format.html { redirect_to new_email_path, notice: 'Email Sent !' }
   		   	else
        		format.html { render action: "new" }
        		format.json { render json: @email.errors, status: :unprocessable_entity }
      		end
      	end
	end
end
