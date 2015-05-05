EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:conn
LIBS:MAVRIClib
LIBS:74xx
LIBS:atmel
LIBS:audio
LIBS:transistors
LIBS:Passives
LIBS:STMicroelectronics
LIBS:Connectors
LIBS:Sensors
LIBS:Main Board-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 4
Title ""
Date "7 mar 2015"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L AOZ1280CI U3
U 1 1 54E8D0E5
P 2050 2500
F 0 "U3" H 1850 2150 60  0000 C CNN
F 1 "AOZ1280CI" H 1850 2650 60  0000 C CNN
F 2 "Housings_SOT-23_SOT-143_TSOT-6:SOT-23-6" H 2050 2500 60  0001 C CNN
F 3 "" H 2050 2500 60  0000 C CNN
	1    2050 2500
	1    0    0    -1  
$EndComp
$Comp
L Capacitor C15
U 1 1 54E8D1F4
P 3350 3750
F 0 "C15" V 3200 3850 60  0000 L CNN
F 1 "10uF" V 3300 3850 60  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 3250 3750 60  0001 C CNN
F 3 "" H 3350 3850 60  0001 C CNN
F 4 "Value" H 3350 3750 60  0001 C CNN "Manufacturer"
F 5 "Value" H 3350 3750 60  0001 C CNN "Manufacturer Part #"
F 6 "Value" H 3350 3750 60  0001 C CNN "Vendor"
F 7 "Value" H 3350 3750 60  0001 C CNN "Vendor Part #"
F 8 "25V" V 3400 3850 50  0000 L CNN "Voltage"
F 9 "Y5V" V 3500 3850 50  0000 L CNN "Dielectric"
	1    3350 3750
	0    -1   -1   0   
$EndComp
$Comp
L Capacitor C14
U 1 1 54E8D274
P 1850 2100
F 0 "C14" V 1700 2200 60  0000 L CNN
F 1 "10nF" V 1800 2200 60  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 1750 2100 60  0001 C CNN
F 3 "" H 1850 2200 60  0001 C CNN
F 4 "Value" H 1850 2100 60  0001 C CNN "Manufacturer"
F 5 "Value" H 1850 2100 60  0001 C CNN "Manufacturer Part #"
F 6 "Value" H 1850 2100 60  0001 C CNN "Vendor"
F 7 "Value" H 1850 2100 60  0001 C CNN "Vendor Part #"
F 8 "250V" V 1900 2200 50  0000 L CNN "Voltage"
F 9 "X7R" V 2000 2200 50  0000 L CNN "Dielectric"
	1    1850 2100
	1    0    0    -1  
$EndComp
$Comp
L INDUCTOR L1
U 1 1 54E8D2BE
P 2750 2500
F 0 "L1" V 2900 2500 40  0000 C CNN
F 1 "2.2uH" V 2850 2500 40  0000 C CNN
F 2 "MAVRIC:Yuden_SMD_Power_Inductor_6060" V 3100 1900 60  0000 C CNN
F 3 "~" H 2750 2500 60  0000 C CNN
F 4 "3.7A" V 2700 2500 60  0000 C CNN "Current"
F 5 "26mO" V 2600 2500 60  0000 C CNN "DCR"
	1    2750 2500
	0    -1   -1   0   
$EndComp
$Comp
L DIODESCH D1
U 1 1 54E8D3E6
P 2350 3800
F 0 "D1" H 2350 3900 40  0000 C CNN
F 1 "DIODESCH" H 2350 3700 40  0001 C CNN
F 2 "MAVRIC:Diode_MicroSMP" H 2350 3800 60  0000 C CNN
F 3 "~" H 2350 3800 60  0000 C CNN
F 4 "30V" H 2350 3700 60  0000 C CNN "Reverse Voltage"
F 5 "2A" H 2350 3600 60  0000 C CNN "Average Current"
	1    2350 3800
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR019
U 1 1 54E8D112
P 1300 2600
F 0 "#PWR019" H 1300 2600 30  0001 C CNN
F 1 "GND" H 1300 2530 30  0001 C CNN
F 2 "" H 1300 2600 60  0000 C CNN
F 3 "" H 1300 2600 60  0000 C CNN
	1    1300 2600
	0    1    1    0   
