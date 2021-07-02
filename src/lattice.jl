include("unitcell.jl")

abstract type AbstractLattice end

struct Lattice <: AbstractLattice
	UnitCell::AbstractUnitCell
	Dimension::Int64
	LatticeSites::Array{Any, 1}
	Length::Int64
end


function CreateLattice(UnitCell::AbstractUnitCell, dimension::Int64)
	LatticeSites = []
	for i=0:dimension
		for j=0:dimension
			append!(LatticeSites, [[s[1]+i, s[2]+i] for s in UnitCell.sites])
		end
	end
	unique!(LatticeSites)
	return Lattice(UnitCell, dimension, LatticeSites, length(LatticeSites))
end
