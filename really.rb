class Object
  def really?(message = "This is kinda unexpected")
    puts message
    message
  end
end

class FalseClass
  def really?(message = "No way, dude.")
    super(message)
  end
end

class NilClass
  def really?(message = "Dude, nil...It's like, zen, y'know?")
    super(message)
  end
end

class TrueClass
  def really?(message = "Yeah, dude, like, totally.")
    super(message)
  end
end
