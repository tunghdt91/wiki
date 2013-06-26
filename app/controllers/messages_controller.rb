class MessagesController < ApplicationController

  def create
  	if !signed_in?
  		params[:message][:user_id]=0
  	else
  		params[:message][:user_id]=current_user.id
    end
    @message = Message.create!(params[:message])
    PrivatePub.publish_to("/messages/new", message: @message)
  end
end