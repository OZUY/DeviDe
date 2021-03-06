class UsersController < ApplicationController

  layout "user_layouts"
  def show
    @user = User.find(params[:id])
    @message = Message.new
    @messages = current_user.univ.messages

  end
  def edit

  end
  def update
    current_user.update(update_params)
  end

  private
  def update_params
   params.require(:user).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :avatar)
  end
end
