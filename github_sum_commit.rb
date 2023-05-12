# frozen_string_literal: true

# @param none
def htmltxt
  path = "../temp/take.html"
  # path = gets.chomp
  f = File.open(path, "r")
  org_txt = f.read
  f.close
  org_txt
end


ix_count = 0
cell_data = []
tbodytxt = htmltxt.match(/<tbody.*?>.*?<\/tbody>/m)&.[](0)
loop do
  day_of_week = tbodytxt.scan(/<td .*? data-ix="#{ix_count}" .*?>.*?<\/td>/)
  break if day_of_week.size == 0

  (day_of_week.size).times do |i|
    cell_data[ix_count] ||= []
    cell_data[ix_count][i] = day_of_week[i].match(/<span class=".*?">(.+?)<\/span><\/td>/)&.[](1)
  end
  
  ix_count += 1
end
# pp cell_data

i = 0
cell_data.each do |row|
  sumcom = row.sum do |one_day|
    if one_day.match?(/^\d+? /)
      one_day.match(/^(\d+?) /)&.[](1).to_i
    else
      0
    end
  end
  # puts "#{sumcom}"
  puts "week:#{i} #{sumcom}/#{row.size} days #{ "%#.05g" % ( sumcom.to_f / row.size ) } avg"
  i += 1
end
