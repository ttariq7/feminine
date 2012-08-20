class CommentsController < ApplicationController

  def index
       @comments = Comment.all
       respond_to do |format|
         format.html # index.html.erb
         format.rss
       end
     end
     
    def create
      @micropost = Micropost.find(params[:micropost_id])
      @comment = Comment.new(params[:comment])
      @comment.micropost = @micropost
      @comment.user = current_user
      if @comment.save
           respond_to do |format|
                format.html
                format.js
           end
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
      format.html
    end
  end
end