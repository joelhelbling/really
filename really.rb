class Object
  def really?(message = "This is kinda unexpected")
    message.gsub!(/\?$/, '!')
    puts message
    message
  end
end

class FalseClass
  def really?(message = "No way, dude.")
    super(message.gsub(/ is /, " is not "))
  end
end

class NilClass
  def really?(message = "Dude, nil...It's like, zen.")
    super(message.gsub(/ is /, " ain't exactly "))
  end
end

class TrueClass
  def really?(message = "Yeah, dude, like, totally.")
    super(message)
  end
end
