EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:conn
LIBS:MAVRIClib
LIBS:Passives
LIBS:STMicroelectronics
LIBS:Connectors
LIBS:Main Board-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 4
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L BRITELA BTA1
U 1 1 551DBC36
P 2150 2200
F 0 "BTA1" H 2500 1700 60  0000 C CNN
F 1 "BRITELA" H 2150 2600 60  0000 C CNN
F 2 "" H 1800 2300 60  0000 C CNN
F 3 "" H 1800 2300 60  0000 C CNN
	1    2150 2200
	1    0    0    -1  
$EndComp
$Comp
L BRITELA BTA2
U 1 1 551DBC5F
P 2150 3400
F 0 "BTA2" H 2500 2900 60  0000 C CNN
F 1 "BRITELA" H 2150 3800 60  0000 C CNN
F 2 "" H 1800 3500 60  0000 C CNN
F 3 "" H 1800 3500 60  0000 C CNN
	1    2150 3400
	1    0    0    -1  
$EndComp
Text HLabel 2700 4450 0    60   Input ~ 0
Reg+5V
Wire Wire Line
	3050 2400 3050 4450
Wire Wire Line
	3050 3600 2750 3600
Wire Wire Line
	2750 2400 3050 2400
Connection ~ 3050 2400
Wire Wire Line
	3050 4450 2700 4450
Connection ~ 3050 3600
Wire Wire Line
	2750 2100 2900 2100
Wire Wire Line
	2900 2100 2900 4100
Wire Wire Line
	2900 3300 2750 3300
Connection ~ 2900 3300
$Comp
L GND #PWR1
U 1 1 551E15A1
P 2900 4100
F 0 "#PWR1" H 2900 3850 60  0001 C CNN
F 1 "GND" H 2900 3950 60  0000 C CNN
F 2 "" H 2900 4100 60  0000 C CNN
F 3 "" H 2900 4100 60  0000 C CNN
	1    2900 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 2500 3500 2500
Text HLabel 4550 2500 2    60   Output ~ 0
ANA1
Text HLabel 4550 3700 2    60   Output ~ 0
ANA2
Wire Wire Line
	4000 2500 4550 2500
Wire Wire Line
	4100 2500 4100 2600
Wire Wire Line
	4100 3700 4100 3800
Wire Wire Line
	3450 3700 2750 3700
$Comp
L GND #PWR?
U 1 1 551E2FB6
P 4100 3200
F 0 "#PWR?" H 4100 2950 60  0001 C CNN
F 1 "GND" H 4100 3050 60  0000 C CNN
F 2 "" H 4100 3200 60  0000 C CNN
F 3 "" H 4100 3200 60  0000 C CNN
	1    4100 3200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 551E3088
P 4100 4450
F 0 "#PWR?" H 4100 4200 60  0001 C CNN
F 1 "GND" H 4100 4300 60  0000 C CNN
F 2 "" H 4100 4450 60  0000 C CNN
F 3 "" H 4100 4450 60  0000 C CNN
	1    4100 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 3100 4100 3200
Wire Wire Line
	4100 4300 4100 4450
Connection ~ 4100 2500
Wire Wire Line
	3950 3700 4550 3700
Connection ~ 4100 3700
$Comp
L Resistor R?
U 1 1 551EF2FC
P 3750 2500
F 0 "R?" V 3600 2600 60  0000 L CNN
F 1 "1k" V 3700 2600 60  0000 L CNN
F 2 "1206" H 3650 2500 60  0001 C CNN
F 3 "" H 3750 2600 60  0001 C CNN
F 4 "Panasonic" H 3750 2500 60  0001 C CNN "Manufacturer"
F 5 "ERJ-8ENF2001V" H 3750 2500 60  0001 C CNN "Manufacturer Part #"
F 6 "Digi-Key" H 3750 2500 60  0001 C CNN "Vendor"
F 7 "P2.00KFCT-ND" H 3750 2500 60  0001 C CNN "Vendor Part #"
F 8 "1/4W" V 3800 2600 50  0000 L CNN "Power"
F 9 "1%" V 3900 2600 50  0000 L CNN "Tolerance"
	1    3750 2500
	1    0    0    -1  
$EndComp
$Comp
L Resistor R?
U 1 1 551EF3C9
P 4100 2850
F 0 "R?" V 3950 2950 60  0000 L CNN
F 1 "2k" V 4050 2950 60  0000 L CNN
F 2 "1206" H 4000 2850 60  0001 C CNN
F 3 "" H 4100 2950 60  0001 C CNN
F 4 "Rohm Semiconductor" H 4100 2850 60  0001 C CNN "Manufacturer"
F 5 "MCR18ERTF2001" H 4100 2850 60  0001 C CNN "Manufacturer Part #"
F 6 "Digi-Key" H 4100 2850 60  0001 C CNN "Vendor"
F 7 "RHM2.00KCJCT-ND" H 4100 2850 60  0001 C CNN "Vendor Part #"
F 8 "1/4W" V 4150 2950 50  0000 L CNN "Power"
F 9 "1%" V 4250 2950 50  0000 L CNN "Tolerance"
	1    4100 2850
	0    1    1    0   
$EndComp
$Comp
L Resistor R?
U 1 1 551EF532
P 3700 3700
F 0 "R?" V 3550 3800 60  0000 L CNN
F 1 "1k" V 3650 3800 60  0000 L CNN
F 2 "1206" H 3600 3700 60  0001 C CNN
F 3 "" H 3700 3800 60  0001 C CNN
F 4 "Panasonic" H 3700 3700 60  0001 C CNN "Manufacturer"
F 5 "ERJ-8ENF2001V" H 3700 3700 60  0001 C CNN "Manufacturer Part #"
F 6 "Digi-Key" H 3700 3700 60  0001 C CNN "Vendor"
F 7 "P2.00KFCT-ND" H 3700 3700 60  0001 C CNN "Vendor Part #"
F 8 "1/4W" V 3750 3800 50  0000 L CNN "Power"
F 9 "1%" V 3850 3800 50  0000 L CNN "Tolerance"
	1    3700 3700
	1    0    0    -1  
$EndComp
$Comp
L Resistor R?
U 1 1 551EF61E
P 4100 4050
F 0 "R?" V 3950 4150 60  0000 L CNN
F 1 "2k" V 4050 4150 60  0000 L CNN
F 2 "1206" H 4000 4050 60  0001 C CNN
F 3 "" H 4100 4150 60  0001 C CNN
F 4 "Rohm Semiconductor" H 4100 4050 60  0001 C CNN "Manufacturer"
F 5 "MCR18ERTF2001" H 4100 4050 60  0001 C CNN "Manufacturer Part #"
F 6 "Digi-Key" H 4100 4050 60  0001 C CNN "Vendor"
F 7 "RHM2.00KCJCT-ND" H 4100 4050 60  0001 C CNN "Vendor Part #"
F 8 "1/4W" V 4150 4150 50  0000 L CNN "Power"
F 9 "1%" V 4250 4150 50  0000 L CNN "Tolerance"
	1    4100 4050
	0    1    1    0   
$EndComp
$EndSCHEMATC