$EndComp
Text HLabel 3650 2500 2    60   Output ~ 0
Reg+3v3
$Comp
L GND #PWR020
U 1 1 54E8E890
P 2350 4300
F 0 "#PWR020" H 2350 4300 30  0001 C CNN
F 1 "GND" H 2350 4230 30  0001 C CNN
F 2 "" H 2350 4300 60  0000 C CNN
F 3 "" H 2350 4300 60  0000 C CNN
	1    2350 4300
	1    0    0    -1  
$EndComp
$Comp
L Resistor R1
U 1 1 54E8F01A
P 1800 3400
F 0 "R1" V 1650 3500 60  0000 L CNN
F 1 "49.9k" V 1750 3500 60  0000 L CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" H 1700 3400 60  0001 C CNN
F 3 "" H 1800 3500 60  0001 C CNN
F 4 "Digikey" H 1800 3400 60  0001 C CNN "Manufacturer"
F 5 "Value" H 1800 3400 60  0001 C CNN "Manufacturer Part #"
F 6 "Value" H 1800 3400 60  0001 C CNN "Vendor"
F 7 "Value" H 1800 3400 60  0001 C CNN "Vendor Part #"
F 8 "1/10W" V 1850 3500 50  0000 L CNN "Power"
F 9 "5%" V 1950 3500 50  0000 L CNN "Tolerance"
	1    1800 3400
	1    0    0    -1  
$EndComp
$Comp
L Resistor R2
U 1 1 54E8F067
P 1800 4150
F 0 "R2" V 1650 4250 60  0000 L CNN
F 1 "15.8k" V 1750 4250 60  0000 L CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" H 1700 4150 60  0001 C CNN
F 3 "" H 1800 4250 60  0001 C CNN
F 4 "Value" H 1800 4150 60  0001 C TNN "Manufacturer"
F 5 "Value" H 1800 4150 60  0001 C CNN "Manufacturer Part #"
F 6 "Value" H 1800 4150 60  0001 C CNN "Vendor"
F 7 "Value" H 1800 4150 60  0001 C CNN "Vendor Part #"
F 8 "1/10W" V 1850 4250 50  0000 L CNN "Power"
F 9 "5%" V 1950 4250 50  0000 L CNN "Tolerance"
	1    1800 4150
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR021
U 1 1 54E8F299
P 3150 2600
F 0 "#PWR021" H 3150 2550 20  0001 C CNN
F 1 "+12V" H 3150 2700 30  0000 C CNN
F 2 "" H 3150 2600 60  0000 C CNN
F 3 "" H 3150 2600 60  0000 C CNN
	1    3150 2600
	0    1    1    0   
$EndComp
$Comp
L Resistor R4
U 1 1 5544B97D
P 2750 2800
F 0 "R4" V 2600 2900 60  0000 L CNN
F 1 "49.9k" V 2700 2900 60  0000 L CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" H 2650 2800 60  0001 C CNN
F 3 "" H 2750 2900 60  0001 C CNN
F 4 "Digikey" H 2750 2800 60  0001 C CNN "Manufacturer"
F 5 "Value" H 2750 2800 60  0001 C CNN "Manufacturer Part #"
F 6 "Value" H 2750 2800 60  0001 C CNN "Vendor"
F 7 "Value" H 2750 2800 60  0001 C CNN "Vendor Part #"
F 8 "1/10W" V 2800 2900 50  0000 L CNN "Power"
F 9 "5%" V 2900 2900 50  0000 L CNN "Tolerance"
	1    2750 2800
	-1   0    0    1   
$EndComp
$Comp
L AP65552SP-13 U4
U 1 1 55453607
P 8600 3400
F 0 "U4" H 8550 2950 60  0000 C CNN
F 1 "AP65552SP-13" H 8400 3600 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-8-1EP_3.9x4.9mm_Pitch1.27mm" H 8600 3400 60  0001 C CNN
F 3 "" H 8600 3400 60  0000 C CNN
	1    8600 3400
	1    0    0    -1  
$EndComp
$Comp
L Resistor R14
U 1 1 554544A1
P 8400 2700
F 0 "R14" V 8250 2800 60  0000 L CNN
F 1 "100k" V 8350 2800 60  0000 L CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" H 8300 2700 60  0001 C CNN
F 3 "" H 8400 2800 60  0001 C CNN
F 4 "Value" H 8400 2700 60  0001 C CNN "Manufacturer"
F 5 "Value" H 8400 2700 60  0001 C CNN "Manufacturer Part #"
F 6 "Value" H 8400 2700 60  0001 C CNN "Vendor"
F 7 "Value" H 8400 2700 60  0001 C CNN "Vendor Part #"
F 8 "1/4W" V 8450 2800 50  0000 L CNN "Power"
F 9 "5%" V 8550 2800 50  0000 L CNN "Tolerance"
	1    8400 2700
	1    0    0    -1  
