# ExportAll.jl

Provides a simple macro that exports all symbols of a module (export *). Use at your own risk, it is also BAD practice to do things like this. However, it is convenient somtimes. PL:s and issues are very much welcome :)

It basically works by exporting all symbols that are not imported from the module from which it is called or symbols defined in any of the standard modules. I use it myself for some library modules where I need to export all functions. If someone else finds this useful please leave a star :)

``` julia
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
  b = bar()
  c = barBar()
end
```
