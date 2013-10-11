module DateHelper
  def format_to_short_date_time(date)
    date.strftime("%A, %b %e - %l:%M %p")
  end

  def format_to_long_date_time(date)
    date.strftime("%a %b %e, %Y - %l:%M %p")
  end

end