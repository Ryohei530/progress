module UsersHelper
  
  
  def sum_of_monthly_actions
    monthly_goal = @user.monthly_goals.last
    
    @sum1 = 0
    monthly_goal.reports.each do |report|
      @sum1 += report.report_actions.first.number
    end
    
    @sum2 = 0
    monthly_goal.reports.each do |report|
      @sum2 += report.report_actions.second.number
    end
    
    @sum3 = 0
    monthly_goal.reports.each do |report|
      @sum3 += report.report_actions.third.number
    end
    
    @sum4 = 0
    monthly_goal.reports.each do |report|
      @sum4 += report.report_actions.find(4).number
    end
    
    @sum5 = 0
    monthly_goal.reports.each do |report|
      @sum5 += report.report_actions.find(5).number
    end
    
    
    @sum = [@sum1, @sum2, @sum3, @sum4, @sum5]
    
    # sum1, sum2, sum3, sum4, sum5 = 0, 0, 0, 0, 0
    
    # monthly_goal.reports.each do |report|
    #   actions = report.report_actions
      
    #   actions.map do |action|
    #     sum = action.number
    #   end
      
    #   action1 = report.report_actions.first
    #   action2 = report.report_actions.second
    #   action3 = report.report_actions.third
    #   action4 = report.report_actions.find(4)
    #   action5 = report.report_actions.find(5)
    #   sum1 += action1.number 
    #   sum2 += action2.number if action2.present?
    #   sum3 += action3.number if action3.present?
    #   sum4 += action4.number if action4.present?
    #   sum5 += action5.number if action5.present?
    # end
  end
  
  def days_of_term
    monthly_goal = @user.monthly_goals.last
    @days_of_month = (monthly_goal.term_start - monthly_goal.term_end)
  end
end
