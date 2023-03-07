using Test
using PrecipitationSimulationsBase


function test_material_state(ms)
    elements = keys(composition(ms))
    @testset "Interface functions" begin
        for e in elements
            @test isa(composition(ms, e), Float64)
        end
    
        for e in elements
            @test isa(diff_coeff(ms, e), Float64)
        end

        @test isa(temperature(ms), Float64)
    end        
end

c = Composition(MG = 0.0070, SI = 0.0035)
dc = (AL = 1e-15, MG = 1e-15, SI = 1e-15)
ms = MaterialState(comp=c, diff_coeff=dc, temperature=723.15)

test_material_state(ms)
    


# m = MaterialState(comp = c, diff_coeff = dc, temperature = 723.15)