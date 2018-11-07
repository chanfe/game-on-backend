class MessagesController < ApplicationController
  def create
    message = Message.new(strong_params)
    conversation = Conversation.find(strong_params[:conversation_id])
    if message.save
      serialized_data = ActiveModelSerializers::Adapter::Json.new(
        MessageSerializer.new(message)
      ).serializable_hash
      MessagesChannel.broadcast_to conversation, serialized_data
      head :ok
    end
  end

  private

  def strong_params
    params.require(:message).permit(:text, :conversation_id)
  end
end
