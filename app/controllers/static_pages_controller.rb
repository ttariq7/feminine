class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed
    end
    @microposts = Micropost.all



  end

  def help
  end
  
  def new
     @user = User.new
  end
end
