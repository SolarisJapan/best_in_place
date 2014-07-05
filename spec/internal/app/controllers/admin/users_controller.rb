class Admin::UsersController < ApplicationController
  def show
    @user = User.find params[:id]
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      @user.update_attributes(user_params)
      format.json { respond_with_bip(@user) }
    end
  end

  private

  def user_params
    params.require(:user).permit!
  end
end
