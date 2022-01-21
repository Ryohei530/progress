module ReportsHelper
  def set_rdays_params
    time = @report.created_at
    date = @report.created_at.to_date
    beg_time = time.beginning_of_day.since(3.hours)
    end_time = time.end_of_day
    later_beg_time = time.beginning_of_day
    later_end_time = time.end_of_day.ago(21.hours)

    if time.between?(beg_time, end_time)
      r_days_params(date)
    elsif time.between?(later_beg_time, later_end_time)
      r_days_params(date.yesterday)
    end
  end

  def r_days_params(date)
    latest_r_day = current_user.running_days.last

    if latest_r_day.nil?
      r_days_params_vars(false, date)
    elsif latest_r_day.date == date.yesterday
      r_days_params_vars(true, date)
    else
      r_days_params_vars(false, date)
    end
  end

  def r_days_params_vars(s_or_c, date)
    latest_r_day = current_user.running_days.last
    if s_or_c
      params[:running][:start_date] = latest_r_day.start_date
      params[:running][:date] = date
      params[:running][:s_or_c] = true
      params[:running][:r_days] = (date - latest_r_day.start_date).to_i + 1
    else
      params[:running][:start_date] = date
      params[:running][:date] = date
      params[:running][:s_or_c] = false
      params[:running][:r_days] = 1
    end
  end
end
