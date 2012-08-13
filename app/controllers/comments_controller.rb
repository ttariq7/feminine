class CommentsController < ApplicationController


    def create
      @micropost = Micropost.find(params[:micropost_id])
      @comment = Comment.new(params[:comment])
      @comment.micropost = @micropost
      @comment.user = current_user
      if @comment.save
        redirect_to current_user
      else
        render 'static_pages/help'
      end
    end
  
    def show
      @micropost = Micropost.find(params[:id])
      @comment = Micropost.comment.find(params[:id])
    end
  
  
  def destroy
    @comment = current_user.comments.find(params[:id])
    @micropost = Micropost.find(params[:micropost_id])
    @comment.destroy
    
    respond_to do |format|
      format.html { redirect_to @current_user }
    end
  end
end