struct Composition
    values::DynamicNamedTuple

    function Composition(x::DynamicNamedTuple, ref::Symbol=:AL)
        xv = values(x)
        x_ref = 1 - sum(xv)
        x_ref < 0 && throw("Invalid concentrations. x_ref < 0: $x_ref")
        
        new(NamedTuple{(ref, keys(x)...)}((x_ref, xv...)))
    end
end

Base.parent(ev::Composition) = getfield(ev, :values)
Base.getindex(ev::Composition, sym::Symbol) = getindex(parent(ev), sym)
Base.getproperty(ev::Composition, sym::Symbol) = getproperty(parent(ev), sym)
Base.keys(ev::Composition) = keys(parent(ev))
Base.values(ev::Composition) = values(parent(ev))

Base.show(io::IO, ev::Composition) = print(io, parent(ev))


# """
# """
# function Composition(x::DynamicNamedTuple, ref::Symbol=:AL)
#     xv = values(x)
#     x_ref = 1 - sum(xv)
#     x_ref < 0 && throw("Invalid concentrations. x_ref < 0: $x_ref")

#     Composition(NamedTuple{(ref, keys(x)...)}((x_ref, xv...)))
# end


"""
    Composition(ref::Symbol=:AL, elements...)

Constructs a composition type from the input elements given as keyword arguments 
(e.g. MG = 0.006). The concentration of the reference elements is 1 - sum(x), where x are 
the concentrations of  the elements. 
"""
function Composition(;ref::Symbol=:AL, elements...)
    x = NamedTuple(elements)
    # xv = values(x)
    # x_ref = 1 - sum(xv)
    # x_ref < 0 && throw("Invalid concentrations. x_ref < 0: $x_ref")

   #  Composition(NamedTuple{(ref, keys(x)...)}((x_ref, xv...)))
   Composition(x, ref)
end
