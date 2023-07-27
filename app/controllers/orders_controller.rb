class OrdersController < ApplicationController
  before_action :authenticate_user!


  def index
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new
  end

  def create
     @order_form = OrderForm.new(sipping_address_params)
   if @order_form.valid?
     pay_item
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
  def pay_item
   Payjp.api_key = "sk_test_022b55e313df35d3e582448a"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: order_params[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end