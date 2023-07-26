class OrdersController < ApplicationController
  before_action :authenticate_user!


  def index
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new
  end

  def create
     @order_form = OrderForm.new(sipping_address_params)
   if @order_form.valid?
     @order_form.save
     redirect_to root_path
   else
    @item = Item.find(params[:item_id]) 
     render :index, status: :unprocessable_entity
   end
  end
  
  private

  def sipping_address_params
    params.require(:order_form).permit(:postcode, :area_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  #def order_params
    #params.require(:order_form).permit(:user_id, :item_id)
  #end
end