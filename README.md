# Overview

Experiments with the public TVD MHD code provided by [Pen, Arrass, and Wong](https://www.cita.utoronto.ca/~pen/MHD/).

I have downloaded and modified the magnetohydrodynamic Fortran code from https://www.cita.utoronto.ca/~pen/MHD/ and performed a few tests.  In this repository, the modified code is called `mhd_mod.f90` while the original code name is unchanged (`mhd.f90`).  The [modifications](https://github.com/Ashton-Brown/TVD-MHD-by-Pen-et-al/blob/main/mhd.f90.diff) were limited to setting initial conditions and controlling the output data files and structure.  The core MHD solver and method were untouched.

I used a Windows 10 machine, compiling with gfortran from MSYS2 MinGW 64-bit (`gfortran mhd.f90 -o mhd.exe`).

# Alfvén test

I used the Alfvén wave initial conditions (starts at [line 163 in original code](https://github.com/Ashton-Brown/TVD-MHD-by-Pen-et-al/blob/main/mhd.f90#L163)) to visualize solutions in time, as well as test stability against inital gas pressure.  The Matlab script [visualize](https://github.com/Ashton-Brown/TVD-MHD-by-Pen-et-al/blob/main/visualize.m) reads in the data output from the `mhd_mod.f90` code and animates `v_{x,y,z}` and `b_{x,y,z}` in time.  The Alfvén waves indeed translate as expected.

In the original code for the Alfven wave initial conditions, [line 173](https://github.com/Ashton-Brown/TVD-MHD-by-Pen-et-al/blob/main/mhd.f90#L173) sets the inital gas pressure, `p`, which is part of `u_5` or `e` (see also [line 179](https://github.com/Ashton-Brown/TVD-MHD-by-Pen-et-al/blob/main/mhd.f90#L179) and section 3.2 of the [published paper](https://www.cita.utoronto.ca/~pen/MHD/mhdpaper.pdf)).  Line 173 of the original code sets `p` to 0.001 and comments that this is for stability.  Results from varying this value to determine the range of stability are shown below.  The results demontrate that stability exists at very low gas pressures, down to zero (zero not shown in the figure).  However, with increasing gas pressure above 1e2 there is increasing error.

![Error](https://github.com/Ashton-Brown/TVD-MHD-by-Pen-et-al/raw/main/AlvenTests/Error.svg)

![PhaseSpace](https://github.com/Ashton-Brown/TVD-MHD-by-Pen-et-al/raw/main/AlvenTests/PhaseSpace.svg)

# Shock test

I added a set of initial conditions matching the first shock wave presented in the [published paper](https://www.cita.utoronto.ca/~pen/MHD/mhdpaper.pdf), in an attempt to repoduce figure 6 from the paper.  However, my results are inconsistent and seem unrealistic.  After a short time, the time step size significantly decreases.  Eventually, the computation goes unstable, resulting in NaNs in the solution.  This MHD solver either does not handle shock waves well or there is an issue with the solver itself.  The paper mentions in the first paragraph of section 3.3 that the publicly available code is based on a different method.  This may explain the inconsistency.

![PhaseSpace](https://github.com/Ashton-Brown/TVD-MHD-by-Pen-et-al/raw/main/ShockTests/ShockFig6Issue.svg)
