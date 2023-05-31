module Constants

# Natural constants
"The gas constant"
const UNIV_GAS_CONST = 8.314456

"Boltzmanns constant"
const BOLTZMANN = 1.38064852e-23

"Avogadro number - (mol⁻¹)"
const AVOGADRO = 6.02214076e23

# Material constants for aluminium
"Lattics constant for aluminium"
const LATTICE_CONST_AL = 4.046e-10

"Molar volume (m³/mol) for FCC aluminium"
const MOLVOL_AL = 1e-5

"Atomic volume for FCC aluminium"
const AT_VOL_AL = MOLVOL_AL / AVOGADRO

"Burgers vector for aluminium [m]"
const BURGERS_VECTOR_AL = LATTICE_CONST_AL/sqrt(2)

"Shear modulus for aluminium "
const SHEAR_MODULUS_AL = 26e9

export UNIV_GAS_CONST, BOLTZMANN, AVOGADRO, LATTICE_CONST_AL, MOLVOL_AL, AT_VOL_AL, 
    BURGERS_VECTOR_AL, SHEAR_MODULUS_AL

end # module Constants