class ReportsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :correct_or_admin_user, only: :destroy
  
  def index
    @report = current_user.reports.build if logged_in?
    @feed_items = Report.all.page(params[:page])
  end
  
  def new
  end
  
  def create
    @report = current_user.reports.build(report_params)
    
    if @report.save
      r_days = current_user.running_days
      
      unless r_days.first.nil?
        @latest_r_day = r_days.last.date 
      end
      
      #その日既に日報が投稿されている時、running_daysを作らない
      unless @latest_r_day == @report.created_at.to_date
        set_rdays_params
        @running_day = r_days.build(running_days_params)
        @running_day.save
      else
        @running_day = r_days.last
      end
      
      @report.r_days = @running_day.r_days
      @report.save
      
      flash[:success] = "投稿しました"
      redirect_to reports_url
    else
      @feed_items = Report.all.page(params[:page])
      render 'reports/index'
    end
  end
  
  def show
    @report = Report.find(params[:id])
    @comment = ReportComment.new
    @comments = ReportComment.includes(:user).where(report_id: params[:id]).where(reply_id: nil)
    @replies = ReportComment.includes(:user).where(report_id: params[:id]).where.not(reply_id: nil)
    #@comment_reply = 
  end
  
  def edit
    @report = Report.find(params[:id])
  end
  
  def update
    @report = Report.find(params[:id])
    if @report.update(report_params)
      flash[:success] = "更新が完了しました"
      redirect_to @report
    else
      render 'edit'
    end
  end
  
  def destroy
    Report.find(params[:id]).destroy
    flash[:success] = "日報を削除しました"
    redirect_to reports_url
  end
  
  
  private
  
    def report_params
      params.require(:report).permit(
        :content, 
        :monthly_goal_id,
        images: [],
        report_actions_attributes: [:number, :_destroy, :id]
        )
    end
    
    def correct_user
      @user = Report.find(params[:id]).user
      redirect_to(root_url) unless current_user?(@user)
    end
    
    def correct_or_admin_user
      @user = Report.find(params[:id]).user
      redirect_to(root_path) if !current_user?(@user) && !current_user.admin?
    end
    
    def running_days_params
      params.require(:running).permit(
        :start_date, 
        :date,
        :s_or_c,
        :r_days
      )
    end
    
    
    
end
