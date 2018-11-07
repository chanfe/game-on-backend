class ConversationsController < ApplicationController
  def index
    conversations = Conversation.all
    render json: conversations
  end

  def create
    conversation = Conversation.new(strong_params)
    if conversation.save
      serialized_data = ActiveModelSerializers::Adapter::Json.new(
        ConversationSerializer.new(conversation)
      ).serializable_hash
      ActionCable.server.broadcast 'conversations_channel', serialized_data
      head :ok
    end
  end

  private

  def strong_params
    params.require(:conversation).permit(:title)
  end
end
