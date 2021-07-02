module MagShapeAni

include("physical.jl")
export Physical

include("unitcell.jl")
export HoneycombUnitCell, TriangleUnitCell

include("lattice.jl")

include("calculate.jl")
export run

end
