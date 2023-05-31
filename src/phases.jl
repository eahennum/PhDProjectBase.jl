"""
Docs to come here
"""
abstract type AbstractPhase end

# TODO: add documentation for these functions or 
function phase_name end
function constituents end
function site_fractions end
function n_atoms end


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
