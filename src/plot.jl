"""
Plotting results and lattices
"""


function plot_lattice(lattice::AbstractLattice)
	xpos = [site[1] for site in lattice.LatticeSites]
	ypos = [site[2] for site in lattice.LatticeSites]
	scatter(xpos, ypos, legend=false, markersize=3, grid=false)
end

function plot_msa(dims, ani; label=nothing)
	if isnothing(label)
		plot!(dims, ani, markersize = 3, legend=false, grid=false)
	else
		plot!(dims, ani, markersize = 3, label=label, grid=false)
	end
	xlabel!("N (sites)")
	ylabel!("MSA Energy (μeV)")
end

