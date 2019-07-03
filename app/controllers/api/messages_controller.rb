class Api::MessagesController < ApplicationController
  before_action :authenticate_user

  def index
    if current_user
      @messages = current_user.message_thread(params[:recipient_id])
      render 'index.json.jbuilder'

    else
      render json: {message: "You must be logged in to view messages."}
    end
  end

  def create
    if current_user
      @message = Message.new(
                            sender_id: current_user.id,
                            recipient_id: params[:recipient_id],
                            body: params[:body]
                            )
      @message.save

      ActionCable.server.broadcast "messages_channel", {
        id: @message.id,
        name: @message.user.username,
        body: @message.body,
        created_at: @message.created_at
      }
      
      render "show.json.jbuilder"
  
    else
      render json: {message: "You must be logged in to create messages."}
    end
  end
end
