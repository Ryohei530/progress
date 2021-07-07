class ReportLikesController < ApplicationController
  
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
end
