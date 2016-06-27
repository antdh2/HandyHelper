class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @conversations = Conversation.involving(current_user)
  end

  def create
    # check if conversation exists between 2 users
    if Conversation.between(params[:sender_id], params[:recipient_id]).present?
      # if it does create variable
      @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
    else
      # if not then create one
      @conversation = Conversation.create(conversation_params)
    end

    redirect_to conversation_messages_path(@conversation)
  end




  private

  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end

end