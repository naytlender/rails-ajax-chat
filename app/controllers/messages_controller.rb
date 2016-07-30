class MessagesController < ApplicationController
  def index
    @chat_room = ChatRoom.find(params[:chat_room_id])
    @messages = @chat_room.messages.where('id > ?', params[:after_id].to_i).
      order(:id)

    respond_to do |format|
      format.js
      format.html
    end
  end

  def create
    respond_to do |format|
      chat_room = ChatRoom.find(params[:chat_room_id])
      @message = chat_room.messages.create(message_params)
      if @message.save
        flash[:notice] = "Successfully created..."
      else
        flash[:notice] = "Disaster..."
      end
      format.html { render layout: false }
      format.js
    end
  end

  private

  def message_params
    params.require(:message).permit(:body).merge(user_id: current_user.id)
  end
end
