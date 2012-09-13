class LinesController < ApplicationController
  before_filter :signed_in_user
  before_filter :correct_user, only: :destroy

  def create 
    @conversation = Conversation.find(params[:line][:conversation_id])
    l = @conversation.lines.create(user_id: current_user.id, text: params[:line][:text])

    if @conversation.user_id == current_user.id
    	u = User.find(@conversation.interlocutor_id)
    else
    	u = User.find(@conversation.user_id)
    end
    n = u.extra.messages + 1
    u.extra.update_attributes(messages: n)
    @conversation.update_attributes(unread: u.id)

    if u.uoption.n_messages
      AppMailer.message_notification_email(current_user, u, l ).deliver
    end

    redirect_to @conversation
  end

end
