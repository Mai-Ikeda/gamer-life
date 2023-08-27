class Public::SearchesController < ApplicationController
  before_action :authenticate_customer!
  
  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]
    if @model == 'customer'
      @records = Customer.search_for(@content, @method)
    elsif @model == 'impression'
      @records = Impression.search_for(@content,@method)
    else
      @records = Genre.search_for(@content,@method)
    end
  end
end
