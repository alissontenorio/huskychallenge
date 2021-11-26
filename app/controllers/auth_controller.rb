class AuthController < ApplicationController
  before_action :require_login, only: %i[ log_out ]

  def login
  end

  def auth
    if @user = User.load_from_activation_token(params[:id])
      auto_login @user
      flash.keep[:notice] = "User Logged."
      respond_to do |format|
        format.html { redirect_to :controller => :invoices, :action => :index }
        # format.json { render :show, status: :created, location: @invoice }
      end
    else
      not_authenticated
    end
  end

  def log_out
    logout
    flash.keep[:notice] = "You have logout =("

    respond_to do |format|
      format.html { redirect_to root_path }
      # format.json { render :show, status: :created, location: @user }
    end
  end
end
