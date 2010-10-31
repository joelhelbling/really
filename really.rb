class Object
  def really?(message = "This is kinda unexpected", color="")
    message.gsub!(/\?$/, '!')
    color, reset = ENV['REALLY_COLOR'] == 'true' ? [color, "\e[0m"] : ['','']
    puts "#{color}#{message}#{reset}"
  end
end

class FalseClass
  def really?(message = "No way, dude.")
    super(message.gsub(/ is /, " is not "), "\e[31m")
  end
end

class NilClass
  def really?(message = "Dude, nil...It's like, zen.")
    super(message.gsub(/ is /, " ain't exactly "))
  end
end

class TrueClass
  def really?(message = "Yeah, dude, like, totally.")
    super(message, "\e[32m")
  end
end
