# MagShapeAni.jl

For low-dimensional systems with weak spin orbit coupling (SOC), other interactions become competitive with this energy scale. This has become apparent in systems like CrCl3, where the spin-orbit coupling is so weak and the energy differences between different magnetic states becomes so small that density functional theory (DFT) calculations are no longer able to predict the correct magnetic anistropy in this system. This package allows one to calculate posteriorly the magnetic shape anisotropy which arises from dipole-dipole interactions. This term is simply a function of the lattice type of the crystal structure and some of the physical parameters of the system. 

The code works by continuously increasing the lattice size until it converges upon an energy thus reaching the infinite-limit and realistic crystal sizes.

## Currently under development
