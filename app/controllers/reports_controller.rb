class ReportsController < ApplicationController
  def index
    @report = current_user.reports.build
    @feed_items = Report.all.page(params[:page])
  end
  
  def new
  end
  
  def create
    @report = current_user.reports.build(report_params)
    @report.images.attach(params[:report][:images])
    if @report.save
      flash[:success] = "投稿しました"
      redirect_to reports_url
    else
      @feed_items = Report.all
      render 'reports/index'
    end
  end
  
  
  private
  
    def report_params
      params.require(:report).permit(
        :content, 
        :images,
        report_actions_attributes: [:number, :_destroy, :id]
        )
    end
end
