This repository contains the SIMULINK models and MATLAB codes used as a benchmark system in the paper:

A. Tayyebi, D. Groß, A. Anta, F. Kupzog and F. Dörfler, "Frequency Stability of Synchronous Machines and Grid-Forming Power Converters" (available on IEEE Xplore: https://ieeexplore.ieee.org/document/8959148)

droop.m, VSM.m, matching.m and dVOC.m respectively generate the underlying data for the IEEE 9 bus test system including droop, VSM, matching and 
dVOC controlled grid-forming converters.

Library.slx contains the custom models for synchronous machine and various implementation of grid-forming converters.

IEEE_9_Bus_Test_System.slx contains the standard IEEE 9 bus test system implementation without any generation unit. 

This source code is distributed in the hope that it will be useful, but without any warranty.

We do request that publications in which this testbed is adopted, explicitly acknowledge that fact by citing the above mentioned paper:

@ARTICLE{TGAKD20,
	author={A. {Tayyebi} and D. {Groß} and A. {Anta} and F. {Kupzog} and F. {Dörfler}},
	journal=IEEE_J_ESTPE,
	volume={8},  number={2},  pages={1004-1018},
	title={Frequency Stability of Synchronous Machines and Grid-Forming Power Converters},
	year={2020}}

@misc{model,
title={{G}rid{F}orming{C}onverters: Implementation of Grid-Forming Control Techniques in {IEEE} 9-Bus System},
howpublished={Git repository},
author={A.Tayyebi and D. Gro\ss and A. Anta},
note = {https://github.com/ATayebi/GridFormingConverters},
year={2019}}

For further information do not hesitate to contact us: ali.tayyebi-khameneh@ait.ac.at

The related publications and presentations are also publicly available online:
https://www.researchgate.net/project/Grid-Forming-Converter-Control-Design-Applications-in-Low-Inertia-Power-System
