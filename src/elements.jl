module Elements

"""
Docs to come here
"""
abstract type AbstractElement end

function element_symbol end

struct Al <: AbstractElement end

element_symbol(::Al) = :AL

struct Mg <: AbstractElement end

element_symbol(::Mg) = :MG

struct Si <: AbstractElement end

element_symbol(::Si) = :SI

const MG = Mg()
const AL = Al()
const SI = Si()

export AbstractElement, element_symbol, AL, Mg, Si, AL, MG, SI

end # module Elements