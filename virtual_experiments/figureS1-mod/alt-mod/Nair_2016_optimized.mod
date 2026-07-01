TITLE Nair_2016_optimized

COMMENT
	automatically generated from separate SBtab TSV files
	date: Wed Jul  1 14:39:50 2026
ENDCOMMENT

NEURON {
	SUFFIX Nair_2016_optimized
	RANGE ATP_expression : assigned
	RANGE Ca_expression : assigned
	RANGE DA_expression : assigned
	RANGE AMP : assigned
	RANGE ATP : assigned
	RANGE Ca : assigned
	RANGE DA : assigned
	RANGE AC5 : compound
	RANGE AC5_ATP : compound
	RANGE AC5_Ca : compound
	RANGE AC5_Ca_ATP : compound
	RANGE AC5_Ca_GaolfGTP : compound
	RANGE AC5_Ca_GaolfGTP_ATP : compound
	RANGE AC5_GaolfGTP : compound
	RANGE AC5_GaolfGTP_ATP : compound
	RANGE B56PP2A : compound
	RANGE B56PP2A_D32p75 : compound
	RANGE B56PP2A_pARPP21 : compound
	RANGE B56PP2Ap : compound
	RANGE B56PP2Ap_D32p75 : compound
	RANGE B56PP2Ap_pARPP21 : compound
	RANGE B72PP2A : compound
	RANGE B72PP2A_D32p34 : compound
	RANGE B72PP2A_D32p75 : compound
	RANGE B72PP2A_pARPP21 : compound
	RANGE B72PP2A_Ca_D32p34 : compound
	RANGE B72PP2A_Ca_D32p75 : compound
	RANGE B72PP2A_Ca : compound
	RANGE B72PP2A_Ca_pARPP21 : compound
	RANGE CaM : compound
	RANGE CaM_Ca2 : compound
	RANGE CaM_Ca4 : compound
	RANGE CaM_Ca4_pARPP21 : compound
	RANGE CaMKII : compound
	RANGE CaMKII_CaM_Ca4 : compound
	RANGE CaMKII_CaM : compound
	RANGE CaMKII_CaM_Ca2 : compound
	RANGE CaMKII_CaM_Ca2_psd : compound
	RANGE CaMKII_CaM_psd : compound
	RANGE CaMKII_CaM_Ca4_psd : compound
	RANGE CaMKII_psd : compound
	RANGE cAMP : compound
	RANGE Substrate : compound
	RANGE CDK5 : compound
	RANGE CDK5_D32 : compound
	RANGE D1R : compound
	RANGE D1R_DA : compound
	RANGE D1R_Golf_DA : compound
	RANGE D1R_Golf : compound
	RANGE D32p34 : compound
	RANGE D32p75 : compound
	RANGE D32 : compound
	RANGE GaolfGDP : compound
	RANGE GaolfGTP : compound
	RANGE Gbgolf : compound
	RANGE Golf : compound
	RANGE pCaMKII : compound
	RANGE pCaMKII_CaM_Ca4 : compound
	RANGE pCaMKII_CaM : compound
	RANGE pCaMKII_CaM_Ca2 : compound
	RANGE pCaMKII_CaM_Ca2_psd : compound
	RANGE pCaMKII_CaM_psd : compound
	RANGE pCaMKII_CaM_Ca4_psd : compound
	RANGE pCaMKII_psd : compound
	RANGE pSubstrate : compound
	RANGE PDE4 : compound
	RANGE PDE4_cAMP : compound
	RANGE PDE10r : compound
	RANGE PDE10r_cAMP : compound
	RANGE PDE10c : compound
	RANGE PDE10c_cAMP : compound
	RANGE PKA : compound
	RANGE PKAc : compound
	RANGE PKAc_B56PP2A : compound
	RANGE PKAc_D32 : compound
	RANGE PKAc_ARPP21 : compound
	RANGE PKA_Ca2MP : compound
	RANGE PKA_Ca4MP : compound
	RANGE PKAc_D32p75 : compound
	RANGE PKAreg : compound
	RANGE PP1 : compound
	RANGE PP1_pCaMKII_psd : compound
	RANGE PP1_pSubstrate : compound
	RANGE PP1_D32p34 : compound
	RANGE C_1 : original name: CaMKII_CaM_Ca4_psd_CaMKII_CaM_Ca4_psd : compound
	RANGE C_2 : original name: pCaMKII_CaM_Ca4_psd_CaMKII_CaM_Ca4_psd : compound
	RANGE C_3 : original name: CaMKII_CaM_Ca4_CaMKII_CaM_Ca4 : compound
	RANGE C_4 : original name: pCaMKII_CaM_Ca4_CaMKII_CaM_Ca4 : compound
	RANGE PP2B : compound
	RANGE PP2Bc : compound
	RANGE PP2Bc_D32p34 : compound
	RANGE PP2B_CaM : compound
	RANGE PP2B_CaM_Ca2 : compound
	RANGE pARPP21 : compound
	RANGE ARPP21 : compound
	RANGE pCaMKII_psd_Substrate : compound
	RANGE pCaMKII_CaM_psd_Substrate : compound
	RANGE C_5 : original name: pCaMKII_CaM_Ca2_psd_Substrate : compound
	RANGE C_6 : original name: pCaMKII_CaM_Ca4_psd_Substrate : compound
	RANGE CaMKII_CaM_psd_Substrate : compound
	RANGE CaMKII_CaM_Ca2_psd_Substrate : compound
	RANGE CaMKII_CaM_Ca4_psd_Substrate : compound
	USEION pSubstrate  WRITE pSubstratei VALENCE 0
	USEION PKAc  WRITE PKAci VALENCE 0
	USEION cal READ cali VALENCE 2
	USEION DA READ DAi VALENCE 0
}

CONSTANT {
	tau_DA1 = 34.979 (ms) : a constant (tau_DA1)
	tau_DA2 = 420.0 (ms) : a constant (tau_DA2)
	DA_basal = 1.9999999999999998e-05 (millimole/liter) : a constant (DA_basal)
	Ca_basal = 5.9999999999999995e-05 (millimole/liter) : a constant (Ca_basal)
}

