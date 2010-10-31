require './really'
require 'stringio'

module Kernel

  def capture_stdout
    out = StringIO.new
    $stdout = out
    yield
    return out.string.chomp
  ensure
    $stdout = STDOUT
  end

end

puts "\n", %s{If it's true, it's like, "you know it!"}
true.really?

puts "\n", %s{If it's false it's all, "no way!"}
(capture_stdout{ false.really? } == "No way, dude.").really?

puts "\n", %s{If it's nil, it's like "no way" but its also like, "whoa!"}
(capture_stdout{ nil.really? } == "Dude, nil...It's like, zen, y'know?").really?
