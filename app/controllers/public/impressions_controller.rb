class Public::ImpressionsController < ApplicationController
  before_action :authenticate_customer!, only:[:new,:edit]

  def new
    @impression = Impression.new
  end

  def create
    @impression = Impression.new(impression_params)
    @impression.customer_id = current_customer.id
    if @impression.save!
      flash[:notice] = "IMPRESSION was successfully created."
      redirect_to impressions_path
    else
      @impressions = Impression.all
      render :new
    end
  end

  def index
    @impressions = Impression.published.page(params[:page]).per(10)
  end

  def show
    @impression = Impression.find(params[:id])
    @impressions = Impression.all
    @comment = Comment.new
  end

  def edit
    @impression = Impression.find(params[:id])
  end

  def update
    @impression = Impression.find(params[:id])
    @genre = Genre.find(params[:id])
    @impression.genre_id = @genre.id
    if @impression.update(impression_params)
      flash[:notice] = "IMPRESSION was successfully updated."
      redirect_to impression_path(@impression.id)
    else
      render :edit
    end
  end

  def destroy
    @impression = Impression.find(params[:id])
    @impression.destroy
    redirect_to impressions_path
  end
  
  def confirm
    @impressions = current_customer.impressions.draft.page(params[:page]).reverse_order
  end


private

  def impression_params
    params.require(:impression).permit(:title,:body,:rate,:genre_id,:status)
  end

end