require './really'

# raise exception on false.really?
begin
  (true == false).really?
rescue Exception => e
  (e.message == "No way, dude.").really?
end

# give a merit badge on true.really?
(true == true).really?

