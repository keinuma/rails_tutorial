class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      store_cookie user
      render :nothing => true, :status => 204
    else
      render :nothing => true, :status => 401
    end
  end
end
