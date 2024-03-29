module Phases

using PhDProjectBase.Elements

"""
Docs to come here
"""
abstract type AbstractPhase end

# TODO: add documentation for these functions or 
function phase_name end

"""
Docs to come here
"""
constituents(::AbstractPhase) = error("Not implemented")

"""
Docs to come here
"""
site_fractions(::AbstractPhase) = error("Not implemented")

"""
Docs to come here
"""
n_atoms(p::AbstractPhase) = sum(values(constituents(p)))


"""
    site_fraction(p::AbstractPhase, e::Symbol)

Returns the site fraction for the specified element `e` for the phase `p`.
"""
function site_fraction(p::AbstractPhase, e::Symbol)
    sf = site_fractions(p)
    
    haskey(sf, e) ? sf[e] : 0
end


"""
    site_fraction(p::AbstractPhase, e::AbstractElement)

Returns the site fraction when element `e` specified as `AbstractElement` type.
"""
function site_fraction(p::AbstractPhase, e::AbstractElement)
    es = element_symbol(e)

    site_fraction(p, es)
end


export AbstractPhase, phase_name, constituents, site_fractions, site_fraction, n_atoms 

end # module Phases