PARAMETER {
	kf_R0 = 0.03 (1/ms) : a kinetic parameter (kf_R0)
	kf_R1 = 0.015 (1/ms) : a kinetic parameter (kf_R1)
	kf_R2 = 50.0 (liter/millimole/ms) : a kinetic parameter (kf_R2)
	kr_R2 = 0.25 (1/ms) : a kinetic parameter (kr_R2)
	kf_R3 = 50.0 (liter/millimole/ms) : a kinetic parameter (kf_R3)
	kr_R3 = 0.25 (1/ms) : a kinetic parameter (kr_R3)
	kf_R4 = 10000.0 (liter/millimole/ms) : a kinetic parameter (kf_R4)
	kr_R4 = 0.001 (1/ms) : a kinetic parameter (kr_R4)
	kf_R5 = 6.0 (liter/millimole/ms) : a kinetic parameter (kf_R5)
	kr_R5 = 0.02 (1/ms) : a kinetic parameter (kr_R5)
	kf_R6 = 100.0 (liter/millimole/ms) : a kinetic parameter (kf_R6)
	kr_R6 = 3.0 (1/ms) : a kinetic parameter (kr_R6)
	kf_R7 = 100.0 (liter/millimole/ms) : a kinetic parameter (kf_R7)
	kr_R7 = 3e-06 (1/ms) : a kinetic parameter (kr_R7)
	kf_R8 = 10.0 (liter/millimole/ms) : a kinetic parameter (kf_R8)
	kr_R8 = 0.2 (1/ms) : a kinetic parameter (kr_R8)
	kf_R9 = 0.01 (1/ms) : a kinetic parameter (kf_R9)
	kf_R10 = 1.0 (liter/millimole/ms) : a kinetic parameter (kf_R10)
	kr_R10 = 0.0003 (1/ms) : a kinetic parameter (kr_R10)
	kf_R11 = 0.0002 (1/ms) : a kinetic parameter (kf_R11)
	kf_R12 = 1000.0 (liter/millimole/ms) : a kinetic parameter (kf_R12)
	kr_R12 = 0.0015 (1/ms) : a kinetic parameter (kr_R12)
	kf_R13 = 1.0 (liter/millimole/ms) : a kinetic parameter (kf_R13)
	kr_R13 = 0.1 (1/ms) : a kinetic parameter (kr_R13)
	kf_R14 = 0.01 (1/ms) : a kinetic parameter (kf_R14)
	kf_R15 = 100.0 (liter/millimole/ms) : a kinetic parameter (kf_R15)
	kr_R15 = 0.1 (1/ms) : a kinetic parameter (kr_R15)
	kf_R16 = 10.0 (liter/millimole/ms) : a kinetic parameter (kf_R16)
	kr_R16 = 0.01 (1/ms) : a kinetic parameter (kr_R16)
	kf_R17 = 15.0 (liter/millimole/ms) : a kinetic parameter (kf_R17)
	kr_R17 = 0.1 (1/ms) : a kinetic parameter (kr_R17)
	kf_R18 = 8.0 (liter/millimole/ms) : a kinetic parameter (kf_R18)
	kr_R18 = 0.1 (1/ms) : a kinetic parameter (kr_R18)
	kf_R19 = 15.0 (liter/millimole/ms) : a kinetic parameter (kf_R19)
	kr_R19 = 0.1 (1/ms) : a kinetic parameter (kr_R19)
	kf_R20 = 0.008 (1/ms) : a kinetic parameter (kf_R20)
	kf_R21 = 0.0015 (1/ms) : a kinetic parameter (kf_R21)
	kf_R22 = 0.008 (1/ms) : a kinetic parameter (kf_R22)
	kf_R23 = 1300.0 (liter/millimole/ms) : a kinetic parameter (kf_R23)
	kr_R23 = 0.0001 (1/ms) : a kinetic parameter (kr_R23)
	kf_R24 = 100.0 (liter/millimole/ms) : a kinetic parameter (kf_R24)
	kr_R24 = 1.0 (1/ms) : a kinetic parameter (kr_R24)
	kf_R25 = 6.0 (liter/millimole/ms) : a kinetic parameter (kf_R25)
	kr_R25 = 2e-07 (1/ms) : a kinetic parameter (kr_R25)
	kf_R26 = 100.0 (liter/millimole/ms) : a kinetic parameter (kf_R26)
	kr_R26 = 0.1 (1/ms) : a kinetic parameter (kr_R26)
	kf_R27 = 100.0 (liter/millimole/ms) : a kinetic parameter (kf_R27)
	kr_R27 = 3e-05 (1/ms) : a kinetic parameter (kr_R27)
	kf_R28 = 1.0 (liter/millimole/ms) : a kinetic parameter (kf_R28)
	kr_R28 = 0.01 (1/ms) : a kinetic parameter (kr_R28)
	kf_R29 = 10000.0 (liter/millimole/ms) : a kinetic parameter (kf_R29)
	kr_R29 = 0.001 (1/ms) : a kinetic parameter (kr_R29)
	kf_R30 = 8.0 (liter/millimole/ms) : a kinetic parameter (kf_R30)
	kr_R30 = 0.1 (1/ms) : a kinetic parameter (kr_R30)
	kf_R31 = 0.0015 (1/ms) : a kinetic parameter (kf_R31)
	kf_R32 = 0.003 (1/ms) : a kinetic parameter (kf_R32)
	kf_R33 = 0.003 (1/ms) : a kinetic parameter (kf_R33)
	kf_R34 = 0.5 (liter/millimole/ms) : a kinetic parameter (kf_R34)
	kr_R34 = 0.001 (1/ms) : a kinetic parameter (kr_R34)
	kf_R35 = 0.5 (liter/millimole/ms) : a kinetic parameter (kf_R35)
	kr_R35 = 0.001 (1/ms) : a kinetic parameter (kr_R35)
	kf_R36 = 0.0012 (1/ms) : a kinetic parameter (kf_R36)
	kf_R37 = 8e-06 (1/ms) : a kinetic parameter (kf_R37)
	kf_R38 = 26.0 (liter/millimole/ms) : a kinetic parameter (kf_R38)
	kr_R38 = 0.35 (1/ms) : a kinetic parameter (kr_R38)
	kf_R39 = 34.6 (liter/millimole/ms) : a kinetic parameter (kf_R39)
	kr_R39 = 0.05 (1/ms) : a kinetic parameter (kr_R39)
	kf_R40 = 0.05 (1/ms) : a kinetic parameter (kf_R40)
	kr_R40 = 30.0 (liter/millimole/ms) : a kinetic parameter (kr_R40)
	kf_R41 = 30.0 (liter/millimole/ms) : a kinetic parameter (kf_R41)
	kr_R41 = 0.001 (1/ms) : a kinetic parameter (kr_R41)
	kf_R42 = 0.0025 (1/ms) : a kinetic parameter (kf_R42)
	kf_R43 = 1000.0000000000001 (liter2/millimole2/ms) : a kinetic parameter (kf_R43)
	kr_R43 = 0.001 (1/ms) : a kinetic parameter (kr_R43)
	kf_R44 = 0.003 (1/ms) : a kinetic parameter (kf_R44)
	kf_R45 = 100.0 (liter/millimole/ms) : a kinetic parameter (kf_R45)
	kr_R45 = 0.002 (1/ms) : a kinetic parameter (kr_R45)
	kf_R46 = 0.01 (1/ms) : a kinetic parameter (kf_R46)
	kf_R47 = 100000.0 (liter/millimole/ms) : a kinetic parameter (kf_R47)
	kf_R48 = 2.5500000000000003 (liter/millimole/ms) : a kinetic parameter (kf_R48)
	kr_R48 = 0.001 (1/ms) : a kinetic parameter (kr_R48)
	kf_R49 = 0.09999999999999999 (liter/millimole/ms) : a kinetic parameter (kf_R49)
	kr_R49 = 0.001 (1/ms) : a kinetic parameter (kr_R49)
	kf_R50 = 0.075 (liter/millimole/ms) : a kinetic parameter (kf_R50)
	kr_R50 = 0.001 (1/ms) : a kinetic parameter (kr_R50)
	kf_R51 = 1.3 (liter/millimole/ms) : a kinetic parameter (kf_R51)
	kr_R51 = 0.001 (1/ms) : a kinetic parameter (kr_R51)
	kf_R52 = 10000.0 (liter/millimole/ms) : a kinetic parameter (kf_R52)
	kr_R52 = 0.001 (1/ms) : a kinetic parameter (kr_R52)
	kf_R53 = 10000.0 (liter/millimole/ms) : a kinetic parameter (kf_R53)
	kr_R53 = 0.001 (1/ms) : a kinetic parameter (kr_R53)
	kf_R54 = 1.0 (liter/millimole/ms) : a kinetic parameter (kf_R54)
	kr_R54 = 0.01 (1/ms) : a kinetic parameter (kr_R54)
	kf_R55 = 0.05 (1/ms) : a kinetic parameter (kf_R55)
	kf_R56 = 2550.0 (liter/millimole/ms) : a kinetic parameter (kf_R56)
	kf_R57 = 0.001 (1/ms) : a kinetic parameter (kf_R57)
	kf_R58 = 2.0 (liter/millimole/ms) : a kinetic parameter (kf_R58)
	kf_R59 = 0.0005 (1/ms) : a kinetic parameter (kf_R59)
	kf_R60 = 0.75 (liter/millimole/ms) : a kinetic parameter (kf_R60)
	kf_R61 = 0.025 (1/ms) : a kinetic parameter (kf_R61)
	kf_R62 = 650.0 (liter/millimole/ms) : a kinetic parameter (kf_R62)
	kf_R63 = 0.001 (1/ms) : a kinetic parameter (kf_R63)
	kf_R64 = 0.001 (1/ms) : a kinetic parameter (kf_R64)
	kf_R65 = 0.001 (1/ms) : a kinetic parameter (kf_R65)
	kf_R66 = 0.001 (1/ms) : a kinetic parameter (kf_R66)
	kf_R67 = 60.0 (liter/millimole/ms) : a kinetic parameter (kf_R67)
	kr_R67 = 0.25 (1/ms) : a kinetic parameter (kr_R67)
	kf_R68 = 60.0 (liter/millimole/ms) : a kinetic parameter (kf_R68)
	kr_R68 = 0.25 (1/ms) : a kinetic parameter (kr_R68)
	kf_R69 = 100.0 (liter/millimole/ms) : a kinetic parameter (kf_R69)
	kr_R69 = 0.002 (1/ms) : a kinetic parameter (kr_R69)
	kf_R70 = 100.0 (liter/millimole/ms) : a kinetic parameter (kf_R70)
	kr_R70 = 0.04 (1/ms) : a kinetic parameter (kr_R70)
	kf_R71 = 100.0 (liter/millimole/ms) : a kinetic parameter (kf_R71)
	kr_R71 = 0.4 (1/ms) : a kinetic parameter (kr_R71)
	kf_R72 = 100.0 (liter/millimole/ms) : a kinetic parameter (kf_R72)
	kr_R72 = 4.0 (1/ms) : a kinetic parameter (kr_R72)
	kf_R73 = 100.0 (liter/millimole/ms) : a kinetic parameter (kf_R73)
	kr_R73 = 0.1 (1/ms) : a kinetic parameter (kr_R73)
	kf_R74 = 6.0 (liter/millimole/ms) : a kinetic parameter (kf_R74)
	kr_R74 = 0.002 (1/ms) : a kinetic parameter (kr_R74)
	kf_R75 = 100.0 (liter/millimole/ms) : a kinetic parameter (kf_R75)
	kr_R75 = 0.01 (1/ms) : a kinetic parameter (kr_R75)
	kf_R76 = 6.0 (liter/millimole/ms) : a kinetic parameter (kf_R76)
	kr_R76 = 0.002 (1/ms) : a kinetic parameter (kr_R76)
	kf_R77 = 100.0 (liter/millimole/ms) : a kinetic parameter (kf_R77)
	kr_R77 = 0.0004 (1/ms) : a kinetic parameter (kr_R77)
	kf_R78 = 100.0 (liter/millimole/ms) : a kinetic parameter (kf_R78)
	kr_R78 = 0.04 (1/ms) : a kinetic parameter (kr_R78)
	kf_R79 = 100.0 (liter/millimole/ms) : a kinetic parameter (kf_R79)
	kr_R79 = 0.4 (1/ms) : a kinetic parameter (kr_R79)
	kf_R80 = 45.0 (liter/millimole/ms) : a kinetic parameter (kf_R80)
	kr_R80 = 0.2 (1/ms) : a kinetic parameter (kr_R80)
	kf_R81 = 0.01 (1/ms) : a kinetic parameter (kf_R81)
	kf_R82 = 500.0 (liter/millimole/ms) : a kinetic parameter (kf_R82)
	kr_R82 = 0.01 (1/ms) : a kinetic parameter (kr_R82)
	kf_R83 = 0.01 (1/ms) : a kinetic parameter (kf_R83)
	kf_R84 = 7.0 (liter/millimole/ms) : a kinetic parameter (kf_R84)
	kr_R84 = 0.1 (1/ms) : a kinetic parameter (kr_R84)
	kf_R85 = 0.001 (1/ms) : a kinetic parameter (kf_R85)
	kf_R86 = 4.0 (liter/millimole/ms) : a kinetic parameter (kf_R86)
	kr_R86 = 0.1 (1/ms) : a kinetic parameter (kr_R86)
	kf_R87 = 0.01 (1/ms) : a kinetic parameter (kf_R87)
	kf_R88 = 7.0 (liter/millimole/ms) : a kinetic parameter (kf_R88)
	kr_R88 = 0.1 (1/ms) : a kinetic parameter (kr_R88)
	kf_R89 = 0.001 (1/ms) : a kinetic parameter (kf_R89)
	kf_R90 = 4.0 (liter/millimole/ms) : a kinetic parameter (kf_R90)
	kr_R90 = 0.1 (1/ms) : a kinetic parameter (kr_R90)
	kf_R91 = 0.5 (liter/millimole/ms) : a kinetic parameter (kf_R91)
	kr_R91 = 0.001 (1/ms) : a kinetic parameter (kr_R91)
	kf_R92 = 0.01 (1/ms) : a kinetic parameter (kf_R92)
	kf_R93 = 0.5 (liter/millimole/ms) : a kinetic parameter (kf_R93)
	kr_R93 = 0.01 (1/ms) : a kinetic parameter (kr_R93)
	kf_R94 = 0.01 (1/ms) : a kinetic parameter (kf_R94)
	kf_R95 = 0.0001 (1/ms) : a kinetic parameter (kf_R95)
	kf_R96 = 0.5 (liter/millimole/ms) : a kinetic parameter (kf_R96)
	kr_R96 = 0.01 (1/ms) : a kinetic parameter (kr_R96)
	kf_R97 = 0.01 (1/ms) : a kinetic parameter (kf_R97)
	kf_R98 = 0.5 (liter/millimole/ms) : a kinetic parameter (kf_R98)
	kr_R98 = 0.01 (1/ms) : a kinetic parameter (kr_R98)
	kf_R99 = 0.01 (1/ms) : a kinetic parameter (kf_R99)
	kf_R100 = 0.5 (liter/millimole/ms) : a kinetic parameter (kf_R100)
	kr_R100 = 0.01 (1/ms) : a kinetic parameter (kr_R100)
	kf_R101 = 0.01 (1/ms) : a kinetic parameter (kf_R101)
	kf_R102 = 0.5 (liter/millimole/ms) : a kinetic parameter (kf_R102)
	kr_R102 = 0.01 (1/ms) : a kinetic parameter (kr_R102)
	kf_R103 = 0.01 (1/ms) : a kinetic parameter (kf_R103)
	kf_R104 = 0.5 (liter/millimole/ms) : a kinetic parameter (kf_R104)
	kr_R104 = 0.01 (1/ms) : a kinetic parameter (kr_R104)
	kf_R105 = 0.01 (1/ms) : a kinetic parameter (kf_R105)
	kf_R106 = 0.5 (liter/millimole/ms) : a kinetic parameter (kf_R106)
	kr_R106 = 0.01 (1/ms) : a kinetic parameter (kr_R106)
	kf_R107 = 0.01 (1/ms) : a kinetic parameter (kf_R107)
	kf_R108 = 0.0005 (1/ms) : a kinetic parameter (kf_R108)
	kr_R108 = 1e-06 (1/ms) : a kinetic parameter (kr_R108)
	kf_R109 = 0.0005 (1/ms) : a kinetic parameter (kf_R109)
	kr_R109 = 1e-06 (1/ms) : a kinetic parameter (kr_R109)
	kf_R110 = 0.0005 (1/ms) : a kinetic parameter (kf_R110)
	kr_R110 = 1e-06 (1/ms) : a kinetic parameter (kr_R110)
	kf_R111 = 0.0005 (1/ms) : a kinetic parameter (kf_R111)
	kr_R111 = 1e-06 (1/ms) : a kinetic parameter (kr_R111)
	kf_R112 = 100.0 (liter/millimole/ms) : a kinetic parameter (kf_R112)
	kr_R112 = 0.0004 (1/ms) : a kinetic parameter (kr_R112)
	kf_R113 = 100.0 (liter/millimole/ms) : a kinetic parameter (kf_R113)
	kr_R113 = 0.04 (1/ms) : a kinetic parameter (kr_R113)
	kf_R114 = 100.0 (liter/millimole/ms) : a kinetic parameter (kf_R114)
	kr_R114 = 0.4 (1/ms) : a kinetic parameter (kr_R114)
	kf_R115 = 6.0 (liter/millimole/ms) : a kinetic parameter (kf_R115)
	kr_R115 = 0.002 (1/ms) : a kinetic parameter (kr_R115)
	kf_R116 = 100.0 (liter/millimole/ms) : a kinetic parameter (kf_R116)
	kr_R116 = 0.01 (1/ms) : a kinetic parameter (kr_R116)
	kf_R117 = 0.7999999999999999 (liter/millimole/ms) : a kinetic parameter (kf_R117)
	kr_R117 = 0.001 (1/ms) : a kinetic parameter (kr_R117)
	kf_R118 = 0.001 (1/ms) : a kinetic parameter (kf_R118)
	kf_R119 = 0.0005 (1/ms) : a kinetic parameter (kf_R119)
	kf_R120 = 100.0 (liter/millimole/ms) : a kinetic parameter (kf_R120)
	kr_R120 = 0.04 (1/ms) : a kinetic parameter (kr_R120)
	kf_R121 = 100.0 (liter/millimole/ms) : a kinetic parameter (kf_R121)
	kr_R121 = 0.4 (1/ms) : a kinetic parameter (kr_R121)
	kf_R122 = 100.0 (liter/millimole/ms) : a kinetic parameter (kf_R122)
	kr_R122 = 4.0 (1/ms) : a kinetic parameter (kr_R122)
	kf_R123 = 100.0 (liter/millimole/ms) : a kinetic parameter (kf_R123)
	kr_R123 = 0.1 (1/ms) : a kinetic parameter (kr_R123)
	kf_R124 = 6.0 (liter/millimole/ms) : a kinetic parameter (kf_R124)
	kr_R124 = 0.002 (1/ms) : a kinetic parameter (kr_R124)
	kf_R125 = 0.0005 (1/ms) : a kinetic parameter (kf_R125)
	kr_R125 = 0.0005 (1/ms) : a kinetic parameter (kr_R125)
	kf_R126 = 0.0005 (1/ms) : a kinetic parameter (kf_R126)
	kr_R126 = 0.0005 (1/ms) : a kinetic parameter (kr_R126)
	kf_R127 = 0.0005 (1/ms) : a kinetic parameter (kf_R127)
	kr_R127 = 0.0005 (1/ms) : a kinetic parameter (kr_R127)
	kf_R128 = 0.0005 (1/ms) : a kinetic parameter (kf_R128)
	kr_R128 = 0.0005 (1/ms) : a kinetic parameter (kr_R128)
	kf_R129 = 1e-06 (1/ms) : a kinetic parameter (kf_R129)
	kr_R129 = 0.0005 (1/ms) : a kinetic parameter (kr_R129)
	kf_R130 = 0.36 (liter/millimole/ms) : a kinetic parameter (kf_R130)
	kr_R130 = 0.023 (1/ms) : a kinetic parameter (kr_R130)
	kf_R131 = 0.0039 (1/ms) : a kinetic parameter (kf_R131)
	kf_R132 = 1.1 (liter/millimole/ms) : a kinetic parameter (kf_R132)
	kr_R132 = 0.0054 (1/ms) : a kinetic parameter (kr_R132)
	kf_R133 = 10.0 (1/ms) : a kinetic parameter (kf_R133)
	kf_R134 = 0.36 (liter/millimole/ms) : a kinetic parameter (kf_R134)
	kr_R134 = 0.023 (1/ms) : a kinetic parameter (kr_R134)
	kf_R135 = 0.0039 (1/ms) : a kinetic parameter (kf_R135)
	kf_R136 = 1.1 (liter/millimole/ms) : a kinetic parameter (kf_R136)
	kr_R136 = 0.0054 (1/ms) : a kinetic parameter (kr_R136)
	kf_R137 = 10.0 (1/ms) : a kinetic parameter (kf_R137)
	PP2B_cc = 0.004 : total amount for subset (PP2B_cc)
	PP1_cc = 0.003 : total amount for subset (PP1_cc)
	PKAc_cc = 0.0 : total amount for subset (PKAc_cc)
	PKA_cc = 0.0012 : total amount for subset (PKA_cc)
	PDE10r_cc = 0.0007 : total amount for subset (PDE10r_cc)
	PDE4_cc = 0.002 : total amount for subset (PDE4_cc)
	Golf_cc = 0.002 : total amount for subset (Golf_cc)
	D1R_cc = 0.0 : total amount for subset (D1R_cc)
	CDK5_cc = 0.0018 : total amount for subset (CDK5_cc)
	Substrate_cc = 0.003 : total amount for subset (Substrate_cc)
	CaMKII_cc = 0.02 : total amount for subset (CaMKII_cc)
	CaM_cc = 0.009 : total amount for subset (CaM_cc)
	B72PP2A_cc = 0.002 : total amount for subset (B72PP2A_cc)
	ARPP21_cc = 0.02 : total amount for subset (ARPP21_cc)
	D32_cc = 0.049999999999999996 : total amount for subset (D32_cc)
	B56PP2A_cc = -0.06799999999999999 : total amount for subset (B56PP2A_cc)
	AC5_Ca_GaolfGTP_cc = 0.0 : total amount for subset (AC5_Ca_GaolfGTP_cc)
	AC5_cc = 0.0007 : total amount for subset (AC5_cc)
}

