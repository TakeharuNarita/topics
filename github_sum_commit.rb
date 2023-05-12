# frozen_string_literal: true

def htmltxt
  path = "../temp/take.html"
  # path = gets.chomp
  f = File.open(path, 'r')
  org_txt = f.read
  f.close
  org_txt
end

# @param none
class GithubHtml
  def initialize(html_txt)
    @html_txt = html_txt
  end

  def target_element(tag_name)
    p @target = @html_txt.match(/<#{tag_name}.*?>[\s\S]*?\n<\/#{tag_name}>/)&.[](0)
  end

  def convert_to_cell(transpose = false) # rubocop:disable Metrics/MethodLength
    ix_count = 0
    cell_data = []
    loop do
      day_of_week = @target.scan(/<td .*? data-ix="#{ix_count}" .*?>.*?<\/td>/)
      break if day_of_week.size == 0
    
      (day_of_week.size).times do |i|
        x = transpose ? ix_count : i
        y = transpose ? i : ix_count
        cell_data[x] ||= []
        cell_data[x][y] = day_of_week[i].match(/<span class=".*?">(.+?)<\/span><\/td>/)&.[](1)
      end
      ix_count += 1
    end
    cell_data
  end
end

# pp cell_data

ghh = GithubHtml.new(htmltxt)
ghh.target_element('tbody')

i = 0
ghh.convert_to_cell(true).each do |row|
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
