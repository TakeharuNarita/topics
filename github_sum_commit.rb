# frozen_string_literal: true

# @param none
class GithubHtml
  def initialize(html_txt)
    @html_txt = html_txt
  end

  def target_element(tag_name)
    @target = @html_txt.match(%r{<#{tag_name}.*?>[\s\S]*?\n.*?</#{tag_name}>})&.[](0)
  end

  def convert_to_cell(transpose = false) # rubocop:disable Metrics/MethodLength, Style/OptionalBooleanParameter
    ix_count = 0
    cell_data = []
    loop do
      day_of_week = @target.scan(%r{<td .*? data-ix="#{ix_count}" .*?>.*?</td>})
      break if day_of_week.empty?

      day_of_week.size.times do |i|
        x = transpose ? ix_count : i
        y = transpose ? i : ix_count
        cell_data[x] ||= []
        cell_data[x][y] = day_of_week[i].match(%r{<span class=".*?">(.+?)</span></td>})&.[](1)
      end
      ix_count += 1
    end
    cell_data
  end
end

# @param none
class GithubSumCommit
  def initialize
    @ghh = GithubHtml.new(htmltxt)
    @ghh.target_element('tbody')
  end

  def cat # rubocop:disable Metrics/AbcSize
    al = sums
    (al.size / 2).times do |i|
      puts "week:#{i} #{al[i * 2]}/#{al[i * 2 + 1]} days #{format('%#.05g', (al[i * 2].to_f / al[i * 2 + 1]))} avg"
    end
    self
  end

  def values
    al = sums
    (al.size / 2).times do |i|
      puts al[i * 2]
    end
    self
  end

  private

  def htmltxt
    # path = gets.chomp
    path = 'TakeharuNarita (Takeharu Narita).html'
    f = File.open(path, 'r')
    org_txt = f.read
    f.close
    org_txt
  end

  def sums # rubocop:disable Metrics/MethodLength
    i = 0
    ret = []
    @ghh.convert_to_cell(true).each do |row|
      sumcom = row.sum do |one_day|
        if one_day.match?(/^\d+? /)
          one_day.match(/^(\d+?) /)&.[](1).to_i
        else
          0
        end
      end
      ret << sumcom
      ret << row.size
      i += 1
    end
    ret
  end
end

GithubSumCommit.new.cat