ASSIGNED {
	time (ms) : alias for t
	ATP_expression : pre-defined algebraic expression (ATP_expression)
	Ca_expression : pre-defined algebraic expression (Ca_expression)
	DA_expression : pre-defined algebraic expression (DA_expression)
	AMP : pre-defined algebraic expression (AMP)
	ATP : pre-defined algebraic expression (ATP)
	R0 : reaction flux (R0)
	R1 : reaction flux (R1)
	R2 : reaction flux (R2)
	R3 : reaction flux (R3)
	R4 : reaction flux (R4)
	R5 : reaction flux (R5)
	R6 : reaction flux (R6)
	R7 : reaction flux (R7)
	R8 : reaction flux (R8)
	R9 : reaction flux (R9)
	R10 : reaction flux (R10)
	R11 : reaction flux (R11)
	R12 : reaction flux (R12)
	R13 : reaction flux (R13)
	R14 : reaction flux (R14)
	R15 : reaction flux (R15)
	R16 : reaction flux (R16)
	R17 : reaction flux (R17)
	R18 : reaction flux (R18)
	R19 : reaction flux (R19)
	R20 : reaction flux (R20)
	R21 : reaction flux (R21)
	R22 : reaction flux (R22)
	R23 : reaction flux (R23)
	R24 : reaction flux (R24)
	R25 : reaction flux (R25)
	R26 : reaction flux (R26)
	R27 : reaction flux (R27)
	R28 : reaction flux (R28)
	R29 : reaction flux (R29)
	R30 : reaction flux (R30)
	R31 : reaction flux (R31)
	R32 : reaction flux (R32)
	R33 : reaction flux (R33)
	R34 : reaction flux (R34)
	R35 : reaction flux (R35)
	R36 : reaction flux (R36)
	R37 : reaction flux (R37)
	R38 : reaction flux (R38)
	R39 : reaction flux (R39)
	R40 : reaction flux (R40)
	R41 : reaction flux (R41)
	R42 : reaction flux (R42)
	R43 : reaction flux (R43)
	R44 : reaction flux (R44)
	R45 : reaction flux (R45)
	R46 : reaction flux (R46)
	R47 : reaction flux (R47)
	R48 : reaction flux (R48)
	R49 : reaction flux (R49)
	R50 : reaction flux (R50)
	R51 : reaction flux (R51)
	R52 : reaction flux (R52)
	R53 : reaction flux (R53)
	R54 : reaction flux (R54)
	R55 : reaction flux (R55)
	R56 : reaction flux (R56)
	R57 : reaction flux (R57)
	R58 : reaction flux (R58)
	R59 : reaction flux (R59)
	R60 : reaction flux (R60)
	R61 : reaction flux (R61)
	R62 : reaction flux (R62)
	R63 : reaction flux (R63)
	R64 : reaction flux (R64)
	R65 : reaction flux (R65)
	R66 : reaction flux (R66)
	R67 : reaction flux (R67)
	R68 : reaction flux (R68)
	R69 : reaction flux (R69)
	R70 : reaction flux (R70)
	R71 : reaction flux (R71)
	R72 : reaction flux (R72)
	R73 : reaction flux (R73)
	R74 : reaction flux (R74)
	R75 : reaction flux (R75)
	R76 : reaction flux (R76)
	R77 : reaction flux (R77)
	R78 : reaction flux (R78)
	R79 : reaction flux (R79)
	R80 : reaction flux (R80)
	R81 : reaction flux (R81)
	R82 : reaction flux (R82)
	R83 : reaction flux (R83)
	R84 : reaction flux (R84)
	R85 : reaction flux (R85)
	R86 : reaction flux (R86)
	R87 : reaction flux (R87)
	R88 : reaction flux (R88)
	R89 : reaction flux (R89)
	R90 : reaction flux (R90)
	R91 : reaction flux (R91)
	R92 : reaction flux (R92)
	R93 : reaction flux (R93)
	R94 : reaction flux (R94)
	R95 : reaction flux (R95)
	R96 : reaction flux (R96)
	R97 : reaction flux (R97)
	R98 : reaction flux (R98)
	R99 : reaction flux (R99)
	R100 : reaction flux (R100)
	R101 : reaction flux (R101)
	R102 : reaction flux (R102)
	R103 : reaction flux (R103)
	R104 : reaction flux (R104)
	R105 : reaction flux (R105)
	R106 : reaction flux (R106)
	R107 : reaction flux (R107)
	R108 : reaction flux (R108)
	R109 : reaction flux (R109)
	R110 : reaction flux (R110)
	R111 : reaction flux (R111)
	R112 : reaction flux (R112)
	R113 : reaction flux (R113)
	R114 : reaction flux (R114)
	R115 : reaction flux (R115)
	R116 : reaction flux (R116)
	R117 : reaction flux (R117)
	R118 : reaction flux (R118)
	R119 : reaction flux (R119)
	R120 : reaction flux (R120)
	R121 : reaction flux (R121)
	R122 : reaction flux (R122)
	R123 : reaction flux (R123)
	R124 : reaction flux (R124)
	R125 : reaction flux (R125)
	R126 : reaction flux (R126)
	R127 : reaction flux (R127)
	R128 : reaction flux (R128)
	R129 : reaction flux (R129)
	R130 : reaction flux (R130)
	R131 : reaction flux (R131)
	R132 : reaction flux (R132)
	R133 : reaction flux (R133)
	R134 : reaction flux (R134)
	R135 : reaction flux (R135)
	R136 : reaction flux (R136)
	R137 : reaction flux (R137)
	PP2B : computed from conservation law (PP2B)
	PP1 : computed from conservation law (PP1)
	PKAc : computed from conservation law (PKAc)
	PKA : computed from conservation law (PKA)
	PDE10r : computed from conservation law (PDE10r)
	PDE4 : computed from conservation law (PDE4)
	Golf : computed from conservation law (Golf)
	D1R : computed from conservation law (D1R)
	CDK5 : computed from conservation law (CDK5)
	Substrate : computed from conservation law (Substrate)
	CaMKII : computed from conservation law (CaMKII)
	CaM : computed from conservation law (CaM)
	B72PP2A : computed from conservation law (B72PP2A)
	ARPP21 : computed from conservation law (ARPP21)
	D32 : computed from conservation law (D32)
	B56PP2A : computed from conservation law (B56PP2A)
	AC5_Ca_GaolfGTP : computed from conservation law (AC5_Ca_GaolfGTP)
	AC5 : computed from conservation law (AC5)
	Ca : variable assigned externally via pointer mapping (Ca)
	DA : variable assigned externally via pointer mapping (DA)
	cali (millimole/liter)
	DAi (millimole/liter)
	PKAci (mol/L) : ion variable registered for internal scope linkage
	pSubstratei (mol/L) : ion variable registered for internal scope linkage
	DA_max : catch-all baseline fallback tracking structural bounds (DA_max)
	DA_start : catch-all baseline fallback tracking structural bounds (DA_start)
}

