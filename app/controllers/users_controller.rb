class UsersController < ApplicationController
  before_filter :authenticate_user!, :except => [:login]
  
  def current
    @user = User.includes(:sites).find current_user.id
    @sites = @user.sites.order('id DESC').page(params[:page]).per(10)
  end
  
  def show
    begin
      @user = User.find_by_path params[:provider], params[:user_key]
    rescue => e
      return head :not_found
    end
    @sites = @user.sites.order('id DESC').page(params[:page]).per(10)
  end
  
  def destroy
    user = User.find current_user.id
    user.destroy
    redirect_to root_path, :notice => t('users.current.withdraw.completed')
  end
  
  def login
    
  end
end