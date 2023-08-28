class Public::CommentsController < ApplicationController
  
  def create
    @impression = Impression.find(params[:impression_id])
    @comment = current_customer.comments.new(post_comment_params)
    @comment.impression_id = @impression.id
    @comment.save
    redirect_to impression_path(@impression.id)
  end
  
  def edit
    @impression = Impression.find(params[:id])
    @comment = Comment.find(params[:id])
  end
  
  def update
    @impression = Impression.find(params[:id])
    @comment = Comment.find(params[:id])
    if @comment.update(post_comment_params)
      flash[:success] = " Comment updated"
      redirect_to @impression
    else
      flash[:danger] = "Comment failed"
      render 'edit'
    end
  end
  
  def destroy
    Comment.find(params[:id]).destroy
    redirect_to impression_path(params[:impression_id])
  end
    
    
  private
  
  def post_comment_params
    params.require(:comment).permit(:post_comment)
  end
end