STATE {
	: AC5 is calculated via Conservation Law
	AC5_ATP (millimole/liter) : state variable (AC5_ATP)
	AC5_Ca (millimole/liter) : state variable (AC5_Ca)
	AC5_Ca_ATP (millimole/liter) : state variable (AC5_Ca_ATP)
	: AC5_Ca_GaolfGTP is calculated via Conservation Law
	AC5_Ca_GaolfGTP_ATP (millimole/liter) : state variable (AC5_Ca_GaolfGTP_ATP)
	AC5_GaolfGTP (millimole/liter) : state variable (AC5_GaolfGTP)
	AC5_GaolfGTP_ATP (millimole/liter) : state variable (AC5_GaolfGTP_ATP)
	: B56PP2A is calculated via Conservation Law
	B56PP2A_D32p75 (millimole/liter) : state variable (B56PP2A_D32p75)
	B56PP2A_pARPP21 (millimole/liter) : state variable (B56PP2A_pARPP21)
	B56PP2Ap (millimole/liter) : state variable (B56PP2Ap)
	B56PP2Ap_D32p75 (millimole/liter) : state variable (B56PP2Ap_D32p75)
	B56PP2Ap_pARPP21 (millimole/liter) : state variable (B56PP2Ap_pARPP21)
	: B72PP2A is calculated via Conservation Law
	B72PP2A_D32p34 (millimole/liter) : state variable (B72PP2A_D32p34)
	B72PP2A_D32p75 (millimole/liter) : state variable (B72PP2A_D32p75)
	B72PP2A_pARPP21 (millimole/liter) : state variable (B72PP2A_pARPP21)
	B72PP2A_Ca_D32p34 (millimole/liter) : state variable (B72PP2A_Ca_D32p34)
	B72PP2A_Ca_D32p75 (millimole/liter) : state variable (B72PP2A_Ca_D32p75)
	B72PP2A_Ca (millimole/liter) : state variable (B72PP2A_Ca)
	B72PP2A_Ca_pARPP21 (millimole/liter) : state variable (B72PP2A_Ca_pARPP21)
	: CaM is calculated via Conservation Law
	CaM_Ca2 (millimole/liter) : state variable (CaM_Ca2)
	CaM_Ca4 (millimole/liter) : state variable (CaM_Ca4)
	CaM_Ca4_pARPP21 (millimole/liter) : state variable (CaM_Ca4_pARPP21)
	: CaMKII is calculated via Conservation Law
	CaMKII_CaM_Ca4 (millimole/liter) : state variable (CaMKII_CaM_Ca4)
	CaMKII_CaM (millimole/liter) : state variable (CaMKII_CaM)
	CaMKII_CaM_Ca2 (millimole/liter) : state variable (CaMKII_CaM_Ca2)
	CaMKII_CaM_Ca2_psd (millimole/liter) : state variable (CaMKII_CaM_Ca2_psd)
	CaMKII_CaM_psd (millimole/liter) : state variable (CaMKII_CaM_psd)
	CaMKII_CaM_Ca4_psd (millimole/liter) : state variable (CaMKII_CaM_Ca4_psd)
	CaMKII_psd (millimole/liter) : state variable (CaMKII_psd)
	cAMP (millimole/liter) : state variable (cAMP)
	: Substrate is calculated via Conservation Law
	: CDK5 is calculated via Conservation Law
	CDK5_D32 (millimole/liter) : state variable (CDK5_D32)
	: D1R is calculated via Conservation Law
	D1R_DA (millimole/liter) : state variable (D1R_DA)
	D1R_Golf_DA (millimole/liter) : state variable (D1R_Golf_DA)
	D1R_Golf (millimole/liter) : state variable (D1R_Golf)
	D32p34 (millimole/liter) : state variable (D32p34)
	D32p75 (millimole/liter) : state variable (D32p75)
	: D32 is calculated via Conservation Law
	GaolfGDP (millimole/liter) : state variable (GaolfGDP)
	GaolfGTP (millimole/liter) : state variable (GaolfGTP)
	Gbgolf (millimole/liter) : state variable (Gbgolf)
	: Golf is calculated via Conservation Law
	pCaMKII (millimole/liter) : state variable (pCaMKII)
	pCaMKII_CaM_Ca4 (millimole/liter) : state variable (pCaMKII_CaM_Ca4)
	pCaMKII_CaM (millimole/liter) : state variable (pCaMKII_CaM)
	pCaMKII_CaM_Ca2 (millimole/liter) : state variable (pCaMKII_CaM_Ca2)
	pCaMKII_CaM_Ca2_psd (millimole/liter) : state variable (pCaMKII_CaM_Ca2_psd)
	pCaMKII_CaM_psd (millimole/liter) : state variable (pCaMKII_CaM_psd)
	pCaMKII_CaM_Ca4_psd (millimole/liter) : state variable (pCaMKII_CaM_Ca4_psd)
	pCaMKII_psd (millimole/liter) : state variable (pCaMKII_psd)
	pSubstrate (millimole/liter) : state variable (pSubstrate)
	: PDE4 is calculated via Conservation Law
	PDE4_cAMP (millimole/liter) : state variable (PDE4_cAMP)
	: PDE10r is calculated via Conservation Law
	PDE10r_cAMP (millimole/liter) : state variable (PDE10r_cAMP)
	PDE10c (millimole/liter) : state variable (PDE10c)
	PDE10c_cAMP (millimole/liter) : state variable (PDE10c_cAMP)
	: PKA is calculated via Conservation Law
	: PKAc is calculated via Conservation Law
	PKAc_B56PP2A (millimole/liter) : state variable (PKAc_B56PP2A)
	PKAc_D32 (millimole/liter) : state variable (PKAc_D32)
	PKAc_ARPP21 (millimole/liter) : state variable (PKAc_ARPP21)
	PKA_Ca2MP (millimole/liter) : state variable (PKA_Ca2MP)
	PKA_Ca4MP (millimole/liter) : state variable (PKA_Ca4MP)
	PKAc_D32p75 (millimole/liter) : state variable (PKAc_D32p75)
	PKAreg (millimole/liter) : state variable (PKAreg)
	: PP1 is calculated via Conservation Law
	PP1_pCaMKII_psd (millimole/liter) : state variable (PP1_pCaMKII_psd)
	PP1_pSubstrate (millimole/liter) : state variable (PP1_pSubstrate)
	PP1_D32p34 (millimole/liter) : state variable (PP1_D32p34)
	C_1 (millimole/liter) : state variable (CaMKII_CaM_Ca4_psd_CaMKII_CaM_Ca4_psd)
	C_2 (millimole/liter) : state variable (pCaMKII_CaM_Ca4_psd_CaMKII_CaM_Ca4_psd)
	C_3 (millimole/liter) : state variable (CaMKII_CaM_Ca4_CaMKII_CaM_Ca4)
	C_4 (millimole/liter) : state variable (pCaMKII_CaM_Ca4_CaMKII_CaM_Ca4)
	: PP2B is calculated via Conservation Law
	PP2Bc (millimole/liter) : state variable (PP2Bc)
	PP2Bc_D32p34 (millimole/liter) : state variable (PP2Bc_D32p34)
	PP2B_CaM (millimole/liter) : state variable (PP2B_CaM)
	PP2B_CaM_Ca2 (millimole/liter) : state variable (PP2B_CaM_Ca2)
	pARPP21 (millimole/liter) : state variable (pARPP21)
	: ARPP21 is calculated via Conservation Law
	pCaMKII_psd_Substrate (millimole/liter) : state variable (pCaMKII_psd_Substrate)
	pCaMKII_CaM_psd_Substrate (millimole/liter) : state variable (pCaMKII_CaM_psd_Substrate)
	C_5 (millimole/liter) : state variable (pCaMKII_CaM_Ca2_psd_Substrate)
	C_6 (millimole/liter) : state variable (pCaMKII_CaM_Ca4_psd_Substrate)
	CaMKII_CaM_psd_Substrate (millimole/liter) : state variable (CaMKII_CaM_psd_Substrate)
	CaMKII_CaM_Ca2_psd_Substrate (millimole/liter) : state variable (CaMKII_CaM_Ca2_psd_Substrate)
	CaMKII_CaM_Ca4_psd_Substrate (millimole/liter) : state variable (CaMKII_CaM_Ca4_psd_Substrate)
}

