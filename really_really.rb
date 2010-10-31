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

true.really?

output = capture_stdout do
  false.really?
end
(output == "No way, dude.").really?

output = capture_stdout do
  nil.really?
end
(output == "Dude, nil...It's like, zen, y'know?").really?
