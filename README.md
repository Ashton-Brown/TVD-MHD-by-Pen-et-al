# Overview

Exploring with the public TVD MHD code provided by [Pen, Arrass, and Wong](https://www.cita.utoronto.ca/~pen/MHD/).

I have downloaded and modified the magentohydrodynamic Fortran code from https://www.cita.utoronto.ca/~pen/MHD/ and performed a few tests.  In this repository, the modified code is called `mhd_mod.f90` while the original code is `mhd.f90`.  The [modifications](https://github.com/Ashton-Brown/TVD-MHD-by-Pen-et-al/blob/main/mhd.f90.diff) were limited to setting initial conditions and controlling the output data files and structure.  The core MHD solver and method were untouched.

# Alven test

I used the Alven wave initial conditions (starts at [line 163 in original code](https://github.com/Ashton-Brown/TVD-MHD-by-Pen-et-al/blob/main/mhd.f90#L163)) to visualize solution in time, as well as test stability against inital gas pressure.  The Matlab script [visualize](https://github.com/Ashton-Brown/TVD-MHD-by-Pen-et-al/blob/main/visualize.m) reads in the data output from my modified `mhd.f90` code and animates `v_{x,y,z}` and `b_{x,y,z}` in time.  The Alven waves indeed translate as expected.  Results from the stability test, from varying gas pressure ([line 201 in my modifed code](https://github.com/Ashton-Brown/TVD-MHD-by-Pen-et-al/blob/main/mhd_mod.f90#L201)) shown below.  They show that with increasing gas pressure there is increasing error.

![Error](https://github.com/Ashton-Brown/TVD-MHD-by-Pen-et-al/raw/main/AlvenTests/Error.png)

![PhaseSpace](https://github.com/Ashton-Brown/TVD-MHD-by-Pen-et-al/raw/main/AlvenTests/PhaseSpace.png)

# Shock test

I added initial conditions matching the first shock wave presented in the published paper (also linked at the above website), in an attempt to repoduce figure 6 from the paper.  However, the results are inconsistent and seem unrealistic.  The MHD solver either does not handle shock waves well or there is an issue with the solver itself.
