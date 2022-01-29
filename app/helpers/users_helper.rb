module UsersHelper
  def sum_of_monthly_actions
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
          sum += report.report_actions[n - 1].number
        end
        @sums[n - 1] = sum
      end
      @monthly_sums += @sums

      ratio_sum = 0
      m_actions = monthly_goal.goal_actions

      m_actions.zip(@sums.reverse) do |m_act, sum|
        ratio_sum += ((sum.to_f / m_act.number) * 100).round(1)
      end
      @monthly_ratios << (ratio_sum / count).round(1)
    end
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
      if now.between?(term_start, (term_start + 7.days))
        [term_start..(term_start + 7.days)]
      elsif now.between?((term_start + 7.days), (term_start + 14.days))
        [(term_start + 7.days)..(term_start + 14.days)]
      elsif now.between?((term_start + 14.days), (term_start + 21.days))
        [(term_start + 14.days)..(term_start + 21.days)]
      elsif now.between?((term_start + 21.days), (term_start + 28.days))
        [(term_start + 21.days)..(term_start + 28.days)]
      elsif now.between?((term_start + 28.days), (term_end + 1.day))
        [(term_start + 28.days)..(term_end + 1.day)]
      end)

    num.each do |n|
      sum = 0
      reports.each do |report|
        sum += report.report_actions[n - 1].number
      end
      @week_sums[n - 1] = sum
    end

    @day_date = []
    terms = if now.between?(term_start, (term_start + 6.days))
              (term_start..(term_start + 6.days))
            elsif now.between?((term_start + 7.days), (term_start + 13.days))
              ((term_start + 7.days)..(term_start + 13.days))
            elsif now.between?((term_start + 14.days), (term_start + 20.days))
              ((term_start + 14.days)..(term_start + 20.days))
            elsif now.between?((term_start + 21.days), (term_start + 27.days))
              ((term_start + 21.days)..(term_start + 27.days))
            elsif now.between?((term_start + 28.days), term_end)
              ((term_start + 28.days)..term_end)
            else
              (Date.today..Date.today.next_day(6))
            end

    # term_obj = {
    #     day: term.wday,
    #     date: term.strftime('%-m月%-d日')
    #   }
    #   @day_date << term_obj
    terms.each do |term|
      @day_date << term.strftime('%-m月%-d日')
    end

    @week_terms = [
      term_start.strftime('%-d日') + '〜' + (term_start + 6.days).strftime('%-d日'),
      (term_start + 7.days).strftime('%-d日') + '〜' + (term_start + 13.days).strftime('%-d日'),
      (term_start + 14.days).strftime('%-d日') + '〜' + (term_start + 20.days).strftime('%-d日'),
      (term_start + 21.days).strftime('%-d日') + '〜' + (term_start + 27.days).strftime('%-d日'),
      (term_start + 28.days).strftime('%-d日') + '〜' + (term_end).strftime('%-d日')
    ]

    day_done = []
    day_dones = []
    num.each do |n|
      reports.each do |report|
        day_done << report.report_actions[n - 1].number
      end
      @day_done = day_done.reverse
      day_dones << @day_done
    end

    @day_dones = day_dones.reverse

    wktms = [
      [term_start..(term_start + 7.days)],
      [(term_start + 7.days)..(term_start + 14.days)],
      [(term_start + 14.days)..(term_start + 21.days)],
      [(term_start + 21.days)..(term_start + 28.days)],
      [(term_start + 28.days)..(term_end + 1.day)]
    ]

    week_reports_array = []
    wktms.each do |wktm|
      week_reports_array << monthly_goal.reports.where(created_at: wktm)
    end

    week_dones = []

    week_reports_array.each do |week_reports|
      week_done = []
      num.each do |n|
        sum = 0
        week_reports.each do |report|
          sum += report.report_actions[n - 1].number
        end
        week_done[n - 1] = sum
      end
      week_dones << week_done
    end

    wk_dones = []
    num.each do |n|
      array = []
      week_dones.each do |done|
        array << done[n - 1]
      end
      wk_dones[n - 1] = array
    end
    @week_dones = wk_dones.reverse
  end

  def days_of_month
    monthly_goal = @user.monthly_goals.last
    @days_of_month = (monthly_goal.term_end - monthly_goal.term_start).to_i
  end

  def days_of_week
    monthly_goal = @user.monthly_goals.last
    term_start = monthly_goal.term_start
    term_end = monthly_goal.term_end
    now = Date.current

    @days_of_week = (
      if now.between?((term_start + 21.days), term_end)
        (term_end - (term_start + 21.days)).to_i
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
      elsif now.between?((term_start + 21.days), (term_start + 27.days))
        (term_start + 21.days).strftime('%m月%d日') + "〜" + (term_start + 27.days).strftime('%m月%d日')
      elsif now.between?((term_start + 28.days), term_end)
        (term_start + 28.days).strftime('%m月%d日') + "〜" + term_end.strftime('%m月%d日')
      end
  end
end
