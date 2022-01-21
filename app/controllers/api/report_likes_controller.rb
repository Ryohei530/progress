class Api::ReportLikesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def index
    @report = Report.find(params[:report_id])
    @report_likes = @report.report_likes
    @count = @report_likes.count
    @like = @report_likes.find_by(user_id: current_user.id) if current_user
  end

  def create
    @report = Report.find(params[:report_id])
    @report.report_likes.create!(user_id: current_user.id) if current_user
    head :created
  end

  def destroy
    @report = Report.find(params[:report_id])
    @report.report_likes.find_by(user_id: current_user.id).destroy! if current_user
    head :ok
  end

  private

    def correct_user
      @user = ReportLike.find(params[:id]).user
      redirect_to(root_url) unless current_user?(@user)
    end
end
