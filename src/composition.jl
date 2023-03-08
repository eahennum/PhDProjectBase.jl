struct Composition
    values::DynamicNamedTuple

    function Composition(x::DynamicNamedTuple, ref::Symbol=:AL)
        xv = values(x)
        x_ref = 1 - sum(xv)
        x_ref < 0 && throw("Invalid concentrations. x_ref < 0: $x_ref")
        
        new(NamedTuple{(ref, keys(x)...)}((x_ref, xv...)))
    end
end

Base.parent(c::Composition) = getfield(c, :values)
Base.getindex(c::Composition, sym::Symbol) = getindex(parent(c), sym)
Base.getindex(c::Composition, i) = getindex(parent(c), i) 
# Base.getproperty(c::Composition, sym::Symbol) = getproperty(parent(c), sym)
Base.keys(c::Composition) = keys(parent(c))
Base.values(c::Composition) = values(parent(c))
Base.length(c::Composition) = length(parent(c))

Base.show(io::IO, c::Composition) = print(io, parent(c))


"""
    Composition(ref::Symbol=:AL, elements...)

Constructs a composition type from the input elements given as keyword arguments 
(e.g. MG = 0.006). The concentration of the reference elements is 1 - sum(x), where x are 
the concentrations of  the elements. 
"""
function Composition(;ref::Symbol=:AL, elements...)
    x = NamedTuple(elements)

   Composition(x, ref)
end
