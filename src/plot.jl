"""
Plotting results and lattices
"""


function plot_lattice(lattice::AbstractLattice)
	xpos = [site[1] for site in lattice.LatticeSites]
	ypos = [site[2] for site in lattice.LatticeSites]
	scatter(xpos, ypos, legend=false, markersize=3, grid=false)
end

function plot_msa(dims, ani)
	plot(dims, ani, markersize = 3, legend=false, grid=false)
	xlabel!("N (sites)")
	ylabel!("MSA Energy (μeV)")
end
