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
