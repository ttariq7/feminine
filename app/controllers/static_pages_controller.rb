class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed
    end
    @microposts = Micropost.all
    @comment = Comment.new

  end
  
  def feed
    if signed_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed
    end
    @microposts = Micropost.all
    @comment = Comment.new
  end

  def help
    @comment = Comment.new
    @tag_counts = Micropost.tag_counts_on(:tags).order('count desc').limit(20)
  end
  
  def new
     @user = User.new
  end
end
