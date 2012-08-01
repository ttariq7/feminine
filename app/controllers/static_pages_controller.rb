class StaticPagesController < ApplicationController
  def home
  end

  def help
  end
  
  def new
     @user = User.new
  end
end
