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

"If it's true, it's like, totally?".really? { true }

"If it's false it's all, no way?".really? do
  !! capture_stdout{ false.really? }.match(/No way, dude\./)
end

"If it's nil, it's like no way but its also like, whoa?".really? do
  !! capture_stdout{ nil.really? }.match(/Dude, nil...It's like, zen./)
end

# alternative messages
farms_message = "The farm is awesome?"

%s{And sometimes it's true, and it says something different?}.to_s.really? do
  !! capture_stdout{ true.really? farms_message }.match(/The farm is awesome!/)
end

%s{Sometimes it says something different when it's false?}.to_s.really? do
  !! capture_stdout{ false.really? farms_message }.match(/The farm is not awesome! FAIL!/)
end

%s{Sometimes when it's nil it says something kinda different?}.to_s.really? do
  !! capture_stdout{ nil.really? farms_message }.match(/The farm ain't exactly awesome!/)
end

%s{We want String#really? to accept a block?}.to_s.really? do
  std = capture_stdout { "Foo is bar?".really? { true } }
  !! std.match(/Foo is bar!/)
end

%s{And String#really? uses the string as its message?}.to_s.really? do
  std = capture_stdout { "Bar is foo?".really? { false } }
  !! std.match(/Bar is not foo! FAIL!/)
end

%q{Enumerables! How do they work?  With blocks that like them!}.really? do
  std = capture_stdout do
    %w{food fools moon}.really? do |word|
      word.match /oo/
    end
  end
  !! std.match(/Every single one is awesome!/)
end

%q{Of course, sometimes nothing goes right.}.really? do
  std = capture_stdout do
    %w{grub ghouls clouds}.really? do |word|
      word.match /oo/
    end
  end
  !! std.match(/totally NOT!  Not even one of them is awesome./)
end

%q{And sometimes some pass and some fail.}.really? do
  std = capture_stdout do
    %w{food fools moon}.really? do |word|
      !word.match /foo/
    end
  end
  !! std.match(/"special snowflakes": food, fools/)
end
