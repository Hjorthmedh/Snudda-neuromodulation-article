TITLE Nair_2016_optimized
COMMENT
	automatically generated from an SBtab file
	date: Tue Jun 23 12:20:31 2026
ENDCOMMENT
NEURON {
	SUFFIX Nair_2016_optimized : OR perhaps POINT_PROCESS ?
	RANGE O1 : output
	RANGE EX0, EX1, EX2, AMP, ATP, Ca, DA : assigned
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
	RANGE CaMKII_CaM_Ca4_psd_CaMKII_CaM_Ca4_psd : compound
	RANGE pCaMKII_CaM_Ca4_psd_CaMKII_CaM_Ca4_psd : compound
	RANGE CaMKII_CaM_Ca4_CaMKII_CaM_Ca4 : compound
	RANGE pCaMKII_CaM_Ca4_CaMKII_CaM_Ca4 : compound
	RANGE PP2B : compound
	RANGE PP2Bc : compound
	RANGE PP2Bc_D32p34 : compound
	RANGE PP2B_CaM : compound
	RANGE PP2B_CaM_Ca2 : compound
	RANGE pARPP21 : compound
	RANGE ARPP21 : compound
	RANGE pCaMKII_psd_Substrate : compound
	RANGE pCaMKII_CaM_psd_Substrate : compound
	RANGE pCaMKII_CaM_Ca2_psd_Substrate : compound
	RANGE pCaMKII_CaM_Ca4_psd_Substrate : compound
	RANGE CaMKII_CaM_psd_Substrate : compound
	RANGE CaMKII_CaM_Ca2_psd_Substrate : compound
	RANGE CaMKII_CaM_Ca4_psd_Substrate : compound
: USEION ca READ cai VALENCE 2 : sth. like this may be needed for ions you have in your model
}
CONSTANT {
	C0 = 34.979 (millisecond) : a constant
	C1 = 420 (millisecond) : a constant
	C2 = 20 (nanomole/liter) : a constant
	C3 = 60 (nanomole/liter) : a constant
}
PARAMETER {
	K0 = 0.0299985 (/millisecond): a kinetic parameter
	K1 = 0.0150003 (/millisecond): a kinetic parameter
	K2 = 5.00035e-05 (liter/nanomole-millisecond): a kinetic parameter
	K3 = 0.25 (/millisecond): a kinetic parameter
	K4 = 5.00035e-05 (liter/nanomole-millisecond): a kinetic parameter
	K5 = 0.25 (/millisecond): a kinetic parameter
	K6 = 0.01 (liter/nanomole-millisecond): a kinetic parameter
	K7 = 0.001 (/millisecond): a kinetic parameter
	K8 = 6.00067e-06 (liter/nanomole-millisecond): a kinetic parameter
	K9 = 0.0199986 (/millisecond): a kinetic parameter
	K10 = 0.0001 (liter/nanomole-millisecond): a kinetic parameter
	K11 = 2.99999 (/millisecond): a kinetic parameter
	K12 = 0.0001 (liter/nanomole-millisecond): a kinetic parameter
	K13 = 2.99985e-06 (/millisecond): a kinetic parameter
	K14 = 1e-05 (liter/nanomole-millisecond): a kinetic parameter
	K15 = 0.2 (/millisecond): a kinetic parameter
	K16 = 0.01 (/millisecond): a kinetic parameter
	K17 = 1e-06 (liter/nanomole-millisecond): a kinetic parameter
	K18 = 0.000299985 (/millisecond): a kinetic parameter
	K19 = 0.000199986 (/millisecond): a kinetic parameter
	K20 = 0.001 (liter/nanomole-millisecond): a kinetic parameter
	K21 = 0.00150003 (/millisecond): a kinetic parameter
	K22 = 1e-06 (liter/nanomole-millisecond): a kinetic parameter
	K23 = 0.1 (/millisecond): a kinetic parameter
	K24 = 0.01 (/millisecond): a kinetic parameter
	K25 = 0.0001 (liter/nanomole-millisecond): a kinetic parameter
	K26 = 0.1 (/millisecond): a kinetic parameter
	K27 = 1e-05 (liter/nanomole-millisecond): a kinetic parameter
	K28 = 0.01 (/millisecond): a kinetic parameter
	K29 = 1.50003e-05 (liter/nanomole-millisecond): a kinetic parameter
	K30 = 0.1 (/millisecond): a kinetic parameter
	K31 = 8.00018e-06 (liter/nanomole-millisecond): a kinetic parameter
	K32 = 0.1 (/millisecond): a kinetic parameter
	K33 = 1.50003e-05 (liter/nanomole-millisecond): a kinetic parameter
	K34 = 0.1 (/millisecond): a kinetic parameter
	K35 = 0.00800018 (/millisecond): a kinetic parameter
	K36 = 0.00150003 (/millisecond): a kinetic parameter
	K37 = 0.00800018 (/millisecond): a kinetic parameter
	K38 = 0.00129987 (liter/nanomole-millisecond): a kinetic parameter
	K39 = 0.0001 (/millisecond): a kinetic parameter
	K40 = 0.0001 (liter/nanomole-millisecond): a kinetic parameter
	K41 = 1 (/millisecond): a kinetic parameter
	K42 = 6.00067e-06 (liter/nanomole-millisecond): a kinetic parameter
	K43 = 1.99986e-07 (/millisecond): a kinetic parameter
	K44 = 0.0001 (liter/nanomole-millisecond): a kinetic parameter
	K45 = 0.1 (/millisecond): a kinetic parameter
	K46 = 0.0001 (liter/nanomole-millisecond): a kinetic parameter
	K47 = 2.99985e-05 (/millisecond): a kinetic parameter
	K48 = 1e-06 (liter/nanomole-millisecond): a kinetic parameter
	K49 = 0.01 (/millisecond): a kinetic parameter
	K50 = 0.01 (liter/nanomole-millisecond): a kinetic parameter
	K51 = 0.001 (/millisecond): a kinetic parameter
	K52 = 8.00018e-06 (liter/nanomole-millisecond): a kinetic parameter
	K53 = 0.1 (/millisecond): a kinetic parameter
	K54 = 0.00150003 (/millisecond): a kinetic parameter
	K55 = 0.00299985 (/millisecond): a kinetic parameter
	K56 = 0.00299985 (/millisecond): a kinetic parameter
	K57 = 5.00035e-07 (liter/nanomole-millisecond): a kinetic parameter
	K58 = 0.001 (/millisecond): a kinetic parameter
	K59 = 5.00035e-07 (liter/nanomole-millisecond): a kinetic parameter
	K60 = 0.001 (/millisecond): a kinetic parameter
	K61 = 0.00120005 (/millisecond): a kinetic parameter
	K62 = 8.00018e-06 (/millisecond): a kinetic parameter
	K63 = 2.60016e-05 (liter/nanomole-millisecond): a kinetic parameter
	K64 = 0.350002 (/millisecond): a kinetic parameter
	K65 = 3.46019e-05 (liter/nanomole-millisecond): a kinetic parameter
	K66 = 0.0500035 (/millisecond): a kinetic parameter
	K67 = 0.0500035 (/millisecond): a kinetic parameter
	K68 = 2.99985e-05 (liter/nanomole-millisecond): a kinetic parameter
	K69 = 2.99985e-05 (liter/nanomole-millisecond): a kinetic parameter
	K70 = 0.001 (/millisecond): a kinetic parameter
	K71 = 0.00249977 (/millisecond): a kinetic parameter
	K72 = 1e-09 (liter^2/nanomole^2-millisecond): a kinetic parameter
	K73 = 0.001 (/millisecond): a kinetic parameter
	K74 = 0.00299985 (/millisecond): a kinetic parameter
	K75 = 0.0001 (liter/nanomole-millisecond): a kinetic parameter
	K76 = 0.00199986 (/millisecond): a kinetic parameter
	K77 = 0.01 (/millisecond): a kinetic parameter
	K78 = 0.1 (liter/nanomole-millisecond): a kinetic parameter
	K79 = 2.54976e-06 (liter/nanomole-millisecond): a kinetic parameter
	K80 = 0.001 (/millisecond): a kinetic parameter
	K81 = 1e-07 (liter/nanomole-millisecond): a kinetic parameter
	K82 = 0.001 (/millisecond): a kinetic parameter
	K83 = 7.50067e-08 (liter/nanomole-millisecond): a kinetic parameter
	K84 = 0.001 (/millisecond): a kinetic parameter
	K85 = 1.29987e-06 (liter/nanomole-millisecond): a kinetic parameter
	K86 = 0.001 (/millisecond): a kinetic parameter
	K87 = 0.01 (liter/nanomole-millisecond): a kinetic parameter
	K88 = 0.001 (/millisecond): a kinetic parameter
	K89 = 0.01 (liter/nanomole-millisecond): a kinetic parameter
	K90 = 0.001 (/millisecond): a kinetic parameter
	K91 = 1e-06 (liter/nanomole-millisecond): a kinetic parameter
	K92 = 0.01 (/millisecond): a kinetic parameter
	K93 = 0.0500035 (/millisecond): a kinetic parameter
	K94 = 0.00254976 (liter/nanomole-millisecond): a kinetic parameter
	K95 = 0.001 (/millisecond): a kinetic parameter
	K96 = 1.99986e-06 (liter/nanomole-millisecond): a kinetic parameter
	K97 = 0.000500035 (/millisecond): a kinetic parameter
	K98 = 7.50067e-07 (liter/nanomole-millisecond): a kinetic parameter
	K99 = 0.0249977 (/millisecond): a kinetic parameter
	K100 = 0.00064998 (liter/nanomole-millisecond): a kinetic parameter
	K101 = 0.001 (/millisecond): a kinetic parameter
	K102 = 0.001 (/millisecond): a kinetic parameter
	K103 = 0.001 (/millisecond): a kinetic parameter
	K104 = 0.001 (/millisecond): a kinetic parameter
	K105 = 6.00067e-05 (liter/nanomole-millisecond): a kinetic parameter
	K106 = 0.25 (/millisecond): a kinetic parameter
	K107 = 6.00067e-05 (liter/nanomole-millisecond): a kinetic parameter
	K108 = 0.25 (/millisecond): a kinetic parameter
	K109 = 0.0001 (liter/nanomole-millisecond): a kinetic parameter
	K110 = 0.00199986 (/millisecond): a kinetic parameter
	K111 = 0.0001 (liter/nanomole-millisecond): a kinetic parameter
	K112 = 0.0400037 (/millisecond): a kinetic parameter
	K113 = 0.0001 (liter/nanomole-millisecond): a kinetic parameter
	K114 = 0.4 (/millisecond): a kinetic parameter
	K115 = 0.0001 (liter/nanomole-millisecond): a kinetic parameter
	K116 = 4 (/millisecond): a kinetic parameter
	K117 = 0.0001 (liter/nanomole-millisecond): a kinetic parameter
	K118 = 0.1 (/millisecond): a kinetic parameter
	K119 = 6.00067e-06 (liter/nanomole-millisecond): a kinetic parameter
	K120 = 0.00199986 (/millisecond): a kinetic parameter
	K121 = 0.0001 (liter/nanomole-millisecond): a kinetic parameter
	K122 = 0.01 (/millisecond): a kinetic parameter
	K123 = 6.00067e-06 (liter/nanomole-millisecond): a kinetic parameter
	K124 = 0.00199986 (/millisecond): a kinetic parameter
	K125 = 0.0001 (liter/nanomole-millisecond): a kinetic parameter
	K126 = 0.000400037 (/millisecond): a kinetic parameter
	K127 = 0.0001 (liter/nanomole-millisecond): a kinetic parameter
	K128 = 0.0400037 (/millisecond): a kinetic parameter
	K129 = 0.0001 (liter/nanomole-millisecond): a kinetic parameter
	K130 = 0.4 (/millisecond): a kinetic parameter
	K131 = 4.49987e-05 (liter/nanomole-millisecond): a kinetic parameter
	K132 = 0.2 (/millisecond): a kinetic parameter
	K133 = 0.01 (/millisecond): a kinetic parameter
	K134 = 0.000500035 (liter/nanomole-millisecond): a kinetic parameter
	K135 = 0.01 (/millisecond): a kinetic parameter
	K136 = 0.01 (/millisecond): a kinetic parameter
	K137 = 7.00003e-06 (liter/nanomole-millisecond): a kinetic parameter
	K138 = 0.1 (/millisecond): a kinetic parameter
	K139 = 0.001 (/millisecond): a kinetic parameter
	K140 = 4.00037e-06 (liter/nanomole-millisecond): a kinetic parameter
	K141 = 0.1 (/millisecond): a kinetic parameter
	K142 = 0.01 (/millisecond): a kinetic parameter
	K143 = 7.00003e-06 (liter/nanomole-millisecond): a kinetic parameter
	K144 = 0.1 (/millisecond): a kinetic parameter
	K145 = 0.001 (/millisecond): a kinetic parameter
	K146 = 4.00037e-06 (liter/nanomole-millisecond): a kinetic parameter
	K147 = 0.1 (/millisecond): a kinetic parameter
	K148 = 5.00035e-07 (liter/nanomole-millisecond): a kinetic parameter
	K149 = 0.001 (/millisecond): a kinetic parameter
	K150 = 0.01 (/millisecond): a kinetic parameter
	K151 = 5.00035e-07 (liter/nanomole-millisecond): a kinetic parameter
	K152 = 0.01 (/millisecond): a kinetic parameter
	K153 = 0.01 (/millisecond): a kinetic parameter
	K154 = 0.0001 (/millisecond): a kinetic parameter
	K155 = 5.00035e-07 (liter/nanomole-millisecond): a kinetic parameter
	K156 = 0.01 (/millisecond): a kinetic parameter
	K157 = 0.01 (/millisecond): a kinetic parameter
	K158 = 5.00035e-07 (liter/nanomole-millisecond): a kinetic parameter
	K159 = 0.01 (/millisecond): a kinetic parameter
	K160 = 0.01 (/millisecond): a kinetic parameter
	K161 = 5.00035e-07 (liter/nanomole-millisecond): a kinetic parameter
	K162 = 0.01 (/millisecond): a kinetic parameter
	K163 = 0.01 (/millisecond): a kinetic parameter
	K164 = 5.00035e-07 (liter/nanomole-millisecond): a kinetic parameter
	K165 = 0.01 (/millisecond): a kinetic parameter
	K166 = 0.01 (/millisecond): a kinetic parameter
	K167 = 5.00035e-07 (liter/nanomole-millisecond): a kinetic parameter
	K168 = 0.01 (/millisecond): a kinetic parameter
	K169 = 0.01 (/millisecond): a kinetic parameter
	K170 = 5.00035e-07 (liter/nanomole-millisecond): a kinetic parameter
	K171 = 0.01 (/millisecond): a kinetic parameter
	K172 = 0.01 (/millisecond): a kinetic parameter
	K173 = 0.000500035 (/millisecond): a kinetic parameter
	K174 = 1e-06 (/millisecond): a kinetic parameter
	K175 = 0.000500035 (/millisecond): a kinetic parameter
	K176 = 1e-06 (/millisecond): a kinetic parameter
	K177 = 0.000500035 (/millisecond): a kinetic parameter
	K178 = 1e-06 (/millisecond): a kinetic parameter
	K179 = 0.000500035 (/millisecond): a kinetic parameter
	K180 = 1e-06 (/millisecond): a kinetic parameter
	K181 = 0.0001 (liter/nanomole-millisecond): a kinetic parameter
	K182 = 0.000400037 (/millisecond): a kinetic parameter
	K183 = 0.0001 (liter/nanomole-millisecond): a kinetic parameter
	K184 = 0.0400037 (/millisecond): a kinetic parameter
	K185 = 0.0001 (liter/nanomole-millisecond): a kinetic parameter
	K186 = 0.4 (/millisecond): a kinetic parameter
	K187 = 6.00067e-06 (liter/nanomole-millisecond): a kinetic parameter
	K188 = 0.00199986 (/millisecond): a kinetic parameter
	K189 = 0.0001 (liter/nanomole-millisecond): a kinetic parameter
	K190 = 0.01 (/millisecond): a kinetic parameter
	K191 = 8.00018e-07 (liter/nanomole-millisecond): a kinetic parameter
	K192 = 0.001 (/millisecond): a kinetic parameter
	K193 = 0.001 (/millisecond): a kinetic parameter
	K194 = 0.000500035 (/millisecond): a kinetic parameter
	K195 = 0.0001 (liter/nanomole-millisecond): a kinetic parameter
	K196 = 0.0400037 (/millisecond): a kinetic parameter
	K197 = 0.0001 (liter/nanomole-millisecond): a kinetic parameter
	K198 = 0.4 (/millisecond): a kinetic parameter
	K199 = 0.0001 (liter/nanomole-millisecond): a kinetic parameter
	K200 = 4 (/millisecond): a kinetic parameter
	K201 = 0.0001 (liter/nanomole-millisecond): a kinetic parameter
	K202 = 0.1 (/millisecond): a kinetic parameter
	K203 = 6.00067e-06 (liter/nanomole-millisecond): a kinetic parameter
	K204 = 0.00199986 (/millisecond): a kinetic parameter
	K205 = 0.000500035 (/millisecond): a kinetic parameter
	K206 = 0.000500035 (/millisecond): a kinetic parameter
	K207 = 0.000500035 (/millisecond): a kinetic parameter
	K208 = 0.000500035 (/millisecond): a kinetic parameter
	K209 = 0.000500035 (/millisecond): a kinetic parameter
	K210 = 0.000500035 (/millisecond): a kinetic parameter
	K211 = 0.000500035 (/millisecond): a kinetic parameter
	K212 = 0.000500035 (/millisecond): a kinetic parameter
	K213 = 1e-06 (/millisecond): a kinetic parameter
	K214 = 0.000500035 (/millisecond): a kinetic parameter
	K215 = 3.59998e-07 (liter/nanomole-millisecond): a kinetic parameter
	K216 = 0.0229985 (/millisecond): a kinetic parameter
	K217 = 0.00390032 (/millisecond): a kinetic parameter
	K218 = 1.10002e-06 (liter/nanomole-millisecond): a kinetic parameter
	K219 = 0.00540008 (/millisecond): a kinetic parameter
	K220 = 10 (/millisecond): a kinetic parameter
	K221 = 3.59998e-07 (liter/nanomole-millisecond): a kinetic parameter
	K222 = 0.0229985 (/millisecond): a kinetic parameter
	K223 = 0.00390032 (/millisecond): a kinetic parameter
	K224 = 1.10002e-06 (liter/nanomole-millisecond): a kinetic parameter
	K225 = 0.00540008 (/millisecond): a kinetic parameter
	K226 = 10 (/millisecond): a kinetic parameter
}
ASSIGNED {
	time (millisecond) : alias for t
	EX0 : a pre-defined algebraic expression
	EX1 : a pre-defined algebraic expression
	EX2 : a pre-defined algebraic expression
	AMP : a pre-defined algebraic expression
	ATP : a pre-defined algebraic expression
	Ca : a pre-defined algebraic expression
	DA : a pre-defined algebraic expression
	R0 : a flux, for use in DERIVATIVE mechanism
	R1 : a flux, for use in DERIVATIVE mechanism
	R2 : a flux, for use in DERIVATIVE mechanism
	R3 : a flux, for use in DERIVATIVE mechanism
	R4 : a flux, for use in DERIVATIVE mechanism
	R5 : a flux, for use in DERIVATIVE mechanism
	R6 : a flux, for use in DERIVATIVE mechanism
	R7 : a flux, for use in DERIVATIVE mechanism
	R8 : a flux, for use in DERIVATIVE mechanism
	R9 : a flux, for use in DERIVATIVE mechanism
	R10 : a flux, for use in DERIVATIVE mechanism
	R11 : a flux, for use in DERIVATIVE mechanism
	R12 : a flux, for use in DERIVATIVE mechanism
	R13 : a flux, for use in DERIVATIVE mechanism
	R14 : a flux, for use in DERIVATIVE mechanism
	R15 : a flux, for use in DERIVATIVE mechanism
	R16 : a flux, for use in DERIVATIVE mechanism
	R17 : a flux, for use in DERIVATIVE mechanism
	R18 : a flux, for use in DERIVATIVE mechanism
	R19 : a flux, for use in DERIVATIVE mechanism
	R20 : a flux, for use in DERIVATIVE mechanism
	R21 : a flux, for use in DERIVATIVE mechanism
	R22 : a flux, for use in DERIVATIVE mechanism
	R23 : a flux, for use in DERIVATIVE mechanism
	R24 : a flux, for use in DERIVATIVE mechanism
	R25 : a flux, for use in DERIVATIVE mechanism
	R26 : a flux, for use in DERIVATIVE mechanism
	R27 : a flux, for use in DERIVATIVE mechanism
	R28 : a flux, for use in DERIVATIVE mechanism
	R29 : a flux, for use in DERIVATIVE mechanism
	R30 : a flux, for use in DERIVATIVE mechanism
	R31 : a flux, for use in DERIVATIVE mechanism
	R32 : a flux, for use in DERIVATIVE mechanism
	R33 : a flux, for use in DERIVATIVE mechanism
	R34 : a flux, for use in DERIVATIVE mechanism
	R35 : a flux, for use in DERIVATIVE mechanism
	R36 : a flux, for use in DERIVATIVE mechanism
	R37 : a flux, for use in DERIVATIVE mechanism
	R38 : a flux, for use in DERIVATIVE mechanism
	R39 : a flux, for use in DERIVATIVE mechanism
	R40 : a flux, for use in DERIVATIVE mechanism
	R41 : a flux, for use in DERIVATIVE mechanism
	R42 : a flux, for use in DERIVATIVE mechanism
	R43 : a flux, for use in DERIVATIVE mechanism
	R44 : a flux, for use in DERIVATIVE mechanism
	R45 : a flux, for use in DERIVATIVE mechanism
	R46 : a flux, for use in DERIVATIVE mechanism
	R47 : a flux, for use in DERIVATIVE mechanism
	R48 : a flux, for use in DERIVATIVE mechanism
	R49 : a flux, for use in DERIVATIVE mechanism
	R50 : a flux, for use in DERIVATIVE mechanism
	R51 : a flux, for use in DERIVATIVE mechanism
	R52 : a flux, for use in DERIVATIVE mechanism
	R53 : a flux, for use in DERIVATIVE mechanism
	R54 : a flux, for use in DERIVATIVE mechanism
	R55 : a flux, for use in DERIVATIVE mechanism
	R56 : a flux, for use in DERIVATIVE mechanism
	R57 : a flux, for use in DERIVATIVE mechanism
	R58 : a flux, for use in DERIVATIVE mechanism
	R59 : a flux, for use in DERIVATIVE mechanism
	R60 : a flux, for use in DERIVATIVE mechanism
	R61 : a flux, for use in DERIVATIVE mechanism
	R62 : a flux, for use in DERIVATIVE mechanism
	R63 : a flux, for use in DERIVATIVE mechanism
	R64 : a flux, for use in DERIVATIVE mechanism
	R65 : a flux, for use in DERIVATIVE mechanism
	R66 : a flux, for use in DERIVATIVE mechanism
	R67 : a flux, for use in DERIVATIVE mechanism
	R68 : a flux, for use in DERIVATIVE mechanism
	R69 : a flux, for use in DERIVATIVE mechanism
	R70 : a flux, for use in DERIVATIVE mechanism
	R71 : a flux, for use in DERIVATIVE mechanism
	R72 : a flux, for use in DERIVATIVE mechanism
	R73 : a flux, for use in DERIVATIVE mechanism
	R74 : a flux, for use in DERIVATIVE mechanism
	R75 : a flux, for use in DERIVATIVE mechanism
	R76 : a flux, for use in DERIVATIVE mechanism
	R77 : a flux, for use in DERIVATIVE mechanism
	R78 : a flux, for use in DERIVATIVE mechanism
	R79 : a flux, for use in DERIVATIVE mechanism
	R80 : a flux, for use in DERIVATIVE mechanism
	R81 : a flux, for use in DERIVATIVE mechanism
	R82 : a flux, for use in DERIVATIVE mechanism
	R83 : a flux, for use in DERIVATIVE mechanism
	R84 : a flux, for use in DERIVATIVE mechanism
	R85 : a flux, for use in DERIVATIVE mechanism
	R86 : a flux, for use in DERIVATIVE mechanism
	R87 : a flux, for use in DERIVATIVE mechanism
	R88 : a flux, for use in DERIVATIVE mechanism
	R89 : a flux, for use in DERIVATIVE mechanism
	R90 : a flux, for use in DERIVATIVE mechanism
	R91 : a flux, for use in DERIVATIVE mechanism
	R92 : a flux, for use in DERIVATIVE mechanism
	R93 : a flux, for use in DERIVATIVE mechanism
	R94 : a flux, for use in DERIVATIVE mechanism
	R95 : a flux, for use in DERIVATIVE mechanism
	R96 : a flux, for use in DERIVATIVE mechanism
	R97 : a flux, for use in DERIVATIVE mechanism
	R98 : a flux, for use in DERIVATIVE mechanism
	R99 : a flux, for use in DERIVATIVE mechanism
	R100 : a flux, for use in DERIVATIVE mechanism
	R101 : a flux, for use in DERIVATIVE mechanism
	R102 : a flux, for use in DERIVATIVE mechanism
	R103 : a flux, for use in DERIVATIVE mechanism
	R104 : a flux, for use in DERIVATIVE mechanism
	R105 : a flux, for use in DERIVATIVE mechanism
	R106 : a flux, for use in DERIVATIVE mechanism
	R107 : a flux, for use in DERIVATIVE mechanism
	R108 : a flux, for use in DERIVATIVE mechanism
	R109 : a flux, for use in DERIVATIVE mechanism
	R110 : a flux, for use in DERIVATIVE mechanism
	R111 : a flux, for use in DERIVATIVE mechanism
	R112 : a flux, for use in DERIVATIVE mechanism
	R113 : a flux, for use in DERIVATIVE mechanism
	R114 : a flux, for use in DERIVATIVE mechanism
	R115 : a flux, for use in DERIVATIVE mechanism
	R116 : a flux, for use in DERIVATIVE mechanism
	R117 : a flux, for use in DERIVATIVE mechanism
	R118 : a flux, for use in DERIVATIVE mechanism
	R119 : a flux, for use in DERIVATIVE mechanism
	R120 : a flux, for use in DERIVATIVE mechanism
	R121 : a flux, for use in DERIVATIVE mechanism
	R122 : a flux, for use in DERIVATIVE mechanism
	R123 : a flux, for use in DERIVATIVE mechanism
	R124 : a flux, for use in DERIVATIVE mechanism
	R125 : a flux, for use in DERIVATIVE mechanism
	R126 : a flux, for use in DERIVATIVE mechanism
	R127 : a flux, for use in DERIVATIVE mechanism
	R128 : a flux, for use in DERIVATIVE mechanism
	R129 : a flux, for use in DERIVATIVE mechanism
	R130 : a flux, for use in DERIVATIVE mechanism
	R131 : a flux, for use in DERIVATIVE mechanism
	R132 : a flux, for use in DERIVATIVE mechanism
	R133 : a flux, for use in DERIVATIVE mechanism
	R134 : a flux, for use in DERIVATIVE mechanism
	R135 : a flux, for use in DERIVATIVE mechanism
	R136 : a flux, for use in DERIVATIVE mechanism
	R137 : a flux, for use in DERIVATIVE mechanism
	O1 : an observable
}
PROCEDURE assign_calculated_values() {
	time = t : an alias for the time variable, if needed.
	EX0 = 5000000 : assignment for expression EX0
	EX1 = 1 : assignment for expression EX1
	EX2 = DA_basal+(1/(1+exp((-10E+10)*(time-DA_start)))*(DA_max/(exp(-tau_DA1*tau_DA2/(tau_DA2-tau_DA1)*log(tau_DA2/tau_DA1)/tau_DA1)-exp(-tau_DA1*tau_DA2/(tau_DA2-tau_DA1)*log(tau_DA2/tau_DA1)/tau_DA2))*(exp(-(time-DA_start)/tau_DA1)-exp(-(time-DA_start)/tau_DA2)))) : assignment for expression EX2
	AMP = 0 : assignment for expression AMP
	ATP = 5000000 : assignment for expression ATP
	Ca = 60 : assignment for expression Ca
	DA = 20 : assignment for expression DA
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
	R98 = kf_R98*Substrate*pCaMKII_CaM_Ca2_psd-kr_R98*pCaMKII_CaM_Ca2_psd_Substrate : flux expression R98
	R99 = kf_R99*pCaMKII_CaM_Ca2_psd_Substrate : flux expression R99
	R100 = kf_R100*Substrate*pCaMKII_CaM_Ca4_psd-kr_R100*pCaMKII_CaM_Ca4_psd_Substrate : flux expression R100
	R101 = kf_R101*pCaMKII_CaM_Ca4_psd_Substrate : flux expression R101
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
	R128 = kf_R128*CaMKII_CaM_Ca4_psd_CaMKII_CaM_Ca4_psd-kr_R128*CaMKII_CaM_Ca4_CaMKII_CaM_Ca4 : flux expression R128
	R129 = kf_R129*pCaMKII_CaM_Ca4_psd_CaMKII_CaM_Ca4_psd-kr_R129*pCaMKII_CaM_Ca4_CaMKII_CaM_Ca4 : flux expression R129
	R130 = kf_R130*CaMKII_CaM_Ca4*CaMKII_CaM_Ca4-kr_R130*CaMKII_CaM_Ca4_CaMKII_CaM_Ca4 : flux expression R130
	R131 = kf_R131*CaMKII_CaM_Ca4_CaMKII_CaM_Ca4 : flux expression R131
	R132 = kf_R132*pCaMKII_CaM_Ca4*CaMKII_CaM_Ca4-kr_R132*pCaMKII_CaM_Ca4_CaMKII_CaM_Ca4 : flux expression R132
	R133 = kf_R133*pCaMKII_CaM_Ca4_CaMKII_CaM_Ca4 : flux expression R133
	R134 = kf_R134*CaMKII_CaM_Ca4_psd*CaMKII_CaM_Ca4_psd-kr_R134*CaMKII_CaM_Ca4_psd_CaMKII_CaM_Ca4_psd : flux expression R134
	R135 = kf_R135*CaMKII_CaM_Ca4_psd_CaMKII_CaM_Ca4_psd : flux expression R135
	R136 = kf_R136*pCaMKII_CaM_Ca4_psd*CaMKII_CaM_Ca4_psd-kr_R136*pCaMKII_CaM_Ca4_psd_CaMKII_CaM_Ca4_psd : flux expression R136
	R137 = kf_R137*pCaMKII_CaM_Ca4_psd_CaMKII_CaM_Ca4_psd : flux expression R137
}
STATE {
	AC5 (nanomole/liter) : a state variable
	AC5_ATP (nanomole/liter) : a state variable
	AC5_Ca (nanomole/liter) : a state variable
	AC5_Ca_ATP (nanomole/liter) : a state variable
	AC5_Ca_GaolfGTP (nanomole/liter) : a state variable
	AC5_Ca_GaolfGTP_ATP (nanomole/liter) : a state variable
	AC5_GaolfGTP (nanomole/liter) : a state variable
	AC5_GaolfGTP_ATP (nanomole/liter) : a state variable
	B56PP2A (nanomole/liter) : a state variable
	B56PP2A_D32p75 (nanomole/liter) : a state variable
	B56PP2A_pARPP21 (nanomole/liter) : a state variable
	B56PP2Ap (nanomole/liter) : a state variable
	B56PP2Ap_D32p75 (nanomole/liter) : a state variable
	B56PP2Ap_pARPP21 (nanomole/liter) : a state variable
	B72PP2A (nanomole/liter) : a state variable
	B72PP2A_D32p34 (nanomole/liter) : a state variable
	B72PP2A_D32p75 (nanomole/liter) : a state variable
	B72PP2A_pARPP21 (nanomole/liter) : a state variable
	B72PP2A_Ca_D32p34 (nanomole/liter) : a state variable
	B72PP2A_Ca_D32p75 (nanomole/liter) : a state variable
	B72PP2A_Ca (nanomole/liter) : a state variable
	B72PP2A_Ca_pARPP21 (nanomole/liter) : a state variable
	CaM (nanomole/liter) : a state variable
	CaM_Ca2 (nanomole/liter) : a state variable
	CaM_Ca4 (nanomole/liter) : a state variable
	CaM_Ca4_pARPP21 (nanomole/liter) : a state variable
	CaMKII (nanomole/liter) : a state variable
	CaMKII_CaM_Ca4 (nanomole/liter) : a state variable
	CaMKII_CaM (nanomole/liter) : a state variable
	CaMKII_CaM_Ca2 (nanomole/liter) : a state variable
	CaMKII_CaM_Ca2_psd (nanomole/liter) : a state variable
	CaMKII_CaM_psd (nanomole/liter) : a state variable
	CaMKII_CaM_Ca4_psd (nanomole/liter) : a state variable
	CaMKII_psd (nanomole/liter) : a state variable
	cAMP (nanomole/liter) : a state variable
	Substrate (nanomole/liter) : a state variable
	CDK5 (nanomole/liter) : a state variable
	CDK5_D32 (nanomole/liter) : a state variable
	D1R (nanomole/liter) : a state variable
	D1R_DA (nanomole/liter) : a state variable
	D1R_Golf_DA (nanomole/liter) : a state variable
	D1R_Golf (nanomole/liter) : a state variable
	D32p34 (nanomole/liter) : a state variable
	D32p75 (nanomole/liter) : a state variable
	D32 (nanomole/liter) : a state variable
	GaolfGDP (nanomole/liter) : a state variable
	GaolfGTP (nanomole/liter) : a state variable
	Gbgolf (nanomole/liter) : a state variable
	Golf (nanomole/liter) : a state variable
	pCaMKII (nanomole/liter) : a state variable
	pCaMKII_CaM_Ca4 (nanomole/liter) : a state variable
	pCaMKII_CaM (nanomole/liter) : a state variable
	pCaMKII_CaM_Ca2 (nanomole/liter) : a state variable
	pCaMKII_CaM_Ca2_psd (nanomole/liter) : a state variable
	pCaMKII_CaM_psd (nanomole/liter) : a state variable
	pCaMKII_CaM_Ca4_psd (nanomole/liter) : a state variable
	pCaMKII_psd (nanomole/liter) : a state variable
	pSubstrate (nanomole/liter) : a state variable
	PDE4 (nanomole/liter) : a state variable
	PDE4_cAMP (nanomole/liter) : a state variable
	PDE10r (nanomole/liter) : a state variable
	PDE10r_cAMP (nanomole/liter) : a state variable
	PDE10c (nanomole/liter) : a state variable
	PDE10c_cAMP (nanomole/liter) : a state variable
	PKA (nanomole/liter) : a state variable
	PKAc (nanomole/liter) : a state variable
	PKAc_B56PP2A (nanomole/liter) : a state variable
	PKAc_D32 (nanomole/liter) : a state variable
	PKAc_ARPP21 (nanomole/liter) : a state variable
	PKA_Ca2MP (nanomole/liter) : a state variable
	PKA_Ca4MP (nanomole/liter) : a state variable
	PKAc_D32p75 (nanomole/liter) : a state variable
	PKAreg (nanomole/liter) : a state variable
	PP1 (nanomole/liter) : a state variable
	PP1_pCaMKII_psd (nanomole/liter) : a state variable
	PP1_pSubstrate (nanomole/liter) : a state variable
	PP1_D32p34 (nanomole/liter) : a state variable
	CaMKII_CaM_Ca4_psd_CaMKII_CaM_Ca4_psd (nanomole/liter) : a state variable
	pCaMKII_CaM_Ca4_psd_CaMKII_CaM_Ca4_psd (nanomole/liter) : a state variable
	CaMKII_CaM_Ca4_CaMKII_CaM_Ca4 (nanomole/liter) : a state variable
	pCaMKII_CaM_Ca4_CaMKII_CaM_Ca4 (nanomole/liter) : a state variable
	PP2B (nanomole/liter) : a state variable
	PP2Bc (nanomole/liter) : a state variable
	PP2Bc_D32p34 (nanomole/liter) : a state variable
	PP2B_CaM (nanomole/liter) : a state variable
	PP2B_CaM_Ca2 (nanomole/liter) : a state variable
	pARPP21 (nanomole/liter) : a state variable
	ARPP21 (nanomole/liter) : a state variable
	pCaMKII_psd_Substrate (nanomole/liter) : a state variable
	pCaMKII_CaM_psd_Substrate (nanomole/liter) : a state variable
	pCaMKII_CaM_Ca2_psd_Substrate (nanomole/liter) : a state variable
	pCaMKII_CaM_Ca4_psd_Substrate (nanomole/liter) : a state variable
	CaMKII_CaM_psd_Substrate (nanomole/liter) : a state variable
	CaMKII_CaM_Ca2_psd_Substrate (nanomole/liter) : a state variable
	CaMKII_CaM_Ca4_psd_Substrate (nanomole/liter) : a state variable
}
INITIAL {
	 AC5 = 700 : initial condition
	 AC5_ATP = 0 : initial condition
	 AC5_Ca = 0 : initial condition
	 AC5_Ca_ATP = 0 : initial condition
	 AC5_Ca_GaolfGTP = 0 : initial condition
	 AC5_Ca_GaolfGTP_ATP = 0 : initial condition
	 AC5_GaolfGTP = 0 : initial condition
	 AC5_GaolfGTP_ATP = 0 : initial condition
	 B56PP2A = 2000 : initial condition
	 B56PP2A_D32p75 = 0 : initial condition
	 B56PP2A_pARPP21 = 0 : initial condition
	 B56PP2Ap = 0 : initial condition
	 B56PP2Ap_D32p75 = 0 : initial condition
	 B56PP2Ap_pARPP21 = 0 : initial condition
	 B72PP2A = 2000 : initial condition
	 B72PP2A_D32p34 = 0 : initial condition
	 B72PP2A_D32p75 = 0 : initial condition
	 B72PP2A_pARPP21 = 0 : initial condition
	 B72PP2A_Ca_D32p34 = 0 : initial condition
	 B72PP2A_Ca_D32p75 = 0 : initial condition
	 B72PP2A_Ca = 0 : initial condition
	 B72PP2A_Ca_pARPP21 = 0 : initial condition
	 CaM = 9000 : initial condition
	 CaM_Ca2 = 0 : initial condition
	 CaM_Ca4 = 0 : initial condition
	 CaM_Ca4_pARPP21 = 0 : initial condition
	 CaMKII = 20000 : initial condition
	 CaMKII_CaM_Ca4 = 0 : initial condition
	 CaMKII_CaM = 0 : initial condition
	 CaMKII_CaM_Ca2 = 0 : initial condition
	 CaMKII_CaM_Ca2_psd = 0 : initial condition
	 CaMKII_CaM_psd = 0 : initial condition
	 CaMKII_CaM_Ca4_psd = 0 : initial condition
	 CaMKII_psd = 0 : initial condition
	 cAMP = 0 : initial condition
	 Substrate = 3000 : initial condition
	 CDK5 = 1800 : initial condition
	 CDK5_D32 = 0 : initial condition
	 D1R = 2000 : initial condition
	 D1R_DA = 0 : initial condition
	 D1R_Golf_DA = 0 : initial condition
	 D1R_Golf = 0 : initial condition
	 D32p34 = 0 : initial condition
	 D32p75 = 0 : initial condition
	 D32 = 50000 : initial condition
	 GaolfGDP = 0 : initial condition
	 GaolfGTP = 0 : initial condition
	 Gbgolf = 0 : initial condition
	 Golf = 2000 : initial condition
	 pCaMKII = 0 : initial condition
	 pCaMKII_CaM_Ca4 = 0 : initial condition
	 pCaMKII_CaM = 0 : initial condition
	 pCaMKII_CaM_Ca2 = 0 : initial condition
	 pCaMKII_CaM_Ca2_psd = 0 : initial condition
	 pCaMKII_CaM_psd = 0 : initial condition
	 pCaMKII_CaM_Ca4_psd = 0 : initial condition
	 pCaMKII_psd = 0 : initial condition
	 pSubstrate = 0 : initial condition
	 PDE4 = 2000 : initial condition
	 PDE4_cAMP = 0 : initial condition
	 PDE10r = 700 : initial condition
	 PDE10r_cAMP = 0 : initial condition
	 PDE10c = 0 : initial condition
	 PDE10c_cAMP = 0 : initial condition
	 PKA = 1200 : initial condition
	 PKAc = 0 : initial condition
	 PKAc_B56PP2A = 0 : initial condition
	 PKAc_D32 = 0 : initial condition
	 PKAc_ARPP21 = 0 : initial condition
	 PKA_Ca2MP = 0 : initial condition
	 PKA_Ca4MP = 0 : initial condition
	 PKAc_D32p75 = 0 : initial condition
	 PKAreg = 0 : initial condition
	 PP1 = 3000 : initial condition
	 PP1_pCaMKII_psd = 0 : initial condition
	 PP1_pSubstrate = 0 : initial condition
	 PP1_D32p34 = 0 : initial condition
	 CaMKII_CaM_Ca4_psd_CaMKII_CaM_Ca4_psd = 0 : initial condition
	 pCaMKII_CaM_Ca4_psd_CaMKII_CaM_Ca4_psd = 0 : initial condition
	 CaMKII_CaM_Ca4_CaMKII_CaM_Ca4 = 0 : initial condition
	 pCaMKII_CaM_Ca4_CaMKII_CaM_Ca4 = 0 : initial condition
	 PP2B = 4000 : initial condition
	 PP2Bc = 0 : initial condition
	 PP2Bc_D32p34 = 0 : initial condition
	 PP2B_CaM = 0 : initial condition
	 PP2B_CaM_Ca2 = 0 : initial condition
	 pARPP21 = 0 : initial condition
	 ARPP21 = 20000 : initial condition
	 pCaMKII_psd_Substrate = 0 : initial condition
	 pCaMKII_CaM_psd_Substrate = 0 : initial condition
	 pCaMKII_CaM_Ca2_psd_Substrate = 0 : initial condition
	 pCaMKII_CaM_Ca4_psd_Substrate = 0 : initial condition
	 CaMKII_CaM_psd_Substrate = 0 : initial condition
	 CaMKII_CaM_Ca2_psd_Substrate = 0 : initial condition
	 CaMKII_CaM_Ca4_psd_Substrate = 0 : initial condition
}
BREAKPOINT {
	SOLVE ode METHOD cnexp
	assign_calculated_values() : procedure
}
DERIVATIVE ode {
	AC5' = -R4-R28-R49+R57-R58+R63 : affects compound AC5
	AC5_ATP' = R49-R52-R54-R57+R58+R65 : affects compound AC5_ATP
	AC5_Ca' = R28-R29-R50+R59-R60+R64 : affects compound AC5_Ca
	AC5_Ca_ATP' = R50-R53+R54-R59+R60+R66 : affects compound AC5_Ca_ATP
	AC5_Ca_GaolfGTP' = R29-R51+R61-R62-R64 : affects compound AC5_Ca_GaolfGTP
	AC5_Ca_GaolfGTP_ATP' = R51+R53-R61+R62-R66 : affects compound AC5_Ca_GaolfGTP_ATP
	AC5_GaolfGTP' = R4-R48+R55-R56-R63 : affects compound AC5_GaolfGTP
	AC5_GaolfGTP_ATP' = R48+R52-R55+R56-R65 : affects compound AC5_GaolfGTP_ATP
	B56PP2A' = -R10-R30+R31+R37+R89-R90 : affects compound B56PP2A
	B56PP2A_D32p75' = R30-R31 : affects compound B56PP2A_D32p75
	B56PP2A_pARPP21' = -R89+R90 : affects compound B56PP2A_pARPP21
	B56PP2Ap' = R11-R17+R20-R37+R87-R88 : affects compound B56PP2Ap
	B56PP2Ap_D32p75' = R17-R20 : affects compound B56PP2Ap_D32p75
	B56PP2Ap_pARPP21' = -R87+R88 : affects compound B56PP2Ap_pARPP21
	B72PP2A' = -R16-R18+R21+R33-R35+R85-R86 : affects compound B72PP2A
	B72PP2A_D32p34' = -R33+R35 : affects compound B72PP2A_D32p34
	B72PP2A_D32p75' = R18-R21 : affects compound B72PP2A_D32p75
	B72PP2A_pARPP21' = -R85+R86 : affects compound B72PP2A_pARPP21
	B72PP2A_Ca_D32p34' = -R32+R34 : affects compound B72PP2A_Ca_D32p34
	B72PP2A_Ca_D32p75' = R19-R22 : affects compound B72PP2A_Ca_D32p75
	B72PP2A_Ca' = R16-R19+R22+R32-R34+R83-R84 : affects compound B72PP2A_Ca
	B72PP2A_Ca_pARPP21' = -R83+R84 : affects compound B72PP2A_Ca_pARPP21
	CaM' = -R5-R6-R72-R79-R114-R122 : affects compound CaM
	CaM_Ca2' = R5-R24-R27-R71-R78-R113-R121 : affects compound CaM_Ca2
	CaM_Ca4' = -R7+R24-R70-R77-R82-R112-R120 : affects compound CaM_Ca4
	CaM_Ca4_pARPP21' = R82 : affects compound CaM_Ca4_pARPP21
	CaMKII' = -R70-R71-R72+R95+R119 : affects compound CaMKII
	CaMKII_CaM_Ca4' = R70+R73-R127-R130-R130+R131-R132 : affects compound CaMKII_CaM_Ca4
	CaMKII_CaM' = R72-R74-R125 : affects compound CaMKII_CaM
	CaMKII_CaM_Ca2' = R71-R73+R74-R126 : affects compound CaMKII_CaM_Ca2
	CaMKII_CaM_Ca2_psd' = -R104+R105+R121-R123+R124+R126 : affects compound CaMKII_CaM_Ca2_psd
	CaMKII_CaM_psd' = -R102+R103+R122-R124+R125 : affects compound CaMKII_CaM_psd
	CaMKII_CaM_Ca4_psd' = -R106+R107+R120+R123+R127-R134-R134+R135-R136 : affects compound CaMKII_CaM_Ca4_psd
	CaMKII_psd' = R118-R119-R120-R121-R122 : affects compound CaMKII_psd
	cAMP' = -R38-R39-R41-2*R43-R45+R55-R56+R57-R58+R59-R60+R61-R62-R69 : affects compound cAMP
	Substrate' = R92-R93-R96-R98-R100-R102-R104-R106 : affects compound Substrate
	CDK5' = -R13+R14 : affects compound CDK5
	CDK5_D32' = R13-R14 : affects compound CDK5_D32
	D1R' = -R3-R67 : affects compound D1R
	D1R_DA' = R1+R3-R68 : affects compound D1R_DA
	D1R_Golf_DA' = -R1+R2+R68 : affects compound D1R_Golf_DA
	D1R_Golf' = -R2+R67 : affects compound D1R_Golf
	D32p34' = R9-R12-R23-R34-R35 : affects compound D32p34
	D32p75' = R14-R15-R17-R18-R19-R30 : affects compound D32p75
	D32' = -R8-R13+R20+R21+R22+R31+R32+R33+R36 : affects compound D32
	GaolfGDP' = R0-R47+R63+R64+R65+R66 : affects compound GaolfGDP
	GaolfGTP' = -R0+R1-R4-R29-R52-R53 : affects compound GaolfGTP
	Gbgolf' = R1-R47 : affects compound Gbgolf
	Golf' = R47-R67-R68 : affects compound Golf
	pCaMKII' = -R77-R78-R79-R95-R111 : affects compound pCaMKII
	pCaMKII_CaM_Ca4' = R75+R77-R108+R131-R132+R133+R133 : affects compound pCaMKII_CaM_Ca4
	pCaMKII_CaM' = -R76+R79-R110 : affects compound pCaMKII_CaM
	pCaMKII_CaM_Ca2' = -R75+R76+R78-R109 : affects compound pCaMKII_CaM_Ca2
	pCaMKII_CaM_Ca2_psd' = -R98+R99+R109+R113+R115-R116 : affects compound pCaMKII_CaM_Ca2_psd
	pCaMKII_CaM_psd' = -R96+R97+R110+R114-R115 : affects compound pCaMKII_CaM_psd
	pCaMKII_CaM_Ca4_psd' = -R100+R101+R108+R112+R116+R135-R136+R137+R137 : affects compound pCaMKII_CaM_Ca4_psd
	pCaMKII_psd' = -R93+R94+R111-R112-R113-R114-R117 : affects compound pCaMKII_psd
	pSubstrate' = -R91+R94+R97+R99+R101+R103+R105+R107 : affects compound pSubstrate
	PDE4' = -R41+R42 : affects compound PDE4
	PDE4_cAMP' = R41-R42 : affects compound PDE4_cAMP
	PDE10r' = -R43+R44-R45 : affects compound PDE10r
	PDE10r_cAMP' = -R44+R45 : affects compound PDE10r_cAMP
	PDE10c' = R43+R46-R69 : affects compound PDE10c
	PDE10c_cAMP' = -R46+R69 : affects compound PDE10c_cAMP
	PKA' = -R38 : affects compound PKA
	PKAc' = -R8+R9-R10+R11-R15+R40-R80+R81 : affects compound PKAc
	PKAc_B56PP2A' = R10-R11 : affects compound PKAc_B56PP2A
	PKAc_D32' = R8-R9 : affects compound PKAc_D32
	PKAc_ARPP21' = R80-R81 : affects compound PKAc_ARPP21
	PKA_Ca2MP' = R38-R39 : affects compound PKA_Ca2MP
	PKA_Ca4MP' = R39-R40 : affects compound PKA_Ca4MP
	PKAc_D32p75' = R15 : affects compound PKAc_D32p75
	PKAreg' = R40 : affects compound PKAreg
	PP1' = -R12-R91+R92-R117+R118 : affects compound PP1
	PP1_pCaMKII_psd' = R117-R118 : affects compound PP1_pCaMKII_psd
	PP1_pSubstrate' = R91-R92 : affects compound PP1_pSubstrate
	PP1_D32p34' = R12 : affects compound PP1_D32p34
	CaMKII_CaM_Ca4_psd_CaMKII_CaM_Ca4_psd' = -R128+R134-R135 : affects compound CaMKII_CaM_Ca4_psd_CaMKII_CaM_Ca4_psd
	pCaMKII_CaM_Ca4_psd_CaMKII_CaM_Ca4_psd' = -R129+R136-R137 : affects compound pCaMKII_CaM_Ca4_psd_CaMKII_CaM_Ca4_psd
	CaMKII_CaM_Ca4_CaMKII_CaM_Ca4' = R128+R130-R131 : affects compound CaMKII_CaM_Ca4_CaMKII_CaM_Ca4
	pCaMKII_CaM_Ca4_CaMKII_CaM_Ca4' = R129+R132-R133 : affects compound pCaMKII_CaM_Ca4_CaMKII_CaM_Ca4
	PP2B' = -R6-R7-R27 : affects compound PP2B
	PP2Bc' = R7-R23+R26+R36 : affects compound PP2Bc
	PP2Bc_D32p34' = R23-R36 : affects compound PP2Bc_D32p34
	PP2B_CaM' = R6-R25 : affects compound PP2B_CaM
	PP2B_CaM_Ca2' = R25-R26+R27 : affects compound PP2B_CaM_Ca2
	pARPP21' = R81-R82-R84-R86-R88-R90 : affects compound pARPP21
	ARPP21' = -R80+R83+R85+R87+R89 : affects compound ARPP21
	pCaMKII_psd_Substrate' = R93-R94 : affects compound pCaMKII_psd_Substrate
	pCaMKII_CaM_psd_Substrate' = R96-R97 : affects compound pCaMKII_CaM_psd_Substrate
	pCaMKII_CaM_Ca2_psd_Substrate' = R98-R99 : affects compound pCaMKII_CaM_Ca2_psd_Substrate
	pCaMKII_CaM_Ca4_psd_Substrate' = R100-R101 : affects compound pCaMKII_CaM_Ca4_psd_Substrate
	CaMKII_CaM_psd_Substrate' = R102-R103 : affects compound CaMKII_CaM_psd_Substrate
	CaMKII_CaM_Ca2_psd_Substrate' = R104-R105 : affects compound CaMKII_CaM_Ca2_psd_Substrate
	CaMKII_CaM_Ca4_psd_Substrate' = R106-R107 : affects compound CaMKII_CaM_Ca4_psd_Substrate
}
PROCEDURE observables_func() {
	O1 = DA : Output ID O1
}
