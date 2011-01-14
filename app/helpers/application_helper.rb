# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  require 'digest/md5'
  def custom_time_ago_in_words(time_str)
  time = Time.parse(time_str) 
  "#{time_ago_in_words(time)} ago"
  end
  
  def branch_list(branches)
    branchlist = []
    branches.each_with_index do |index, value|
			branchlist << index[0]
    end
    branchlist.join(",")
  end
  
       def gravatar(email, options={})
         src = h(gravatar_url(email, options))
         [:class, :alt, :size].each { |opt| options[opt] = h(options[opt]) }
         "<img class=\"#{options[:class]}\" alt=\"#{options[:alt]}\" width=\"#{options[:size]}\" height=\"#{options[:size]}\" src=\"#{src}\" />"      
       end
  
       def gravatar_url(email, options={})
         email_hash = Digest::MD5.hexdigest(email)
         options[:default] = CGI::escape(options[:default]) unless options[:default].nil?
         returning "http://www.gravatar.com/avatar.php?gravatar_id=#{email_hash}" do |url| 
           [:rating, :size, :default].each do |opt|
             unless options[opt].nil?
               value = h(options[opt])
               url << "&#{opt}=#{value}" 
             end
           end
         end
       end
       
  def div_class(line)
    if (line.lstrip[0] && line.lstrip[0].chr == "+")
      "code_line addition"
    elsif (line.lstrip[0] && line.lstrip[0].chr == "-")
      "code_line subtraction"
    elsif (line.lstrip[0] && line.lstrip[0].chr == "@")
      "code_line line_num"
    else
      "code_line"
    end
    
  end
  
  def filter_class(date)
    classes = []
    if Time.parse(date) > (Time.now - 7.days)
      classes << "day7"
    end
    if Time.parse(date) > (Time.now - 2.days)
      classes << "day2"
    end
    if Time.parse(date) > (Time.now - 1.days)
      classes << "day1"
    end
    if Time.parse(date) > (Time.now - 1.month)
      classes << "month1"
    end
    classes << "alltime"
    classes.join(" ")
  end
  
  def get_commit(url)
    parts = url.split("/")
    parts[4]
  end
    
  
end
