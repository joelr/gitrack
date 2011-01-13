# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def custom_time_ago_in_words(time_str)
  time = Time.parse(time_str) 
  "#{time_ago_in_words(time)} ago"
  end
end