$EndComp
$Comp
L Capacitor C23
U 1 1 554546A7
P 10050 3050
F 0 "C23" V 9900 3150 60  0000 L CNN
F 1 "10uF" V 10000 3150 60  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 9950 3050 60  0001 C CNN
F 3 "" H 10050 3150 60  0001 C CNN
F 4 "Value" H 10050 3050 60  0001 C CNN "Manufacturer"
F 5 "Value" H 10050 3050 60  0001 C CNN "Manufacturer Part #"
F 6 "Value" H 10050 3050 60  0001 C CNN "Vendor"
F 7 "Value" H 10050 3050 60  0001 C CNN "Vendor Part #"
F 8 "25V" V 10100 3150 50  0000 L CNN "Voltage"
F 9 "Y5V" V 10200 3150 50  0000 L CNN "Dielectric"
	1    10050 3050
	0    1    1    0   
$EndComp
$Comp
L +12V #PWR022
U 1 1 554546D5
P 10500 2650
F 0 "#PWR022" H 10500 2500 60  0001 C CNN
F 1 "+12V" H 10500 2790 60  0000 C CNN
F 2 "" H 10500 2650 60  0000 C CNN
F 3 "" H 10500 2650 60  0000 C CNN
	1    10500 2650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR023
U 1 1 554548E3
P 10550 3450
F 0 "#PWR023" H 10550 3200 60  0001 C CNN
F 1 "GND" H 10550 3300 60  0000 C CNN
F 2 "" H 10550 3450 60  0000 C CNN
F 3 "" H 10550 3450 60  0000 C CNN
	1    10550 3450
	1    0    0    -1  
$EndComp
$Comp
L Capacitor C22
U 1 1 554549B0
P 9750 3850
F 0 "C22" V 9600 3950 60  0000 L CNN
F 1 ".1uF" V 9700 3950 60  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 9650 3850 60  0001 C CNN
F 3 "" H 9750 3950 60  0001 C CNN
F 4 "Value" H 9750 3850 60  0001 C CNN "Manufacturer"
F 5 "Value" H 9750 3850 60  0001 C CNN "Manufacturer Part #"
F 6 "Value" H 9750 3850 60  0001 C CNN "Vendor"
F 7 "Value" H 9750 3850 60  0001 C CNN "Vendor Part #"
F 8 "50V" V 9800 3950 50  0000 L CNN "Voltage"
F 9 "Y5V" V 9900 3950 50  0000 L CNN "Dielectric"
	1    9750 3850
	0    1    1    0   
$EndComp
$Comp
L Inductor L2
U 1 1 55454AD2
P 10400 4500
F 0 "L2" V 10250 4600 60  0000 L CNN
F 1 "3.3uH" V 10350 4600 60  0000 L CNN
F 2 "Inductors_NEOSID:Neosid_Inductor_SM-PIC0612H" H 10300 4500 60  0001 C CNN
F 3 "" H 10400 4600 60  0001 C CNN
F 4 "Value" H 10400 4500 60  0001 C CNN "Manufacturer"
F 5 "Value" H 10400 4500 60  0001 C CNN "Manufacturer Part #"
F 6 "Value" H 10400 4500 60  0001 C CNN "Vendor"
F 7 "Value" H 10400 4500 60  0001 C CNN "Vendor Part #"
F 8 "6.5A" V 10450 4600 50  0000 L CNN "Current"
F 9 "28mO" V 10550 4600 50  0000 L CNN "DCR"
	1    10400 4500
	0    1    1    0   
$EndComp
$Comp
L GND #PWR024
U 1 1 55454DDE
P 9100 4450
F 0 "#PWR024" H 9100 4200 60  0001 C CNN
F 1 "GND" H 9100 4300 60  0000 C CNN
F 2 "" H 9100 4450 60  0000 C CNN
F 3 "" H 9100 4450 60  0000 C CNN
	1    9100 4450
	1    0    0    -1  
