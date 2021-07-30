class ReportLikesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy
  
  def create
    @report = Report.find(params[:report_id])
    like = @report.report_likes.build(user_id: current_user.id)
    if like.save
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end
  
  def destroy
    @report = Report.find(params[:report_id])
    like = @report.report_likes.find_by(user_id: current_user.id)
    if like.present?
      like.destroy
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end
  
    private
    
    def correct_user
      @user = ReportLike.find(params[:id]).user
      redirect_to(root_url) unless current_user?(@user)
    end
end
