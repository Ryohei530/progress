class ReportCommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def create
    @comment = ReportComment.new(report_comment_params)
    if @comment.save
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def destroy
    ReportComment.find(params[:id]).destroy
    redirect_to report_url(params[:report_id])
  end

  private

    def report_comment_params
      params.require(:report_comment).permit(:content, :reply_id, :report_id).merge(user_id: current_user.id, report_id: params[:report_id])
    end

    def correct_user
      @user = ReportComment.find(params[:id]).user
      redirect_to(root_url) unless current_user?(@user)
    end
end