$EndComp
$Comp
L Capacitor C18
U 1 1 5545504C
P 7600 4050
F 0 "C18" V 7450 4150 60  0000 L CNN
F 1 "8.2nF" V 7550 4150 60  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 7500 4050 60  0001 C CNN
F 3 "" H 7600 4150 60  0001 C CNN
F 4 "Value" H 7600 4050 60  0001 C CNN "Manufacturer"
F 5 "Value" H 7600 4050 60  0001 C CNN "Manufacturer Part #"
F 6 "Value" H 7600 4050 60  0001 C CNN "Vendor"
F 7 "Value" H 7600 4050 60  0001 C CNN "Vendor Part #"
F 8 "50V" V 7650 4150 50  0000 L CNN "Voltage"
F 9 "X7R" V 7750 4150 50  0000 L CNN "Dielectric"
	1    7600 4050
	0    1    1    0   
$EndComp
$Comp
L Capacitor C17
U 1 1 5545517D
P 6950 4050
F 0 "C17" V 6800 4150 60  0000 L CNN
F 1 "1uF" V 6900 4150 60  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 6850 4050 60  0001 C CNN
F 3 "" H 6950 4150 60  0001 C CNN
F 4 "Value" H 6950 4050 60  0001 C CNN "Manufacturer"
F 5 "Value" H 6950 4050 60  0001 C CNN "Manufacturer Part #"
F 6 "Value" H 6950 4050 60  0001 C CNN "Vendor"
F 7 "Value" H 6950 4050 60  0001 C CNN "Vendor Part #"
F 8 "25V" V 7000 4150 50  0000 L CNN "Voltage"
F 9 "X7R" V 7100 4150 50  0000 L CNN "Dielectric"
	1    6950 4050
	0    1    1    0   
$EndComp
$Comp
L Resistor R13
U 1 1 55455469
P 6350 3900
F 0 "R13" V 6200 4000 60  0000 L CNN
F 1 "22.1k" V 6300 4000 60  0000 L CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" H 6250 3900 60  0001 C CNN
F 3 "" H 6350 4000 60  0001 C CNN
F 4 "Value" H 6350 3900 60  0001 C CNN "Manufacturer"
F 5 "Value" H 6350 3900 60  0001 C CNN "Manufacturer Part #"
F 6 "Value" H 6350 3900 60  0001 C CNN "Vendor"
F 7 "Value" H 6350 3900 60  0001 C CNN "Vendor Part #"
F 8 "1/4W" V 6400 4000 50  0000 L CNN "Power"
F 9 "1%" V 6500 4000 50  0000 L CNN "Tolerance"
	1    6350 3900
	0    1    1    0   
$EndComp
Text HLabel 7350 2700 0    60   Input ~ 0
REG2EN
$Comp
L Resistor R12
U 1 1 55456E23
P 6000 3150
F 0 "R12" V 5850 3250 60  0000 L CNN
F 1 "124k" V 5950 3250 60  0000 L CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" H 5900 3150 60  0001 C CNN
F 3 "" H 6000 3250 60  0001 C CNN
F 4 "Value" H 6000 3150 60  0001 C CNN "Manufacturer"
F 5 "Value" H 6000 3150 60  0001 C CNN "Manufacturer Part #"
F 6 "Value" H 6000 3150 60  0001 C CNN "Vendor"
F 7 "Value" H 6000 3150 60  0001 C CNN "Vendor Part #"
F 8 "1/4W" V 6050 3250 50  0000 L CNN "Power"
F 9 "1%" V 6150 3250 50  0000 L CNN "Tolerance"
	1    6000 3150
	1    0    0    -1  
$EndComp
$Comp
L Capacitor C16
U 1 1 55456EFC
P 6000 3500
F 0 "C16" V 5850 3600 60  0000 L CNN
F 1 "18pF" V 5950 3600 60  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 5900 3500 60  0001 C CNN
F 3 "" H 6000 3600 60  0001 C CNN
F 4 "Value" H 6000 3500 60  0001 C CNN "Manufacturer"
F 5 "Value" H 6000 3500 60  0001 C CNN "Manufacturer Part #"
F 6 "Value" H 6000 3500 60  0001 C CNN "Vendor"
F 7 "Value" H 6000 3500 60  0001 C CNN "Vendor Part #"
F 8 "50V" V 6050 3600 50  0000 L CNN "Voltage"
F 9 "NP0" V 6150 3600 50  0000 L CNN "Dielectric"
	1    6000 3500
	-1   0    0    1   
