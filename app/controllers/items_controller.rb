class ItemsController < ApplicationController
  def index
  end

  def new
    redirect_to user_session_path unless user_signed_in?
  end
end
