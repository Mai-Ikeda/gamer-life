class Admin::CustomersController < ApplicationController
  before_action :authenticate
  
  def index
    @customers = Customer.all.page(params[:page]).per(10)
  end
  
  def show
    @customer = Customer.find(params[:id])
    @impressions = @customer.impressions.page(params[:page]).per(4)
  end
  
  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admin_customer_path(@customer.id)
  end
  
  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to admin_top_path
  end
  
  
  private
  
  def authenticate
    redirect_to new_admin_session_path unless admin_signed_in?
  end
  
  def customer_params
    params.require(:customer).permit(:user_name, :like_game, :is_deleted)
  end
end
