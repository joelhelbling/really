Really?
=======

So we were at SDTConf 2010 and @chzy was like, your mission is to test drive the bowling kata without using a prefab test framework like rspec or cucumber, or test unit and whatnot.  So @joshwalsh and I were like "fine."  And we created this test framework called "Really?" It really(?) is a simple test framework, which is like, totally awesome.

Usage
-----

### The Basics
    (true == true).really?
    
    (true == false).really?
    
    nil.really?

### Custom Messages
    true.really? "The farm is refreshing?" #=> "The farm is refreshing!"
    
    false.really? "The farm is refreshing?" #=> "The farm is not refreshing!"
    
    nil.really? "The farm is refreshing?" #=> "The farm ain't exactly refreshing!"

Color
-----

At this point, you can have your test output in color, with passing tests in green, and failing tests in red, if you'll just be a pal and set an environment variable `REALLY_COLOR=true`.  Eventually it'd be really cool if we accepted a command-line parameter, like `--color`.  Well check out the roadmap below.  That's why we're awesome.  We're looking out for you.  Reconize.

Roadmap
-------
* switch on color with `--color` command-line parameter.
* let `some_string.really?` accept a closure: `"The grass is so green!".really? { false } #=> "The grass is not so green!"`
