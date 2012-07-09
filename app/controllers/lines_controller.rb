class LinesController < ApplicationController
  before_filter :signed_in_user
  before_filter :correct_user, only: :destroy

  def create 
    @conversation = Conversation.find(params[:line][:conversation_id])
    @conversation.lines.create(user_id: current_user.id, text: params[:line][:text])

    if @conversation.user_id == current_user.id
    	u = User.find(@conversation.interlocutor_id)
    else
    	u = User.find(@conversation.user_id)
    end
    n = u.extra.notifications + 1
    u.extra.update_attributes(notifications: n)

    redirect_to @conversation
  end

end
