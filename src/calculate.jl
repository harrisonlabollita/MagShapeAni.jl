using LinearAlgebra
include("physical.jl")
include("unitcell.jl")
include("lattice.jl")

function constants(Physical::PhysicalConstants)
	a                        = Physical.a
	m                        = Physical.moment
	mu4pi::Float64 		 = 1e-7
	convert2μeV::Float64 = 6.24 * 1e24
	return -1*1.5*convert2μeV*mu4pi*m*m*(1/(a*a*a))
end

function calculate(Lattice::AbstractLattice)
	val::Float64 = 0.0
	sites = Lattice.LatticeSites
	for i ∈ 1:Lattice.Length
		for j ∈ 1:Lattice.Length
			if i != j
				num::Float64 = ((sites[i] - sites[j])[1])^2
				deno::Float64 = norm(sites[i] - sites[j])^5
				val += num/deno
			end
		end
	end
	return val/(Lattice.Length)
end

function run(Physical::PhysicalConstants, UnitCell::AbstractUnitCell;
	tol::Float64 = 1e-3, max::Int64=100, step::Int64=1, verbose=true) 

	dims = collect(1:step:max)
	ani = zeros(length(dims))

	if verbose
		println("no. lattice sites     |     MSA (μeV)   ")
		println("----------------------------------------")
	end
	prefactor =  constants(Physical)
	for (lin, d) ∈ enumerate(dims)
		lattice	  = CreateLattice(UnitCell, d)
		ani[lin]  = calculate(lattice)
		if verbose
			println("      $(d)            |      $(ani[lin])     ")
		end
		if lin > 1
			if abs(ani[lin] - ani[lin-1]) < tol
				println("msa has converged aborting loop")
				return dims, ani
				break
			end
		end
		if lin == length(dims)
			println("msa has not converged with $(tol)")
			return dims, ani
		end
	end
end