$EndComp
Text HLabel 5550 4750 0    60   Output ~ 0
Reg+5V
$Comp
L Capacitor C21
U 1 1 55458B18
P 9500 5250
F 0 "C21" V 9350 5350 60  0000 L CNN
F 1 "22uF" V 9450 5350 60  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 9400 5250 60  0001 C CNN
F 3 "" H 9500 5350 60  0001 C CNN
F 4 "Value" H 9500 5250 60  0001 C CNN "Manufacturer"
F 5 "Value" H 9500 5250 60  0001 C CNN "Manufacturer Part #"
F 6 "Value" H 9500 5250 60  0001 C CNN "Vendor"
F 7 "Value" H 9500 5250 60  0001 C CNN "Vendor Part #"
F 8 "16V" V 9550 5350 50  0000 L CNN "Voltage"
F 9 "X5R" V 9650 5350 50  0000 L CNN "Dielectric"
	1    9500 5250
	0    1    1    0   
$EndComp
$Comp
L GND #PWR025
U 1 1 55458DAC
P 9500 5650
F 0 "#PWR025" H 9500 5400 60  0001 C CNN
F 1 "GND" H 9500 5500 60  0000 C CNN
F 2 "" H 9500 5650 60  0000 C CNN
F 3 "" H 9500 5650 60  0000 C CNN
	1    9500 5650
	1    0    0    -1  
$EndComp
$Comp
L Capacitor C20
U 1 1 5545A10B
P 9250 3050
F 0 "C20" V 9100 3150 60  0000 L CNN
F 1 "10uF" V 9200 3150 60  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 9150 3050 60  0001 C CNN
F 3 "" H 9250 3150 60  0001 C CNN
F 4 "Value" H 9250 3050 60  0001 C CNN "Manufacturer"
F 5 "Value" H 9250 3050 60  0001 C CNN "Manufacturer Part #"
F 6 "Value" H 9250 3050 60  0001 C CNN "Vendor"
F 7 "Value" H 9250 3050 60  0001 C CNN "Vendor Part #"
F 8 "25V" V 9300 3150 50  0000 L CNN "Voltage"
F 9 "Y5V" V 9400 3150 50  0000 L CNN "Dielectric"
	1    9250 3050
	0    1    1    0   
$EndComp
$Comp
L Capacitor C19
U 1 1 5545A6F6
P 8700 5250
F 0 "C19" V 8550 5350 60  0000 L CNN
F 1 "22uF" V 8650 5350 60  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 8600 5250 60  0001 C CNN
F 3 "" H 8700 5350 60  0001 C CNN
F 4 "Value" H 8700 5250 60  0001 C CNN "Manufacturer"
F 5 "Value" H 8700 5250 60  0001 C CNN "Manufacturer Part #"
F 6 "Value" H 8700 5250 60  0001 C CNN "Vendor"
F 7 "Value" H 8700 5250 60  0001 C CNN "Vendor Part #"
F 8 "16V" V 8750 5350 50  0000 L CNN "Voltage"
F 9 "X5R" V 8850 5350 50  0000 L CNN "Dielectric"
	1    8700 5250
	0    1    1    0   
$EndComp
$Comp
L Capacitor C?
U 1 1 5548FC27
P 3750 3100
F 0 "C?" V 3600 3200 60  0000 L CNN
F 1 "4.7uF" V 3700 3200 60  0000 L CNN
F 2 "" H 3650 3100 60  0001 C CNN
F 3 "" H 3750 3200 60  0001 C CNN
F 4 "Value" H 3750 3100 60  0001 C CNN "Manufacturer"
F 5 "Value" H 3750 3100 60  0001 C CNN "Manufacturer Part #"
F 6 "Value" H 3750 3100 60  0001 C CNN "Vendor"
F 7 "Value" H 3750 3100 60  0001 C CNN "Vendor Part #"
F 8 "35V" V 3800 3200 50  0000 L CNN "Voltage"
F 9 "Y5V" V 3900 3200 50  0000 L CNN "Dielectric"
	1    3750 3100
	0    1    1    0   
$EndComp
$Comp
L GND #PWR?
U 1 1 5548FCC9
P 3750 3400
F 0 "#PWR?" H 3750 3150 60  0001 C CNN
F 1 "GND" H 3750 3250 60  0000 C CNN
F 2 "" H 3750 3400 60  0000 C CNN
F 3 "" H 3750 3400 60  0000 C CNN
	1    3750 3400
	1    0    0    -1  
$EndComp
Connection ~ 3350 3400
Wire Wire Line
	2050 3400 3350 3400
