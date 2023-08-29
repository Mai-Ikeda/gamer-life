class Admin::HomesController < ApplicationController
  
  def top
    @customers = Customer.all
    @impressions = Impression.all
  end
  
end
