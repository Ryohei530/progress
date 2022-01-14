module UsersHelper

  def sum_of_monthly_actions
    
    # monthly_goal = @user.monthly_goals.last
    # count = monthly_goal.goal_actions.length
    # num = (1..count).to_a
    # @sums = []
    
    # num.each do |n|
    #   sum = 0
    #   monthly_goal.reports.each do |report|
    #     sum += report.report_actions[n-1].number
    #   end
    #   @sums[n-1] = sum
    # end
   
    
    # ratios = 0
    # m_actions = monthly_goal.goal_actions
    
    # m_actions.zip(@sums.reverse) do |m_act, sum|
    #   ratios += ((sum.to_f / m_act.number) * 100).round(1) 
    # end
    
    # @monthly_ratios = []
    
    # monthly_ratio = (ratios / count).round(1)
    
    
    
    monthly_goals = @user.monthly_goals
    @monthly_ratios = []
    @monthly_sums = []
    
    monthly_goals.each do |monthly_goal|
      
      count = monthly_goal.goal_actions.length
      num = (1..count).to_a
      @sums = []
      
      num.each do |n|
        sum = 0
        monthly_goal.reports.each do |report|
          sum += report.report_actions[n-1].number
        end
        @sums[n-1] = sum
        
      end
      @monthly_sums += @sums 
      
      
      ratio_sum = 0
      m_actions = monthly_goal.goal_actions
      
      m_actions.zip(@sums.reverse) do |m_act, sum|
        ratio_sum += ((sum.to_f / m_act.number) * 100).round(1) 
      end
      @monthly_ratios << (ratio_sum / count).round(1)
    end
    
    
    # @sum1 = 0
    # monthly_goal.reports.each do |report|
    #   action1 = report.report_actions.first
    #   @sum1 += action1.number 
    # end
    
    # @sum2 = 0
    # monthly_goal.reports.each do |report|
    #   action2 = report.report_actions.second
    #   @sum2 += action2.number if action2.present?
    # end
    
    # @sum3 = 0
    # monthly_goal.reports.each do |report|
    #   action3 = report.report_actions.third
    #   @sum3 += action3.number if action3.present?
    # end
    
    # @sum4 = 0
    # monthly_goal.reports.each do |report|
    #   action4 = report.report_actions.find(4)
    #   @sum4 += action4.number if action4.present?
    # end
    
    # @sum5 = 0
    # monthly_goal.reports.each do |report|
    #   action5 = report.report_actions.find(5)
    #   @sum5 += action5.number if action5.present?
    # end
    
    
    # @sum = [@sum1, @sum2, @sum3, @sum4, @sum5]
    
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
  
  def sum_of_weekly_actions
    monthly_goal = @user.monthly_goals.last
    term_start = monthly_goal.term_start
    term_end = monthly_goal.term_end
    
    count = monthly_goal.goal_actions.length
    num = (1..count).to_a
    @week_sums = []
    now = Date.current
  
    reports = monthly_goal.reports.where(created_at: 
      if now.between?(term_start, (term_start + 6.days))
        [term_start..(term_start + 6.days)]
      elsif now.between?((term_start + 7.days), (term_start + 13.days))
        [(term_start + 7.days)..(term_start + 13.days)]
      elsif now.between?((term_start + 14.days), (term_start + 20.days))
        [(term_start + 14.days)..(term_start + 20.days)]
      elsif now.between?((term_start + 21.days), term_end)
        [(term_start + 21.days)..term_end]
      end
      )
    
    num.each do |n|
      sum = 0
      reports.each do |report|
        sum += report.report_actions[n-1].number
      end
      @week_sums[n-1] = sum
    end
    
    @day_date = []
    terms = if now.between?(term_start, (term_start + 6.days))
              (term_start..(term_start + 6.days))
            elsif now.between?((term_start + 7.days), (term_start + 13.days))
              ((term_start + 7.days)..(term_start + 13.days))
            elsif now.between?((term_start + 14.days), (term_start + 20.days))
              ((term_start + 14.days)..(term_start + 20.days))
            elsif now.between?((term_start + 21.days), term_end)
              ((term_start + 21.days)..term_end)
            end
            
    terms.each do |term|
      @day_date << term.strftime('%-m月%-d日')
    end
    
    
    @day_done = []
    reports.each do |report|
      @day_done << report.report_actions.first.number
    end

  end
  
  def days_of_month
    monthly_goal = @user.monthly_goals.last
    @days_of_month = (monthly_goal.term_end - monthly_goal.term_start)
  end
  
  def days_of_week
    monthly_goal = @user.monthly_goals.last
    term_start = monthly_goal.term_start
    term_end = monthly_goal.term_end
    now = Date.current
    
    @days_of_week = (
      if now.between?((term_start + 21.days), term_end)
        term_end - (term_start + 21.days)
      else 
        7
      end
      )
      
    @nth_week = 
      if now.between?(term_start, (term_start + 6.days))
        term_start.strftime('%m月%d日') + "〜" + (term_start + 6.days).strftime('%m月%d日')
      elsif now.between?((term_start + 7.days), (term_start + 13.days))
        (term_start + 7.days).strftime('%m月%d日') + "〜" + (term_start + 13.days).strftime('%m月%d日')
      elsif now.between?((term_start + 14.days), (term_start + 20.days))
        (term_start + 14.days).strftime('%m月%d日') + "〜" + (term_start + 20.days).strftime('%m月%d日')
      elsif now.between?((term_start + 21.days), term_end)
        (term_start + 21.days).strftime('%m月%d日') + "〜" + term_end.strftime('%m月%d日')
      end
  end

end
