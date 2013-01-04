Unit tested Corona Hello World
==============================

An example of unit testing Corona using busted.  You do not need the Corona SDK to run this.  This was not written with TDD, and is not following any seperation of concerns.  I just wanted to provide an example showing that advanced testing methods can be used within Lua for Corona Projects.

Get it running
==============

On Mac:
> brew install luarocks
> luarocks install busted
> busted test.lua

There whould be 2 successes and 0 failures.

Things you need to know
=======================

a function defined like this
```lua
function some.objectFunction (self, param1, param2)
  -- stuff here
end
```

is the same as 

```lua
function some:objectFunction (param1, param2)
 -- stuff here
end
```

Except in my experience you can write tests for the first one but not the second one, because of the way spies work with the busted testing framework.

TODO:
 * Put display mock into its own folder.
