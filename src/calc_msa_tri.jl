using LinearAlgebra
using Printf

function unit_cell(i::Int64, j::Int64)
	# create the unitcell for a triangular lattice
	to_cart = [1  0.5; 0 0.5*sqrt(3)]
	return [to_cart * [0.0 + i, 0.0 + j]]
end

function create_lattice(dim::Int64)
	# create supercell with the linear size dime
	lattice = []
	for i=0:dim
		for j=0:dim
			append!(lattice, unit_cell(i, j))
		end
	end
	return lattice
end

function Mij(lattice)
	convert2μeV::Float64 = 6.24 *1e24
	val::Float64 = 0
	L = length(lattice)
	for i=1:length(lattice)
		for j=1:length(lattice)
			if i != j
				num::Float64 = ((lattice[i] - lattice[j])[1])^2
				deno::Float64 = norm( lattice[i] - lattice[j])^5
				val += num/deno
			end
		end
	end
	return val/L * convert2μeV
end

m = 3 * 9.274 *1e-24
mu4pi = 1e-7
a = 3.18*1e-10
prefact = -1*1.5*mu4pi*m*m*(1/(a*a*a))

lattice_sizes = zeros(60)
msa = zeros(60)

for i=1:length(lattice_sizes)
	lattice_sizes[i] = i
	msa[i] = prefact*Mij(create_lattice(i))
	@printf "%d 	%0.4f\n" i msa[i]
end