Connection ~ 3350 2500
Wire Wire Line
	3350 2500 3350 3500
Wire Wire Line
	3050 2500 3650 2500
Connection ~ 2350 2500
Wire Wire Line
	2350 2100 2350 3600
Wire Wire Line
	2100 2100 2350 2100
Wire Wire Line
	2200 2500 2450 2500
Wire Wire Line
	1400 2100 1600 2100
Wire Wire Line
	1400 2500 1400 2100
Wire Wire Line
	1500 2500 1400 2500
Wire Wire Line
	2050 4150 3350 4150
Connection ~ 1550 3700
Wire Wire Line
	1550 3400 1550 4150
Wire Wire Line
	1300 3700 1550 3700
Wire Wire Line
	1300 2700 1300 3700
Wire Wire Line
	1500 2700 1300 2700
Wire Wire Line
	1500 2600 1300 2600
Wire Wire Line
	2350 4000 2350 4300
Connection ~ 2350 4150
Wire Wire Line
	2200 2600 3150 2600
Wire Wire Line
	3350 4150 3350 4000
Wire Wire Line
	2250 2700 2200 2700
Wire Wire Line
	2250 2700 2250 2800
Wire Wire Line
	2250 2800 2500 2800
Wire Wire Line
	3000 2800 3750 2800
Wire Wire Line
	3100 2800 3100 2600
Connection ~ 3100 2600
Wire Wire Line
	8950 3400 8750 3400
Wire Wire Line
	8950 2700 8950 3400
Wire Wire Line
	8650 2700 10500 2700
Wire Wire Line
	10500 2700 10500 2650
Connection ~ 8950 2700
Wire Wire Line
	9250 2800 9250 2700
Connection ~ 9250 2700
Wire Wire Line
	10050 2800 10050 2700
Connection ~ 10050 2700
Wire Wire Line
	9250 3300 9250 3350
Wire Wire Line
	9250 3350 10550 3350
Wire Wire Line
	10050 3350 10050 3300
Wire Wire Line
	10550 3350 10550 3450
Connection ~ 10050 3350
Wire Wire Line
	8750 3500 9750 3500
Wire Wire Line
	9750 3500 9750 3600
Wire Wire Line
	8750 3600 9400 3600
Wire Wire Line
	9400 3600 9400 4250
Wire Wire Line
	9400 4250 10400 4250
Wire Wire Line
	9750 4100 9750 4250
Connection ~ 9750 4250
Wire Wire Line
	9100 3700 9100 4450
Wire Wire Line
	6350 4350 9100 4350
Wire Wire Line
	8350 4350 8350 3950
Connection ~ 9100 4350
Wire Wire Line
	9100 3700 8750 3700
Wire Wire Line
	7600 3800 7600 3700
Wire Wire Line
	7600 3700 8000 3700
Wire Wire Line
	8000 3600 6950 3600
Wire Wire Line
	6950 3600 6950 3800
Wire Wire Line
	7600 4350 7600 4300
Connection ~ 8350 4350
Wire Wire Line
	6950 4350 6950 4300
Connection ~ 7600 4350
Wire Wire Line
	6350 4350 6350 4150
Connection ~ 6950 4350
Wire Wire Line
	6350 3150 6350 3650
Wire Wire Line
	6250 3500 8000 3500
Wire Wire Line
	8000 3400 7950 3400
Wire Wire Line
	7950 3400 7950 2700
Wire Wire Line
	7350 2700 8150 2700
Connection ~ 7950 2700
Connection ~ 6350 3500
Wire Wire Line
	6250 3150 6350 3150
Wire Wire Line
	5750 3500 5650 3500
Wire Wire Line
	5650 3150 5750 3150
Wire Wire Line
	5550 4750 10400 4750
Connection ~ 5650 3500
Connection ~ 5650 4750
Wire Wire Line
	5650 3150 5650 4750
Wire Wire Line
	8700 5550 9500 5550
Wire Wire Line
	9500 5500 9500 5650
Wire Wire Line
	8700 5550 8700 5500
Connection ~ 9500 5550
Wire Wire Line
	9500 5000 9500 4750
Connection ~ 9500 4750
Wire Wire Line
	8700 5000 8700 4750
Connection ~ 8700 4750
Wire Wire Line
	3750 2800 3750 2850
Connection ~ 3100 2800
Wire Wire Line
	3750 3350 3750 3400
$EndSCHEMATC
