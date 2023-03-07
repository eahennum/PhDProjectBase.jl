"""
Type to store the material properties for the matrix.
"""
Base.@kwdef struct MaterialState
    "The chemical composition"
    comp::Composition
    "Tracer diffusion coefficients"
    diff_coeff::DynamicNamedTuple
    "Temperature in K"
    temperature::Float64
end

composition(mp::MaterialState) = mp.comp
composition(mp::MaterialState, e::Symbol) = mp.comp[e]
composition(mp::MaterialState, i::Int) = mp.comp[i]

diff_coeff(mp::MaterialState) = mp.diff_coeff
diff_coeff(mp::MaterialState, e::Symbol) = mp.diff_coeff[e]
diff_coeff(mp::MaterialState, i::Int) = mp.diff_coeff[i]

temperature(mp::MaterialState) = mp.temperature