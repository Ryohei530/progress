module UsersHelper
  
  def sum_of_monthly_actions
    @sum1 = 0
    @user.reports.each do |report|
      @sum1 += report.report_actions.first.number
    end
  end
end
