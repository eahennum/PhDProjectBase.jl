module PrecipitationSimulationsBase

export UNIV_GAS_CONST, BOLTZMANN, AVOGADRO, LATTICE_CONST_AL, MOLVOL_AL, AT_VOL_AL, 
    BURGERS_VECTOR_AL, SHEAR_MODULUS_AL, ElementNamedTuple, MaterialState
    composition, diffcoeff, temperature

const ElementNamedTuple = NamedTuple{names, <:Tuple{Vararg{Float64}}} where {names}

include("constants.jl")


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


"""
    temperature(x::Any)

Returns the temperature in K for the object x.
"""
function temperature end


include("material_state.jl")


end # module AluCalcBase
