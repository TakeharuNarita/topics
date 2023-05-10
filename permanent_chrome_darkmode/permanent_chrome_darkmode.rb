# rubocop:disable all
# frozen_string_literal: true

# @param none
class Rewriting
  def initialize
    @old_txt = "# Note: exec -a below is a bashism.\nexec -a \"$0\" \"$HERE/chrome\" \"$@\""
    @new_txt = "# Note: exec -a below is a bashism.\nexec -a \"$0\" \"$HERE/chrome\" \"--enable-features=WebUIDarkMode\" \"--force-dark-mode\"  \"$@\""
  end

  def rewriting
    f = File.open('/opt/google/chrome/google-chrome', "r")
    p f
    in_sh = f.read
    puts "\n\n--------------------------------------------------------------------------------------------------------------------------------\n\n"
    puts in_sh
    f.close
    out_sh = in_sh.gsub(@old_txt, @new_txt)
    puts "\n\n--------------------------------------------------------------------------------------------------------------------------------\n\n"
    puts out_sh
    f = File.open('/opt/google/chrome/google-chrome', "w")
    f.write(out_sh)
    f.close
  end
end
Rewriting.new.rewriting
# rubocop:enable all