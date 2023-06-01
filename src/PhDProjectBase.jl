module PhDProjectBase


const DynamicNamedTuple = NamedTuple{names, <:Tuple{Vararg{Float64}}} where {names}


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


# Defines types for elements (Al, Mg...)
include("elements.jl")
using .Elements

# Defines a "Composition" data type
include("composition.jl")

# Defines a "MaterialState" data type
include("material_state.jl")

# Defines the "AbstractPhase" type
include("phases.jl")
using .Phases


"""
    effective_diffusion_coefficient(xp, xm, dc)

The effective multicomponent diffusion coefficient. `xp` and `xm` are the concentrations of 
each element in the precipitate and the matrix respectively. `dc` are the tracer diffusion
coefficients for each element.
"""
function effective_diffusion_coefficient(xp, xm, dc)
    n = length(xp)
    di = zeros(n)
    for i in 1:n
        di[i] = (xp[i] - xm[i])^2 / (xm[i] * dc[i])
    end

    inv(sum(di))
end


"""
    _effective_diffusion_coefficient(x, d, p::AbstractPhase)

The multicomponent diffusion coefficient.
"""
function effective_diffusion_coefficient(x::Composition, d, p::AbstractPhase)
    xp = site_fractions(p)
    e = keys(xp)
    xm = NamedTuple{e}(parent(x))
    de = NamedTuple{e}(d)

    effective_diffusion_coefficient(xp, xm, de)
end


export UNIV_GAS_CONST, BOLTZMANN, AVOGADRO, LATTICE_CONST_AL, MOLVOL_AL, AT_VOL_AL, 
    BURGERS_VECTOR_AL, SHEAR_MODULUS_AL

export AbstractElement, Al, Mg, Si, AL, MG, SI, element_symbol
    
export DynamicNamedTuple, composition, diff_coeff, temperature

export Composition

export MaterialState

export AbstractPhase, phase_name, constituents, site_fractions, n_atoms

export effective_diffusion_coefficient

end # module PhDProjectBase
