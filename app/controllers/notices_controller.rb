class NoticesController < ApplicationController
  def index
    @notices = Notice.all
  end

  def new
    @notice = Notice.new
  end

  def create
    @notice = Notice.new notice_params
    @notice.user_id = @current_user.id

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
  end

  private
  def notice_params
    params.require(:notice).permit(:heading, :message, :category_id)
  end
end