INITIAL {
	: AC5 cannot have initial values as it is determined by conservation law
	 AC5_ATP = 0.0 : initial condition
	 AC5_Ca = 0.0 : initial condition
	 AC5_Ca_ATP = 0.0 : initial condition
	: AC5_Ca_GaolfGTP cannot have initial values as it is determined by conservation law
	 AC5_Ca_GaolfGTP_ATP = 0.0 : initial condition
	 AC5_GaolfGTP = 0.0 : initial condition
	 AC5_GaolfGTP_ATP = 0.0 : initial condition
	: B56PP2A cannot have initial values as it is determined by conservation law
	 B56PP2A_D32p75 = 0.0 : initial condition
	 B56PP2A_pARPP21 = 0.0 : initial condition
	 B56PP2Ap = 0.0 : initial condition
	 B56PP2Ap_D32p75 = 0.0 : initial condition
	 B56PP2Ap_pARPP21 = 0.0 : initial condition
	: B72PP2A cannot have initial values as it is determined by conservation law
	 B72PP2A_D32p34 = 0.0 : initial condition
	 B72PP2A_D32p75 = 0.0 : initial condition
	 B72PP2A_pARPP21 = 0.0 : initial condition
	 B72PP2A_Ca_D32p34 = 0.0 : initial condition
	 B72PP2A_Ca_D32p75 = 0.0 : initial condition
	 B72PP2A_Ca = 0.0 : initial condition
	 B72PP2A_Ca_pARPP21 = 0.0 : initial condition
	: CaM cannot have initial values as it is determined by conservation law
	 CaM_Ca2 = 0.0 : initial condition
	 CaM_Ca4 = 0.0 : initial condition
	 CaM_Ca4_pARPP21 = 0.0 : initial condition
	: CaMKII cannot have initial values as it is determined by conservation law
	 CaMKII_CaM_Ca4 = 0.0 : initial condition
	 CaMKII_CaM = 0.0 : initial condition
	 CaMKII_CaM_Ca2 = 0.0 : initial condition
	 CaMKII_CaM_Ca2_psd = 0.0 : initial condition
	 CaMKII_CaM_psd = 0.0 : initial condition
	 CaMKII_CaM_Ca4_psd = 0.0 : initial condition
	 CaMKII_psd = 0.0 : initial condition
	 cAMP = 0.0 : initial condition
	: Substrate cannot have initial values as it is determined by conservation law
	: CDK5 cannot have initial values as it is determined by conservation law
	 CDK5_D32 = 0.0 : initial condition
	: D1R cannot have initial values as it is determined by conservation law
	 D1R_DA = 0.0 : initial condition
	 D1R_Golf_DA = 0.0 : initial condition
	 D1R_Golf = 0.0 : initial condition
	 D32p34 = 0.0 : initial condition
	 D32p75 = 0.0 : initial condition
	: D32 cannot have initial values as it is determined by conservation law
	 GaolfGDP = 0.0 : initial condition
	 GaolfGTP = 0.0 : initial condition
	 Gbgolf = 0.0 : initial condition
	: Golf cannot have initial values as it is determined by conservation law
	 pCaMKII = 0.0 : initial condition
	 pCaMKII_CaM_Ca4 = 0.0 : initial condition
	 pCaMKII_CaM = 0.0 : initial condition
	 pCaMKII_CaM_Ca2 = 0.0 : initial condition
	 pCaMKII_CaM_Ca2_psd = 0.0 : initial condition
	 pCaMKII_CaM_psd = 0.0 : initial condition
	 pCaMKII_CaM_Ca4_psd = 0.0 : initial condition
	 pCaMKII_psd = 0.0 : initial condition
	 pSubstrate = 0.0 : initial condition
	: PDE4 cannot have initial values as it is determined by conservation law
	 PDE4_cAMP = 0.0 : initial condition
	: PDE10r cannot have initial values as it is determined by conservation law
	 PDE10r_cAMP = 0.0 : initial condition
	 PDE10c = 0.0 : initial condition
	 PDE10c_cAMP = 0.0 : initial condition
	: PKA cannot have initial values as it is determined by conservation law
	: PKAc cannot have initial values as it is determined by conservation law
	 PKAc_B56PP2A = 0.0 : initial condition
	 PKAc_D32 = 0.0 : initial condition
	 PKAc_ARPP21 = 0.0 : initial condition
	 PKA_Ca2MP = 0.0 : initial condition
	 PKA_Ca4MP = 0.0 : initial condition
	 PKAc_D32p75 = 0.0 : initial condition
	 PKAreg = 0.0 : initial condition
	: PP1 cannot have initial values as it is determined by conservation law
	 PP1_pCaMKII_psd = 0.0 : initial condition
	 PP1_pSubstrate = 0.0 : initial condition
	 PP1_D32p34 = 0.0 : initial condition
	 C_1 = 0.0 : initial condition
	 C_2 = 0.0 : initial condition
	 C_3 = 0.0 : initial condition
	 C_4 = 0.0 : initial condition
	: PP2B cannot have initial values as it is determined by conservation law
	 PP2Bc = 0.0 : initial condition
	 PP2Bc_D32p34 = 0.0 : initial condition
	 PP2B_CaM = 0.0 : initial condition
	 PP2B_CaM_Ca2 = 0.0 : initial condition
	 pARPP21 = 0.0 : initial condition
	: ARPP21 cannot have initial values as it is determined by conservation law
	 pCaMKII_psd_Substrate = 0.0 : initial condition
	 pCaMKII_CaM_psd_Substrate = 0.0 : initial condition
	 C_5 = 0.0 : initial condition
	 C_6 = 0.0 : initial condition
	 CaMKII_CaM_psd_Substrate = 0.0 : initial condition
	 CaMKII_CaM_Ca2_psd_Substrate = 0.0 : initial condition
	 CaMKII_CaM_Ca4_psd_Substrate = 0.0 : initial condition
}

BREAKPOINT {
	SOLVE ode METHOD cnexp
	assign_calculated_values() : procedure
}

