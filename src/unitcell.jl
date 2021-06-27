"""
unitcell.jl

Defines the possible unitcells that can be used
"""

abstract type AbstractUnitCell end


struct TriangleUnitCell <: AbstractUnitCell
	sites::Array{Array{Float64,1},1}
	toCartesian::Array{Float64,2} # converts lattice vectors to cartesian basis
end

function TriangleUnitCell()
	sites       = [[0., 0.]]
	toCartesian = [1 0.5; 0.0 0.5*sqrt(3)]
	return TriangleUnitCell(sites, toCartesian)
end


struct HoneycombUnitCell <: AbstractUnitCell
	sites::Array{Array{Float64,1},1}
	toCartesian::Array{Float64,2}
end

function HoneycombUnitCell()
	sites       = [[0.0, 0.0], [1/3., 2/3.]]
    	toCartesian = [1 -0.5; 0.0 0.5*sqrt(3)]
	return HoneycombUnitCell(sites, toCartesian)
end
