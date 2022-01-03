# EK301-Truss-Project
This Repository is student made code for calculating tension and compression forces in simple trusses. 
- It satisfies all requirements for the ENG EK301 Acryllic truss project and the extra credit components.
- This project includes modular, truss analysis and visualization tools for rapid prototyping simple trusses.
- _Only compressive buckling is taken into account of the failure of a member in a truss._
- Any material can be used as long as the Critical Load constant and weight per unit length ratio is defined._For for Fall 2021, the material used to design the truss were acryllic strips with PCrit = 2560 oz*m^-2_. 
- Deadload is accounted for, and has the option to be toggles in your truss design .m files.

You may fill in your new truss .m file by looking at the example truss files in this repo
1. Create your connection (C) Matrix in a new file
2. Create coordinates for each of the pins of the truss (x, y) for X & Y matrices
3. Create your structure joints Sx & Sy matrices
4. Add your load in the L matrix
5. Toggle deadload on or off (0/1)
6. Send your C, X, Y, Sx, Sy, L Deadload

- The TrussAnalyzer.m file will calculate all tensile and compressive forces on each pin join, and will print out all the necessary information about the total weight, cost, and critical members
- TrussAnalyzer.m calls TrussDesign.m to display all 3 scenarios where your Pcrit may be within +/- and its nominal case
