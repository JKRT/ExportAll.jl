import Test
using Test
@testset "Export test" begin
  module bar
  
  using ExportAll

  function foo()
    1
  end

  function bar()
    2

  end

  @exportAll()

  end

  @test foo() == 1
  @test bar() == 2
end
