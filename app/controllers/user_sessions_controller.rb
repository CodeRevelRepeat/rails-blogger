class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(user_session_params)

    respond_to do |format|
      if @user_session.save
        format.html { redirect_to root_path, notice: 'User session was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    respond_to do |format|
      format.html { redirect_to new_user_session_url, notice: 'User session was successfully destroyed.' }
    end
  end

  private
    def user_session_params
      params.require(:user_session).permit(:username, :password)
    end
end