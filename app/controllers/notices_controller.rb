class NoticesController < ApplicationController
  def index
    if params["/notices"]
      id = params["/notices"]["category_id"].to_i
      if id != 0
        @notices = Category.find( id ).notices
      else 
        @notices = Notice.all
      end
    else 
      @notices = Notice.all
    end
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
    if params[:notice]['file'].present?
      cloudinary = Cloudinary::Uploader.upload(params[:notice]['file'].path)
      @notice.cl_id = cloudinary['public_id']
    end
    if @notice.save
      redirect_to '/notices'
    else
      redirect_to '/notices/new'
    end
  end

  def edit
    @notice = Notice.find params[:id]
  end

  def update 
    notice = Notice.find params[:id]
     if params[:notice]['file'].present?
      cloudinary = Cloudinary::Uploader.upload(params[:notice]['file'].path)
      notice.cl_id = cloudinary['public_id']
    end
    notice.update notice_params
    redirect_to notice
  end

  def show 
    @notice = Notice.find params[:id]
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
