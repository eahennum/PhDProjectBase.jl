module AluCalcBase

export composition, diffcoeff, ElementNamedTuple

const ElementNamedTuple = NamedTuple{names, <:Tuple{Vararg{Float64}}} where {names}


"""
    composition(x::Any, [e::Symbol])

Returns the composition corresponding to element ´e´ of the object ´x´
"""
function composition end


"""
    diffcoeff(x::Any, [e::Symbol])

Returns the diffusion coefficient for element ´e´. If the element is not specified, a tuple
with all elements will be returned.
"""
function diffcoeff end

end # module AluCalcBase
