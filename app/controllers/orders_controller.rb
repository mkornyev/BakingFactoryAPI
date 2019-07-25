class OrdersController < ApplicationController
  before_action :set_order, only: [:show]
  
  # API

  swagger_controller :orders, "Order Management"

  swagger_api :index do
    summary "Fetches all Orders"
    notes "This lists all the orders"
  end

  swagger_api :show do
    summary "Shows one Order"
    param :path, :id, :integer, :required, "Order ID"
    notes "This lists details of one order"
    response :not_found
  end

  # Controller

  def index
    @order = Order.all

    render json: @order, each_serializer: OrdersSerializer
  end

  def show
    render json: @order, each_serializer: OrderSerializer
  end
  

  private
  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:address_id, :customer_id, :grand_total)
  end

end