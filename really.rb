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
