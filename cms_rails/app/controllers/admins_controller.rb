class AdminsController < ApplicationController

  def create
    @user = User.find(params[:id])
    @user.admin = true
    if(@user.save)
      redirect_to admin_user_path(@user), :notice => "User updated successfully"
    else
      redirect_to admin_user_path(@user), :alert => "Admin status not set"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.admin = false
    if(@user.save)
      redirect_to admin_user_path(@user), :notice => "User updated successfully"
    else
      redirect_to admin_user_path(@user), :alert => "Admin status not changed"
    end
  end

end