DERIVATIVE ode {
	: Compound AC5 with initial condition 700 had derivative -R4-R28-R49+R57-R58+R63, but uses conservation law.
	AC5_ATP' = R49-R52-R54-R57+R58+R65 : affects compound (AC5_ATP)
	AC5_Ca' = R28-R29-R50+R59-R60+R64 : affects compound (AC5_Ca)
	AC5_Ca_ATP' = R50-R53+R54-R59+R60+R66 : affects compound (AC5_Ca_ATP)
	: Compound AC5_Ca_GaolfGTP with initial condition 0 had derivative R29-R51+R61-R62-R64, but uses conservation law.
	AC5_Ca_GaolfGTP_ATP' = R51+R53-R61+R62-R66 : affects compound (AC5_Ca_GaolfGTP_ATP)
	AC5_GaolfGTP' = R4-R48+R55-R56-R63 : affects compound (AC5_GaolfGTP)
	AC5_GaolfGTP_ATP' = R48+R52-R55+R56-R65 : affects compound (AC5_GaolfGTP_ATP)
	: Compound B56PP2A with initial condition 2000 had derivative -R10-R30+R31+R37+R89-R90, but uses conservation law.
	B56PP2A_D32p75' = R30-R31 : affects compound (B56PP2A_D32p75)
	B56PP2A_pARPP21' = -R89+R90 : affects compound (B56PP2A_pARPP21)
	B56PP2Ap' = R11-R17+R20-R37+R87-R88 : affects compound (B56PP2Ap)
	B56PP2Ap_D32p75' = R17-R20 : affects compound (B56PP2Ap_D32p75)
	B56PP2Ap_pARPP21' = -R87+R88 : affects compound (B56PP2Ap_pARPP21)
	: Compound B72PP2A with initial condition 2000 had derivative -R16-R18+R21+R33-R35+R85-R86, but uses conservation law.
	B72PP2A_D32p34' = -R33+R35 : affects compound (B72PP2A_D32p34)
	B72PP2A_D32p75' = R18-R21 : affects compound (B72PP2A_D32p75)
	B72PP2A_pARPP21' = -R85+R86 : affects compound (B72PP2A_pARPP21)
	B72PP2A_Ca_D32p34' = -R32+R34 : affects compound (B72PP2A_Ca_D32p34)
	B72PP2A_Ca_D32p75' = R19-R22 : affects compound (B72PP2A_Ca_D32p75)
	B72PP2A_Ca' = R16-R19+R22+R32-R34+R83-R84 : affects compound (B72PP2A_Ca)
	B72PP2A_Ca_pARPP21' = -R83+R84 : affects compound (B72PP2A_Ca_pARPP21)
	: Compound CaM with initial condition 9000 had derivative -R5-R6-R72-R79-R114-R122, but uses conservation law.
	CaM_Ca2' = R5-R24-R27-R71-R78-R113-R121 : affects compound (CaM_Ca2)
	CaM_Ca4' = -R7+R24-R70-R77-R82-R112-R120 : affects compound (CaM_Ca4)
	CaM_Ca4_pARPP21' = R82 : affects compound (CaM_Ca4_pARPP21)
	: Compound CaMKII with initial condition 20000 had derivative -R70-R71-R72+R95+R119, but uses conservation law.
	CaMKII_CaM_Ca4' = R70+R73-R127-R130-R130+R131-R132 : affects compound (CaMKII_CaM_Ca4)
	CaMKII_CaM' = R72-R74-R125 : affects compound (CaMKII_CaM)
	CaMKII_CaM_Ca2' = R71-R73+R74-R126 : affects compound (CaMKII_CaM_Ca2)
	CaMKII_CaM_Ca2_psd' = -R104+R105+R121-R123+R124+R126 : affects compound (CaMKII_CaM_Ca2_psd)
	CaMKII_CaM_psd' = -R102+R103+R122-R124+R125 : affects compound (CaMKII_CaM_psd)
	CaMKII_CaM_Ca4_psd' = -R106+R107+R120+R123+R127-R134-R134+R135-R136 : affects compound (CaMKII_CaM_Ca4_psd)
	CaMKII_psd' = R118-R119-R120-R121-R122 : affects compound (CaMKII_psd)
	cAMP' = -R38-R39-R41-2*R43-R45+R55-R56+R57-R58+R59-R60+R61-R62-R69 : affects compound (cAMP)
	: Compound Substrate with initial condition 3000 had derivative R92-R93-R96-R98-R100-R102-R104-R106, but uses conservation law.
	: Compound CDK5 with initial condition 1800 had derivative -R13+R14, but uses conservation law.
	CDK5_D32' = R13-R14 : affects compound (CDK5_D32)
	: Compound D1R with initial condition 2000 had derivative -R3-R67, but uses conservation law.
	D1R_DA' = R1+R3-R68 : affects compound (D1R_DA)
	D1R_Golf_DA' = -R1+R2+R68 : affects compound (D1R_Golf_DA)
	D1R_Golf' = -R2+R67 : affects compound (D1R_Golf)
	D32p34' = R9-R12-R23-R34-R35 : affects compound (D32p34)
	D32p75' = R14-R15-R17-R18-R19-R30 : affects compound (D32p75)
	: Compound D32 with initial condition 50000 had derivative -R8-R13+R20+R21+R22+R31+R32+R33+R36, but uses conservation law.
	GaolfGDP' = R0-R47+R63+R64+R65+R66 : affects compound (GaolfGDP)
	GaolfGTP' = -R0+R1-R4-R29-R52-R53 : affects compound (GaolfGTP)
	Gbgolf' = R1-R47 : affects compound (Gbgolf)
	: Compound Golf with initial condition 2000 had derivative R47-R67-R68, but uses conservation law.
	pCaMKII' = -R77-R78-R79-R95-R111 : affects compound (pCaMKII)
	pCaMKII_CaM_Ca4' = R75+R77-R108+R131-R132+R133+R133 : affects compound (pCaMKII_CaM_Ca4)
	pCaMKII_CaM' = -R76+R79-R110 : affects compound (pCaMKII_CaM)
	pCaMKII_CaM_Ca2' = -R75+R76+R78-R109 : affects compound (pCaMKII_CaM_Ca2)
	pCaMKII_CaM_Ca2_psd' = -R98+R99+R109+R113+R115-R116 : affects compound (pCaMKII_CaM_Ca2_psd)
	pCaMKII_CaM_psd' = -R96+R97+R110+R114-R115 : affects compound (pCaMKII_CaM_psd)
	pCaMKII_CaM_Ca4_psd' = -R100+R101+R108+R112+R116+R135-R136+R137+R137 : affects compound (pCaMKII_CaM_Ca4_psd)
	pCaMKII_psd' = -R93+R94+R111-R112-R113-R114-R117 : affects compound (pCaMKII_psd)
	pSubstrate' = -R91+R94+R97+R99+R101+R103+R105+R107 : affects compound (pSubstrate)
	: Compound PDE4 with initial condition 2000 had derivative -R41+R42, but uses conservation law.
	PDE4_cAMP' = R41-R42 : affects compound (PDE4_cAMP)
	: Compound PDE10r with initial condition 700 had derivative -R43+R44-R45, but uses conservation law.
	PDE10r_cAMP' = -R44+R45 : affects compound (PDE10r_cAMP)
	PDE10c' = R43+R46-R69 : affects compound (PDE10c)
	PDE10c_cAMP' = -R46+R69 : affects compound (PDE10c_cAMP)
	: Compound PKA with initial condition 1200 had derivative -R38, but uses conservation law.
	: Compound PKAc with initial condition 0 had derivative -R8+R9-R10+R11-R15+R40-R80+R81, but uses conservation law.
	PKAc_B56PP2A' = R10-R11 : affects compound (PKAc_B56PP2A)
	PKAc_D32' = R8-R9 : affects compound (PKAc_D32)
	PKAc_ARPP21' = R80-R81 : affects compound (PKAc_ARPP21)
	PKA_Ca2MP' = R38-R39 : affects compound (PKA_Ca2MP)
	PKA_Ca4MP' = R39-R40 : affects compound (PKA_Ca4MP)
	PKAc_D32p75' = R15 : affects compound (PKAc_D32p75)
	PKAreg' = R40 : affects compound (PKAreg)
	: Compound PP1 with initial condition 3000 had derivative -R12-R91+R92-R117+R118, but uses conservation law.
	PP1_pCaMKII_psd' = R117-R118 : affects compound (PP1_pCaMKII_psd)
	PP1_pSubstrate' = R91-R92 : affects compound (PP1_pSubstrate)
	PP1_D32p34' = R12 : affects compound (PP1_D32p34)
	C_1' = -R128+R134-R135 : affects compound (CaMKII_CaM_Ca4_psd_CaMKII_CaM_Ca4_psd)
	C_2' = -R129+R136-R137 : affects compound (pCaMKII_CaM_Ca4_psd_CaMKII_CaM_Ca4_psd)
	C_3' = R128+R130-R131 : affects compound (CaMKII_CaM_Ca4_CaMKII_CaM_Ca4)
	C_4' = R129+R132-R133 : affects compound (pCaMKII_CaM_Ca4_CaMKII_CaM_Ca4)
	: Compound PP2B with initial condition 4000 had derivative -R6-R7-R27, but uses conservation law.
	PP2Bc' = R7-R23+R26+R36 : affects compound (PP2Bc)
	PP2Bc_D32p34' = R23-R36 : affects compound (PP2Bc_D32p34)
	PP2B_CaM' = R6-R25 : affects compound (PP2B_CaM)
	PP2B_CaM_Ca2' = R25-R26+R27 : affects compound (PP2B_CaM_Ca2)
	pARPP21' = R81-R82-R84-R86-R88-R90 : affects compound (pARPP21)
	: Compound ARPP21 with initial condition 20000 had derivative -R80+R83+R85+R87+R89, but uses conservation law.
	pCaMKII_psd_Substrate' = R93-R94 : affects compound (pCaMKII_psd_Substrate)
	pCaMKII_CaM_psd_Substrate' = R96-R97 : affects compound (pCaMKII_CaM_psd_Substrate)
	C_5' = R98-R99 : affects compound (pCaMKII_CaM_Ca2_psd_Substrate)
	C_6' = R100-R101 : affects compound (pCaMKII_CaM_Ca4_psd_Substrate)
	CaMKII_CaM_psd_Substrate' = R102-R103 : affects compound (CaMKII_CaM_psd_Substrate)
	CaMKII_CaM_Ca2_psd_Substrate' = R104-R105 : affects compound (CaMKII_CaM_Ca2_psd_Substrate)
	CaMKII_CaM_Ca4_psd_Substrate' = R106-R107 : affects compound (CaMKII_CaM_Ca4_psd_Substrate)
}

