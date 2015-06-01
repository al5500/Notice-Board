class NoticesController < ApplicationController
  def index
    @notices = Notice.all
  end

  def new
    @notice = Notice.new
    unless @current_user
      redirect_to '/users/new'
    end
  end

  def create
    @notice = Notice.new notice_params
    @notice.user_id = @current_user.id
    
    cloudinary = Cloudinary::Uploader.upload(params[:notice]['cl_id'].path)
    @notice.cl_id = cloudinary['public_id']
  
    if @notice.save
      redirect_to '/notices'
    else
      redirect_to '/notices/new'
    end
  end

  def edit
  end

  def update 
  end

  def destroy
    notice = Notice.find params[:id]
    notice.destroy
    redirect_to notices_path
  end

  private
  def notice_params
    params.require(:notice).permit(:heading, :message, :category_id, :cl_id)
  end
end
