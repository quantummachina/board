class ConversationsController < ApplicationController
  before_filter :signed_in_user
  before_filter :correct_user, only: :destroy

  def icanhelp
    c1 = current_user.conversations.find_by_interlocutor_id(params[:interlocutor_id])
    c2 = current_user.reverse_conversations.find_by_user_id(params[:interlocutor_id])

    if c1 then c = c1 else
      if c2 then c = c2 else
        c = current_user.conversations.create(interlocutor_id: params[:interlocutor_id])
      end
    end
    @collection = Collection.find(params[:collection_id])
    line = '['+ current_user.name + ' wants to help you out with your project '+ @collection.title + "]: " + params[:message]
    c.lines.create(user_id: current_user.id, text: line)
    flash[:success] = "Your message has been sent. You will be notified if you’re accepted to collaborate. Thank you!"
    redirect_to @collection
  end

  def index
    @conversations = current_user.conversations + current_user.reverse_conversations
    @conversation = if params[:id] then Conversation.find(params[:id]) else @conversations.first end
  end

  def show
    redirect_to action: 'index', id: params[:id]
  end

  def create #not in use
    c1 = current_user.conversations.find_by_interlocutor_id(params[:conversation][:interlocutor_id])
    c2 = current_user.reverse_conversations.find_by_user_id(params[:conversation][:interlocutor_id])

    if c1 then redirect_to c1 else
      if c2 then redirect_to c2 else
        current_user.conversations.create(interlocutor_id: params[:conversation][:interlocutor_id])
        redirect_to current_user.conversations.last
      end
    end

  end

end
