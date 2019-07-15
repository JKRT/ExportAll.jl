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
