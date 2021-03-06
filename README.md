# Aerodynamics simulation applications.

By Mohammad Zandsalimy (mohammad.zandsalimy@ubc.ca)

Some of my previous projects are presented below.

## Vortex Panel Method
This is a program for computing the pressure distribution and lift over NACA 4-digit airfoils in a potential flow field. The airfoil is generated and the geometry is built using potential vortex panels, then the flow field is numerically solved and pressure coefficients on these panels are calculated. The user is free to choose any NACA 4-digit airfoil and angle of attack, but the prediction of flow is valid only at low angles of attack, until the flow detachment occurs. Here we can see a NACA 0012 airfoil at a 10 degree angle of attack analyzed by the code. On the bottom right side plot the predicted pressure coefficients are compared to those in the experiment, the large red  circles are my predictions and there is a very low error.

![Alt Text](Previous/c1.jpg)

## Conical Flow
This method is based on the Taylor Maccoll method for calculating the shock angle given both flow mach number and cone deflection angle. Conical flow calculations are important for many applications such as supersonic engine intake design. The program can input the cone angle and free stream Mach number and output the shock angle, or simply calculate a table for general use as seen here. 

![Alt Text](Previous/c2.jpg)

## Nozzle and Fanno Tube 
This code can calculate the pressure and mach number inside the system of a nozzle and a Fanno tube. This problem is important in designing supersonic wind tunnels. In this problem there reservoir is at 500 [kpa] to the left side of the nozzle. The back pressure is reduced from a high pressure to low pressure.

![Alt Text](Previous/c3.jpg)

## Axial Flow Nozzle Design
This program can design the geometry of a minimum length nozzle for a supersonic wind tunnel (Axial flow) using characteristic lines method. The program inputs the desired outlet mach number, then outputs the geometry for that nozzle. This code is useful in designing supersonic wind tunnel nozzles. The following images show a nozzle designed for an outlet mach number of 2.0.

![Alt Text](Previous/c4.jpg)

## Supersonic Engine Intake Design
This program inputs the ambient pressure, temperature, flight mach number, and mass flow rate required for the engine. Then the intake in is designed in two different shapes; a single wedge and a wedge with two angles. The output of the program is the intake area and wedge angles as well as the stagnation pressure loss. You can choose to show pressure, temperature, density, and mach number plots.

![Alt Text](Previous/c5.jpg)



