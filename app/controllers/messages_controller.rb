class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_conversation

  def index
    # is current user either a sender or recipient?
    if current_user == @conversation.sender || current_user == @conversation.recipient
      # check if current user is a sender or recipient
      @other = current_user == @conversation.sender ? @conversation.recipient : @conversation.sender
      # get messages
      @messages = @conversation.messages.order("created_at DESC")
    else
      redirect_to conversations_path, alert: "You don't have permission to view this."
    end
  end

  def create
    @message = @conversation.messages.new(messages_params)
    @messages = @conversation.messages.order("created_at DESC")

    if @message.save
      #redirect_to conversation_messages_path(@conversation)
      # respond to JS file instead for ajax
      respond_to do |format|
        format.js
      end
    end
  end


  private

  def messages_params
    params.require(:message).permit(:content, :user_id)
  end

  def set_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end
end