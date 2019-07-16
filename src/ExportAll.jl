#= MIT License
Copyright (c) 2019 John Tinnerhom

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
=#

module ExportAll
  macro exportAll()
    inI = []
    out = []
    res = []
    
    for name in Base.names(__module__, all = true)
      push!(out, :(export $(name)))
    end

    for name in Base.names(__module__, all = false, imported = true)
      push!(inI, :(export $(name)))
    end

    for name in Base.names(Main.Base, all = false, imported = true)
      push!(inI, :(export $(name)))
    end

    for name in Base.names(Main.Core, all = false, imported = true)
      push!(inI, :(export $(name)))
    end
    
    for e in out
      if e in inI || e == :(export include) || '#' in string(e)
        continue
      end
        push!(res, :($(e)))
    end
    #= Do not export things that we already have =#
    ret = Expr(:block, res...)
    return ret
  end
#= :)) =#
@exportAll()
end # module
