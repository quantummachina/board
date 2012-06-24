class LinesController < ApplicationController
  before_filter :signed_in_user
  before_filter :correct_user, only: :destroy

  def create #aun no
    @conversation = Conversation.find(params[:line][:conversation_id])
    @conversation.lines.create(user_id: current_user.id, text: params[:line][:text])
    redirect_to @conversation
  end

end
