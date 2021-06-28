
abstract type PhysicalConstants end

struct Physical <: PhysicalConstants
	a::Float64 	# in-plane lattice parameter
	moment::Float64 	# magnetic moment
end

function Physical(a, moment)
	return Physical(a, moment)
end
