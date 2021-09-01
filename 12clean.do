/*create 2012 dataset*/
/*Author: Masanori Matsuura*/
clear all
set more off

*set the path
global RALS12="C:\Users\user\Documents\research\obed\data\RALS12_Stata_Data"
global RALS15="C:\Users\user\Documents\research\obed\data\RALS15_Stata_Data"
global clean12="C:\Users\user\Documents\research\obed\data\clean12"
**hhid
use $RALS12/id.dta, clear
keep cluster hh S_DD E_DD prov dist 
save $clean12/id12, replace
**socio-economic variables
use $RALS12/hh_part1, clear
keep cluster hh HH01A HH01B

merge 1:1 cluster hh using  $RALS12/hh_part2, nogen
merge 1:1 cluster hh using $RALS12/salwage, nogen
save $clean12/soceco12, replace

**demographic variables
use $RALS12/demog_adult, clear
use $RALS12/demog_child, clear
use $RALS12/demog_agserv, clear

**agronomic variables
use $RALS/maizesals, clear

