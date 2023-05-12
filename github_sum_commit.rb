
def htmltxt
  gets.chomp
end

f = File.open(htmltxt, "r")
org_txt = f.read
f.close

ix_count = 0
cell_data = []
loop do
  day_of_week = org_txt.scan(/<td .*? data-ix="#{ix_count}" .*?>.*?<\/td>/)
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
