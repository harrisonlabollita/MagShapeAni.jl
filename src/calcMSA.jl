using LinearAlgebra
using Printf

function unitCell(i, j)
    toCart = [1 -0.5; 0.0 0.5*sqrt(3)]
    site1  = toCart * [0.0 + i, 0.0 + j]
    site2  = toCart * [0.333333 + i, 0.666666667 + j]
    return [site1, site2]
end

function createLattice(dimension)
    lattice = []
    for i in 0:dimension
        for j in 0:dimension
            append!(lattice, unitCell(i, j))
        end
    end
    return lattice
end

function Mij(dim::Int64, lattice)
    convert2microeV::Float64 = 6.24 * 1e24
    val::Float64 = 0
    for i in 1:length(lattice)
        for j in 1:length(lattice)
            if i != j
                num::Float64 = ((lattice[i] - lattice[j])[1])^2
                deno::Float64 = norm(lattice[i] - lattice[j])^5
                val += num/deno
            end
        end
    end
    return val/(length(lattice))*convert2microeV
end


m              = 3.108 * 9.274 * 1e-24
mu4pi          = 1e-7
aCl            = 5.98 * 1e-10
prefact        = -1 * 1.5 * mu4pi * m * m * (1/(aCl*aCl*aCl))


latticeSizes = zeros(60)
MSA = zeros(60)
	
for i in 1:length(latticeSizes)
      latticeSizes[i] = i
      MSA[i] = prefact * Mij(i, createLattice(latticeSizes[i]))
      @printf "%d	%0.4f\n" i MSA[i]
end
