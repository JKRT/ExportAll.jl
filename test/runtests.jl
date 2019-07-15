module ExportAllTest
  using Test
  include("Bar.jl")
  using .Bar
  using ExportAll
@testset "Export test" begin
  @test foo() == 1
  @test bar() == 2
  @test barBar() == 3
end

end #= ExportAllTest =#
