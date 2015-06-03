class NoticesController < ApplicationController
  def index
    @notices = all_or_date
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
    params.require(:notice).permit(:heading, :message, :category_id, :cl_id, :date_from, :date_to)
  end

   def all_or_date
    today = Time.now
    if params["/notices"]
      id = params["/notices"]["category_id"].to_i
      if id != 0
        @notices =   Notice.where("date_from <= :today AND date_to >= :today AND category_id = :id",
          {today: today, id: id})
      else 
        @notices = Notice.where("date_from <= :today AND date_to >= :today",
          {today: today})
      end
    else
       @notices = Notice.where("date_from <= :today AND date_to >= :today",
        {today: today})
    end
  end
 
end
