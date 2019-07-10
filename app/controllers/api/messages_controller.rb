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
      
      if @message.save

        ActionCable.server.broadcast "messages_channel", {
          id: @message.id,
          name: @message.sender.first_name,
          body: @message.body,
          sender_id: @message.sender_id,
          recipient_id: @message.recipient_id,
          created_at: @message.created_at
        }
        render "show.json.jbuilder"
      else
        render json: {message: "No blank messages"}, status: :unprocessable_entity
      end
  
    else
      render json: {message: "You must be logged in to create messages."}, status: :unprocessable_entity
    end
  end
end
