module Really
  FAIL_COLOR = "\e[31m"
  PASS_COLOR = "\e[32m"
  RESET_COLOR = "\e[0m"
end

class Object
  def really?(message = "This is kinda unexpected", color="")
    message.gsub!(/\?$/, '!')
    message << " FAIL!" if color == Really::FAIL_COLOR
    color, reset = (ARGV[0] == '--color' || ENV['REALLY_COLOR'] == 'true') ? [color, Really::RESET_COLOR] : ['','']
    puts "#{color}#{message}#{reset}"
  end
end

class FalseClass
  def really?(message = "No way, dude.")
    super(message.gsub(/ is /, " is not "), Really::FAIL_COLOR)
  end
end

class NilClass
  def really?(message = "Dude, nil...It's like, zen.")
    super(message.gsub(/ is /, " ain't exactly "))
  end
end

class TrueClass
  def really?(message = "Yeah, dude, like, totally.")
    super(message, Really::PASS_COLOR)
  end
end

class String
  def really?(&block)
    (!! block.call).really? self
  end
end

module Enumerable
  def really?(&block)
    failures = self.reject { |item| !!block.call(item) }
    case failures
    when []
      super "Dude!  Every single one is awesome!", Really::PASS_COLOR
    when self
      super "Dude, totally NOT!  Not even one of them is awesome.", Really::FAIL_COLOR
    else
      super "Some were cool, but there were some \"special snowflakes\": #{failures.join(', ')}", Really::FAIL_COLOR
    end
  end
end
