module Admin::UsersHelper
  def users_growth_percentage
    end_current = Time.current.end_of_day
    start_current = end_current - 6.days

    start_previous = start_current - 7.days
    end_previous = start_current - 1.second

    current_count = User.where(created_at: start_current..end_current).count
    previous_count = User.where(created_at: start_previous..end_previous).count

    return "N/A" if previous_count.zero?

    percentage_change = ((current_count - previous_count).to_f / previous_count) * 100
    sprintf("%+.1f%%", percentage_change) # Ej: +2.6%
  end
end
