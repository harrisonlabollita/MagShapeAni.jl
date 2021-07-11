include("../../src/calculate.jl")


moment = 3.108 * 9.274 * 1e-24
aX     = [ 5.98 * 1e-10, 6.26 * 1e-10, 6.87 * 1e-10]
labels = ["CrCl3", "CrBr3", "CrI3"]
for (label, a) in zip(labels, aX)
	dim, ani = run(Physical(a, moment), HoneycombUnitCell();  max = 60)
	plot_msa(dim, ani, label=label)
end
