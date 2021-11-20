module StaticPagesHelper
  def posts_or_reports
    if current_page?(root_path)
      "posts"
    elsif current_page?(reports_path)
      "reports"
    else
      "feeds"
    end
  end
end
