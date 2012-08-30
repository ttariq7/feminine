class MicropostsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user,   only: :destroy

  def create
    @micropost = current_user.microposts.build(params[:micropost])
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_path
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end



  def show
    
     @micropost = Micropost.find(params[:id])
  +  @comments = @micropost.comments.all

     respond_to do |format|
       format.html # show.html.erb
       format.xml  { render :xml => @micropost }
     end
   end

  def destroy
    @micropost.destroy
    redirect_to root_path
  end
  
  
  def vote_up
    begin
      current_user.vote_for(@micropost = Micropost.find(params[:id]))
      redirect_to current_user
      
    rescue ActiveRecord::RecordInvalid
      redirect_to current_user
    end
  end
  
  def tagged
        if params[:tag].present? 
        @microposts = Micropost.tagged_with(params[:tag])
      else 
        @microposts = Micropost.micropostall
      end  
  end
  
  def tag_cloud
    @tags = Micropost.tag_counts_on(:tags)
  end

  private

    def correct_user
      @micropost = current_user.microposts.find_by_id(params[:id])
      redirect_to root_path if @micropost.nil?
    end
end