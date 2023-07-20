class ItemsController < ApplicationController
  # before_action :authenticate_user!, except: [index]
  def index
  end
  private

  def message_params
    params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end
end
