using Test
using PrecipitationSimulationsBase

function test_composition()
    x_mg = 0.0070
    x_si = 0.0035
    c = Composition(MG = x_mg, SI = x_si)
    @test c[:MG] == x_mg
    @test c[:SI] == x_si
    @test c[:AL] == (1 - x_mg - x_si)
end

test_composition()