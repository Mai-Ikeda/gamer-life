class Public::CustomersController < ApplicationController
  
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
  
  def withdraw
  end
  
  def out
    @customer = current_customer
    @customer.destroy
    reset_session
    redirect_to root_path
  end
  
  
  private
  def customer_params
    params.require(:customer).permit(:user_name, :like_game, :is_deleted)
  end
end