PROCEDURE assign_calculated_values() {
	time = t : an alias for the time variable, if needed.
	PP2B = PP2B_cc - (PP2Bc+PP2Bc_D32p34+PP2B_CaM+PP2B_CaM_Ca2) : conservation law for (PP2B)
	PP1 = PP1_cc - (PP1_pCaMKII_psd+PP1_pSubstrate+PP1_D32p34) : conservation law for (PP1)
	PKAc = PKAc_cc - (PKAc_B56PP2A+PKAc_D32+PKAc_ARPP21+PKAc_D32p75-PKAreg) : conservation law for (PKAc)
	PKA = PKA_cc - (PKA_Ca2MP+PKA_Ca4MP+PKAreg) : conservation law for (PKA)
	PDE10r = PDE10r_cc - (PDE10r_cAMP+PDE10c+PDE10c_cAMP) : conservation law for (PDE10r)
	PDE4 = PDE4_cc - (PDE4_cAMP) : conservation law for (PDE4)
	Golf = Golf_cc - (D1R_Golf_DA+D1R_Golf+Gbgolf) : conservation law for (Golf)
	D1R = D1R_cc - (D1R_DA-Gbgolf-Golf) : conservation law for (D1R)
	CDK5 = CDK5_cc - (CDK5_D32) : conservation law for (CDK5)
	Substrate = Substrate_cc - (pSubstrate+PP1_pSubstrate+pCaMKII_psd_Substrate+pCaMKII_CaM_psd_Substrate+C_5+C_6+CaMKII_CaM_psd_Substrate+CaMKII_CaM_Ca2_psd_Substrate+CaMKII_CaM_Ca4_psd_Substrate) : conservation law for (Substrate)
	CaMKII = CaMKII_cc - (CaMKII_CaM_Ca4+CaMKII_CaM+CaMKII_CaM_Ca2+CaMKII_CaM_Ca2_psd+CaMKII_CaM_psd+CaMKII_CaM_Ca4_psd+CaMKII_psd+
		pCaMKII+pCaMKII_CaM_Ca4+pCaMKII_CaM+pCaMKII_CaM_Ca2+pCaMKII_CaM_Ca2_psd+pCaMKII_CaM_psd+pCaMKII_CaM_Ca4_psd+
		pCaMKII_psd+PP1_pCaMKII_psd+2*C_1+2*C_2+2*C_3+2*C_4+pCaMKII_psd_Substrate+pCaMKII_CaM_psd_Substrate+C_5+
		C_6+CaMKII_CaM_psd_Substrate+CaMKII_CaM_Ca2_psd_Substrate+CaMKII_CaM_Ca4_psd_Substrate) : conservation law for (CaMKII)
	CaM = CaM_cc - (CaM_Ca2+CaM_Ca4+CaM_Ca4_pARPP21+CaMKII_CaM_Ca4+CaMKII_CaM+CaMKII_CaM_Ca2+CaMKII_CaM_Ca2_psd+CaMKII_CaM_psd+
		CaMKII_CaM_Ca4_psd+pCaMKII_CaM_Ca4+pCaMKII_CaM+pCaMKII_CaM_Ca2+pCaMKII_CaM_Ca2_psd+pCaMKII_CaM_psd+
		pCaMKII_CaM_Ca4_psd+2*C_1+2*C_2+2*C_3+2*C_4+PP2Bc+PP2Bc_D32p34+PP2B_CaM+PP2B_CaM_Ca2+pCaMKII_CaM_psd_Substrate+C_5+
		C_6+CaMKII_CaM_psd_Substrate+CaMKII_CaM_Ca2_psd_Substrate+CaMKII_CaM_Ca4_psd_Substrate) : conservation law for (CaM)
	B72PP2A = B72PP2A_cc - (B72PP2A_D32p34+B72PP2A_D32p75+B72PP2A_pARPP21+B72PP2A_Ca_D32p34+B72PP2A_Ca_D32p75+B72PP2A_Ca+B72PP2A_Ca_pARPP21) : conservation law for (B72PP2A)
	ARPP21 = ARPP21_cc - (B56PP2A_pARPP21+B56PP2Ap_pARPP21+B72PP2A_pARPP21+B72PP2A_Ca_pARPP21+CaM_Ca4_pARPP21+PKAc_ARPP21+
		pARPP21) : conservation law for (ARPP21)
	D32 = D32_cc - (B56PP2A_D32p75+B56PP2Ap_D32p75+B72PP2A_D32p34+B72PP2A_D32p75+B72PP2A_Ca_D32p34+B72PP2A_Ca_D32p75+
		CDK5_D32+D32p34+D32p75+PKAc_D32+PKAc_D32p75+PP1_D32p34+PP2Bc_D32p34) : conservation law for (D32)
	B56PP2A = B56PP2A_cc - (B56PP2Ap+PKAc_B56PP2A-B72PP2A_D32p34-B72PP2A_D32p75-B72PP2A_pARPP21-B72PP2A_Ca_D32p34-B72PP2A_Ca_D32p75-
		B72PP2A_Ca_pARPP21-CaM_Ca4_pARPP21-CDK5_D32-D32p34-D32p75-D32-PKAc_D32-PKAc_ARPP21-PKAc_D32p75-PP1_D32p34-
		PP2Bc_D32p34-pARPP21-ARPP21) : conservation law for (B56PP2A)
	AC5_Ca_GaolfGTP = AC5_Ca_GaolfGTP_cc - (AC5_Ca_GaolfGTP_ATP+AC5_GaolfGTP+AC5_GaolfGTP_ATP+GaolfGDP+GaolfGTP-Gbgolf) : conservation law for (AC5_Ca_GaolfGTP)
	AC5 = AC5_cc - (AC5_ATP+AC5_Ca+AC5_Ca_ATP+Gbgolf-GaolfGDP-GaolfGTP) : conservation law for (AC5)
	Ca = cali : natively mapped to intracellular calcium
	DA = DAi : natively mapped to extracellular dopamine
	: Ion WRITE variable value updates
	pSubstratei = pSubstrate
	PKAci = PKAc
	ATP_expression = 5.0 : assignment for expression (ATP_expression)
	Ca_expression = 1e-06 : assignment for expression (Ca_expression)
	DA_expression = DA_basal+(1/(1+exp((-10E+10)*(time-DA_start)))*(DA_max/(exp(-tau_DA1*tau_DA2/(tau_DA2-tau_DA1)*log(tau_DA2/tau_DA1)/tau_DA1)-
		exp(-tau_DA1*tau_DA2/(tau_DA2-tau_DA1)*log(tau_DA2/tau_DA1)/tau_DA2))*(exp(-(time-DA_start)/tau_DA1)-
		exp(-(time-DA_start)/tau_DA2)))) : assignment for expression (DA_expression)
	AMP = 0.0 : assignment for expression (AMP)
	ATP = 5.0 : assignment for expression (ATP)
	R0 = kf_R0*GaolfGTP : flux expression R0
	R1 = kf_R1*D1R_Golf_DA : flux expression R1
	R2 = kf_R2*D1R_Golf*DA-kr_R2*D1R_Golf_DA : flux expression R2
	R3 = kf_R3*D1R*DA-kr_R3*D1R_DA : flux expression R3
	R4 = kf_R4*AC5*GaolfGTP-kr_R4*AC5_GaolfGTP : flux expression R4
	R5 = kf_R5*CaM*Ca-kr_R5*CaM_Ca2 : flux expression R5
	R6 = kf_R6*PP2B*CaM-kr_R6*PP2B_CaM : flux expression R6
	R7 = kf_R7*CaM_Ca4*PP2B-kr_R7*PP2Bc : flux expression R7
	R8 = kf_R8*PKAc*D32-kr_R8*PKAc_D32 : flux expression R8
	R9 = kf_R9*PKAc_D32 : flux expression R9
	R10 = kf_R10*PKAc*B56PP2A-kr_R10*PKAc_B56PP2A : flux expression R10
	R11 = kf_R11*PKAc_B56PP2A : flux expression R11
	R12 = kf_R12*D32p34*PP1-kr_R12*PP1_D32p34 : flux expression R12
	R13 = kf_R13*CDK5*D32-kr_R13*CDK5_D32 : flux expression R13
	R14 = kf_R14*CDK5_D32 : flux expression R14
	R15 = kf_R15*D32p75*PKAc-kr_R15*PKAc_D32p75 : flux expression R15
	R16 = kf_R16*B72PP2A*Ca-kr_R16*B72PP2A_Ca : flux expression R16
	R17 = kf_R17*B56PP2Ap*D32p75-kr_R17*B56PP2Ap_D32p75 : flux expression R17
	R18 = kf_R18*B72PP2A*D32p75-kr_R18*B72PP2A_D32p75 : flux expression R18
	R19 = kf_R19*D32p75*B72PP2A_Ca-kr_R19*B72PP2A_Ca_D32p75 : flux expression R19
	R20 = kf_R20*B56PP2Ap_D32p75 : flux expression R20
	R21 = kf_R21*B72PP2A_D32p75 : flux expression R21
	R22 = kf_R22*B72PP2A_Ca_D32p75 : flux expression R22
	R23 = kf_R23*D32p34*PP2Bc-kr_R23*PP2Bc_D32p34 : flux expression R23
	R24 = kf_R24*CaM_Ca2*Ca-kr_R24*CaM_Ca4 : flux expression R24
	R25 = kf_R25*Ca*PP2B_CaM-kr_R25*PP2B_CaM_Ca2 : flux expression R25
	R26 = kf_R26*Ca*PP2B_CaM_Ca2-kr_R26*PP2Bc : flux expression R26
	R27 = kf_R27*CaM_Ca2*PP2B-kr_R27*PP2B_CaM_Ca2 : flux expression R27
	R28 = kf_R28*AC5*Ca-kr_R28*AC5_Ca : flux expression R28
	R29 = kf_R29*AC5_Ca*GaolfGTP-kr_R29*AC5_Ca_GaolfGTP : flux expression R29
	R30 = kf_R30*D32p75*B56PP2A-kr_R30*B56PP2A_D32p75 : flux expression R30
	R31 = kf_R31*B56PP2A_D32p75 : flux expression R31
	R32 = kf_R32*B72PP2A_Ca_D32p34 : flux expression R32
	R33 = kf_R33*B72PP2A_D32p34 : flux expression R33
	R34 = kf_R34*D32p34*B72PP2A_Ca-kr_R34*B72PP2A_Ca_D32p34 : flux expression R34
	R35 = kf_R35*D32p34*B72PP2A-kr_R35*B72PP2A_D32p34 : flux expression R35
	R36 = kf_R36*PP2Bc_D32p34 : flux expression R36
	R37 = kf_R37*B56PP2Ap : flux expression R37
	R38 = kf_R38*cAMP*PKA-kr_R38*PKA_Ca2MP : flux expression R38
	R39 = kf_R39*cAMP*PKA_Ca2MP-kr_R39*PKA_Ca4MP : flux expression R39
	R40 = kf_R40*PKA_Ca4MP-kr_R40*PKAc*PKAreg : flux expression R40
	R41 = kf_R41*cAMP*PDE4-kr_R41*PDE4_cAMP : flux expression R41
	R42 = kf_R42*PDE4_cAMP : flux expression R42
	R43 = kf_R43*PDE10r*cAMP^2-kr_R43*PDE10c : flux expression R43
	R44 = kf_R44*PDE10r_cAMP : flux expression R44
	R45 = kf_R45*cAMP*PDE10r-kr_R45*PDE10r_cAMP : flux expression R45
	R46 = kf_R46*PDE10c_cAMP : flux expression R46
	R47 = kf_R47*GaolfGDP*Gbgolf : flux expression R47
	R48 = kf_R48*AC5_GaolfGTP*ATP-kr_R48*AC5_GaolfGTP_ATP : flux expression R48
	R49 = kf_R49*AC5*ATP-kr_R49*AC5_ATP : flux expression R49
	R50 = kf_R50*AC5_Ca*ATP-kr_R50*AC5_Ca_ATP : flux expression R50
	R51 = kf_R51*AC5_Ca_GaolfGTP*ATP-kr_R51*AC5_Ca_GaolfGTP_ATP : flux expression R51
	R52 = kf_R52*GaolfGTP*AC5_ATP-kr_R52*AC5_GaolfGTP_ATP : flux expression R52
	R53 = kf_R53*GaolfGTP*AC5_Ca_ATP-kr_R53*AC5_Ca_GaolfGTP_ATP : flux expression R53
	R54 = kf_R54*Ca*AC5_ATP-kr_R54*AC5_Ca_ATP : flux expression R54
	R55 = kf_R55*AC5_GaolfGTP_ATP : flux expression R55
	R56 = kf_R56*cAMP*AC5_GaolfGTP : flux expression R56
	R57 = kf_R57*AC5_ATP : flux expression R57
	R58 = kf_R58*cAMP*AC5 : flux expression R58
	R59 = kf_R59*AC5_Ca_ATP : flux expression R59
	R60 = kf_R60*cAMP*AC5_Ca : flux expression R60
	R61 = kf_R61*AC5_Ca_GaolfGTP_ATP : flux expression R61
	R62 = kf_R62*cAMP*AC5_Ca_GaolfGTP : flux expression R62
	R63 = kf_R63*AC5_GaolfGTP : flux expression R63
	R64 = kf_R64*AC5_Ca_GaolfGTP : flux expression R64
	R65 = kf_R65*AC5_GaolfGTP_ATP : flux expression R65
	R66 = kf_R66*AC5_Ca_GaolfGTP_ATP : flux expression R66
	R67 = kf_R67*D1R*Golf-kr_R67*D1R_Golf : flux expression R67
	R68 = kf_R68*Golf*D1R_DA-kr_R68*D1R_Golf_DA : flux expression R68
	R69 = kf_R69*cAMP*PDE10c-kr_R69*PDE10c_cAMP : flux expression R69
	R70 = kf_R70*CaMKII*CaM_Ca4-kr_R70*CaMKII_CaM_Ca4 : flux expression R70
	R71 = kf_R71*CaM_Ca2*CaMKII-kr_R71*CaMKII_CaM_Ca2 : flux expression R71
	R72 = kf_R72*CaM*CaMKII-kr_R72*CaMKII_CaM : flux expression R72
	R73 = kf_R73*CaMKII_CaM_Ca2*Ca-kr_R73*CaMKII_CaM_Ca4 : flux expression R73
	R74 = kf_R74*CaMKII_CaM*Ca-kr_R74*CaMKII_CaM_Ca2 : flux expression R74
	R75 = kf_R75*pCaMKII_CaM_Ca2*Ca-kr_R75*pCaMKII_CaM_Ca4 : flux expression R75
	R76 = kf_R76*pCaMKII_CaM*Ca-kr_R76*pCaMKII_CaM_Ca2 : flux expression R76
	R77 = kf_R77*pCaMKII*CaM_Ca4-kr_R77*pCaMKII_CaM_Ca4 : flux expression R77
	R78 = kf_R78*pCaMKII*CaM_Ca2-kr_R78*pCaMKII_CaM_Ca2 : flux expression R78
	R79 = kf_R79*pCaMKII*CaM-kr_R79*pCaMKII_CaM : flux expression R79
	R80 = kf_R80*ARPP21*PKAc-kr_R80*PKAc_ARPP21 : flux expression R80
	R81 = kf_R81*PKAc_ARPP21 : flux expression R81
	R82 = kf_R82*pARPP21*CaM_Ca4-kr_R82*CaM_Ca4_pARPP21 : flux expression R82
	R83 = kf_R83*B72PP2A_Ca_pARPP21 : flux expression R83
	R84 = kf_R84*pARPP21*B72PP2A_Ca-kr_R84*B72PP2A_Ca_pARPP21 : flux expression R84
	R85 = kf_R85*B72PP2A_pARPP21 : flux expression R85
	R86 = kf_R86*pARPP21*B72PP2A-kr_R86*B72PP2A_pARPP21 : flux expression R86
	R87 = kf_R87*B56PP2Ap_pARPP21 : flux expression R87
	R88 = kf_R88*pARPP21*B56PP2Ap-kr_R88*B56PP2Ap_pARPP21 : flux expression R88
	R89 = kf_R89*B56PP2A_pARPP21 : flux expression R89
	R90 = kf_R90*pARPP21*B56PP2A-kr_R90*B56PP2A_pARPP21 : flux expression R90
	R91 = kf_R91*pSubstrate*PP1-kr_R91*PP1_pSubstrate : flux expression R91
	R92 = kf_R92*PP1_pSubstrate : flux expression R92
	R93 = kf_R93*Substrate*pCaMKII_psd-kr_R93*pCaMKII_psd_Substrate : flux expression R93
	R94 = kf_R94*pCaMKII_psd_Substrate : flux expression R94
	R95 = kf_R95*pCaMKII : flux expression R95
	R96 = kf_R96*Substrate*pCaMKII_CaM_psd-kr_R96*pCaMKII_CaM_psd_Substrate : flux expression R96
	R97 = kf_R97*pCaMKII_CaM_psd_Substrate : flux expression R97
	R98 = kf_R98*Substrate*pCaMKII_CaM_Ca2_psd-kr_R98*C_5 : flux expression R98
	R99 = kf_R99*C_5 : flux expression R99
	R100 = kf_R100*Substrate*pCaMKII_CaM_Ca4_psd-kr_R100*C_6 : flux expression R100
	R101 = kf_R101*C_6 : flux expression R101
	R102 = kf_R102*Substrate*CaMKII_CaM_psd-kr_R102*CaMKII_CaM_psd_Substrate : flux expression R102
	R103 = kf_R103*CaMKII_CaM_psd_Substrate : flux expression R103
	R104 = kf_R104*Substrate*CaMKII_CaM_Ca2_psd-kr_R104*CaMKII_CaM_Ca2_psd_Substrate : flux expression R104
	R105 = kf_R105*CaMKII_CaM_Ca2_psd_Substrate : flux expression R105
	R106 = kf_R106*Substrate*CaMKII_CaM_Ca4_psd-kr_R106*CaMKII_CaM_Ca4_psd_Substrate : flux expression R106
	R107 = kf_R107*CaMKII_CaM_Ca4_psd_Substrate : flux expression R107
	R108 = kf_R108*pCaMKII_CaM_Ca4-kr_R108*pCaMKII_CaM_Ca4_psd : flux expression R108
	R109 = kf_R109*pCaMKII_CaM_Ca2-kr_R109*pCaMKII_CaM_Ca2_psd : flux expression R109
	R110 = kf_R110*pCaMKII_CaM-kr_R110*pCaMKII_CaM_psd : flux expression R110
	R111 = kf_R111*pCaMKII-kr_R111*pCaMKII_psd : flux expression R111
	R112 = kf_R112*CaM_Ca4*pCaMKII_psd-kr_R112*pCaMKII_CaM_Ca4_psd : flux expression R112
	R113 = kf_R113*pCaMKII_psd*CaM_Ca2-kr_R113*pCaMKII_CaM_Ca2_psd : flux expression R113
	R114 = kf_R114*CaM*pCaMKII_psd-kr_R114*pCaMKII_CaM_psd : flux expression R114
	R115 = kf_R115*pCaMKII_CaM_psd*Ca-kr_R115*pCaMKII_CaM_Ca2_psd : flux expression R115
	R116 = kf_R116*pCaMKII_CaM_Ca2_psd*Ca-kr_R116*pCaMKII_CaM_Ca4_psd : flux expression R116
	R117 = kf_R117*pCaMKII_psd*PP1-kr_R117*PP1_pCaMKII_psd : flux expression R117
	R118 = kf_R118*PP1_pCaMKII_psd : flux expression R118
	R119 = kf_R119*CaMKII_psd : flux expression R119
	R120 = kf_R120*CaM_Ca4*CaMKII_psd-kr_R120*CaMKII_CaM_Ca4_psd : flux expression R120
	R121 = kf_R121*CaM_Ca2*CaMKII_psd-kr_R121*CaMKII_CaM_Ca2_psd : flux expression R121
	R122 = kf_R122*CaM*CaMKII_psd-kr_R122*CaMKII_CaM_psd : flux expression R122
	R123 = kf_R123*CaMKII_CaM_Ca2_psd*Ca-kr_R123*CaMKII_CaM_Ca4_psd : flux expression R123
	R124 = kf_R124*CaMKII_CaM_psd*Ca-kr_R124*CaMKII_CaM_Ca2_psd : flux expression R124
	R125 = kf_R125*CaMKII_CaM-kr_R125*CaMKII_CaM_psd : flux expression R125
	R126 = kf_R126*CaMKII_CaM_Ca2-kr_R126*CaMKII_CaM_Ca2_psd : flux expression R126
	R127 = kf_R127*CaMKII_CaM_Ca4-kr_R127*CaMKII_CaM_Ca4_psd : flux expression R127
	R128 = kf_R128*C_1-kr_R128*C_3 : flux expression R128
	R129 = kf_R129*C_2-kr_R129*C_4 : flux expression R129
	R130 = kf_R130*CaMKII_CaM_Ca4*CaMKII_CaM_Ca4-kr_R130*C_3 : flux expression R130
	R131 = kf_R131*C_3 : flux expression R131
	R132 = kf_R132*pCaMKII_CaM_Ca4*CaMKII_CaM_Ca4-kr_R132*C_4 : flux expression R132
	R133 = kf_R133*C_4 : flux expression R133
	R134 = kf_R134*CaMKII_CaM_Ca4_psd*CaMKII_CaM_Ca4_psd-kr_R134*C_1 : flux expression R134
	R135 = kf_R135*C_1 : flux expression R135
	R136 = kf_R136*pCaMKII_CaM_Ca4_psd*CaMKII_CaM_Ca4_psd-kr_R136*C_2 : flux expression R136
	R137 = kf_R137*C_2 : flux expression R137
}