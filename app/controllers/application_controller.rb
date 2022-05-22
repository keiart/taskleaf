class ApplicationController < ActionController::Base
  helper_method :current_user
  before_action :login_required

  private

  # ログイン中のユーザー情報
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  # ログイン制限
  def login_required
    redirect_to login_path unless current_user
  end
end
