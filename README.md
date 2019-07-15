# ExportAll.jl

Provides a simple macro that exports all symbol of a module (export *). Use at your own risk WIP PL:s and issues are very much welcome :)

It basically works by exporting all symbols that are not imported from the module from which it is called or symbols defined in any of the standard modules. I use it myself for some library modules where I need to export all functions

EX: 
```
 module Bar
  using ExportAll

  function foo()
    1
  end

  function bar()
    2
  end

  function barBar()
    3
  end

  @exportAll()
end

module Foo 
  using Bar
  a = foo()
end
```
