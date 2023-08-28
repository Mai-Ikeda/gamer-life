class Admin::ImpressionsController < ApplicationController
  before_action :authenticate
  
  def index
    @impressions = Impression.all.page(params[:page]).per(10)
  end
  
  def show
    @impression = Impression.find(params[:id])
  end
  
  def destroy
    @impression = Impression.find(params[:id])
    @impression.destroy
    redirect_to admin_impressions_path
  end
  
  private

  def authenticate
    redirect_to new_admin_session_path unless admin_signed_in?
  end
  
end
