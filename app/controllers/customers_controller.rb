class CustomersController < ApplicationController
  include ActionView::Helpers::NumberHelper
  before_action :set_customer, only: [:show] #, :update, :destroy]

  # API Code 

  swagger_controller :customers, "Customer Management"

  swagger_api :index do
    summary "Fetches all Customers"
    notes "This lists all the customers"
  end

  swagger_api :show do
    summary "Shows one Customer"
    param :path, :id, :integer, :required, "Customer ID"
    notes "This lists details of one customer"
    response :not_found
  end

  # Controller Code 
  
  def index
    @customer = Customer.all

    render json: @customer
  end

  def show
    render json: @customer 
  end

  # def create
  #   @customer = Customer.new(customer_params)
  #   if @customer.save
  #     render json: @customer, status: :created, location: @customer
  #   else
  #     render json: @customer.errors, status: :unprocessable_entity
  #   end
  # end

  # def update
  #   if @customer.update(customer_params)
  #     render json: @customer
  #   else
  #     render json: @customer.errors, status: :unprocessable_entity
  #   end
  # end

  # def destroy
  #   @customer.destroy
  # end 

  private
  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :email, :phone, :active)
  end

end