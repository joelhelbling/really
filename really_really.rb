require './really'
require 'stringio'

module Kernel

  def capture_stdout
    ansi_color = ENV['REALLY_COLOR']
    ENV['REALLY_COLOR'] = nil
    out = StringIO.new
    $stdout = out
    yield
    ENV['REALLY_COLOR'] = ansi_color
    return out.string.chomp
  ensure
    $stdout = STDOUT
  end

end

puts "\n", %s{If it's true, it's like, "you know it!"}
true.really?

puts "\n", %s{If it's false it's all, "no way!"}
(!! capture_stdout{ false.really? }.match(/No way, dude\./)).really?

puts "\n", %s{If it's nil, it's like "no way" but its also like, "whoa!"}
(!! capture_stdout{ nil.really? }.match(/Dude, nil...It's like, zen./)).really?

# alternative messages
farms_message = "The farm is awesome?"

puts "\n", %s{And sometimes it's true, and it says something different.}
(!! capture_stdout{ true.really? farms_message }.match(/The farm is awesome!/)).really?

puts "\n", %s{Sometimes it says something different when it's false.}
(!! capture_stdout{ false.really? farms_message }.match(/The farm is not awesome!/)).really?

puts "\n", %s{Sometimes when it's nil it says something kinda different.}
(!! capture_stdout{ nil.really? farms_message }.match(/The farm ain't exactly awesome!/)).really?
