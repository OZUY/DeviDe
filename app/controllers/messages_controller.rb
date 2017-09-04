class MessagesController < ApplicationController


  def create
  Message.create(create_params)
  redirect_to user_path(current_user) and return
end

private
def create_params
  params.require(:message).permit(:text).merge(user_id: current_user.id, univ_id: current_user.univ_id)
end

end
