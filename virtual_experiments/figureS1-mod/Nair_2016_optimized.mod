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
    USEION DA READ DAi VALENCE 0 : DA owned by RxD (reaction_diffusion_DA_only.json)
    USEION cal READ cali VALENCE 2 : cali maintained by caldyn_ms (use_rxd=0 in mod branch)
    USEION pSubstrate WRITE pSubstratei VALENCE 0 : read by synaptic plasticity mechs
    USEION PKAc WRITE PKAci VALENCE 0

}
CONSTANT {
	C0 = 34.979 (millisecond) : a constant
	C1 = 420 (millisecond) : a constant
	C2 = 2e-05 (millimole/liter) : a constant
	C3 = 6e-05 (millimole/liter) : a constant
}
PARAMETER {
	: Generator dropped Constants from Constant.tsv into a CONSTANT block (C0..C3)
	: but the EX2 expression references them by human-readable names. Restored here.
	: EX2 is assigned but never read elsewhere, so values are effectively dead.
	tau_DA1 = 34.979 (millisecond)
	tau_DA2 = 420 (millisecond)
	DA_basal = 2e-05 (millimole/liter)
	Ca_basal = 6e-05 (millimole/liter)
	DA_max = 0.0015 (millimole/liter)
	DA_start = 1000 (millisecond)
	kf_R0 = 0.0299985 (/millisecond): a kinetic parameter
	kf_R1 = 0.0150003 (/millisecond): a kinetic parameter
	kf_R2 = 50.0035 (liter/millimole-millisecond): a kinetic parameter
	kr_R2 = 0.25 (/millisecond): a kinetic parameter
	kf_R3 = 50.0035 (liter/millimole-millisecond): a kinetic parameter
	kr_R3 = 0.25 (/millisecond): a kinetic parameter
	kf_R4 = 10000 (liter/millimole-millisecond): a kinetic parameter
	kr_R4 = 0.001 (/millisecond): a kinetic parameter
	kf_R5 = 6.00067 (liter/millimole-millisecond): a kinetic parameter
	kr_R5 = 0.0199986 (/millisecond): a kinetic parameter
	kf_R6 = 100 (liter/millimole-millisecond): a kinetic parameter
	kr_R6 = 2.99999 (/millisecond): a kinetic parameter
	kf_R7 = 100 (liter/millimole-millisecond): a kinetic parameter
	kr_R7 = 2.99985e-06 (/millisecond): a kinetic parameter
	kf_R8 = 10 (liter/millimole-millisecond): a kinetic parameter
	kr_R8 = 0.2 (/millisecond): a kinetic parameter
	kf_R9 = 0.01 (/millisecond): a kinetic parameter
	kf_R10 = 1 (liter/millimole-millisecond): a kinetic parameter
	kr_R10 = 0.000299985 (/millisecond): a kinetic parameter
	kf_R11 = 0.000199986 (/millisecond): a kinetic parameter
	kf_R12 = 1000 (liter/millimole-millisecond): a kinetic parameter
	kr_R12 = 0.00150003 (/millisecond): a kinetic parameter
	kf_R13 = 1 (liter/millimole-millisecond): a kinetic parameter
	kr_R13 = 0.1 (/millisecond): a kinetic parameter
	kf_R14 = 0.01 (/millisecond): a kinetic parameter
	kf_R15 = 100 (liter/millimole-millisecond): a kinetic parameter
	kr_R15 = 0.1 (/millisecond): a kinetic parameter
	kf_R16 = 10 (liter/millimole-millisecond): a kinetic parameter
	kr_R16 = 0.01 (/millisecond): a kinetic parameter
	kf_R17 = 15.0003 (liter/millimole-millisecond): a kinetic parameter
	kr_R17 = 0.1 (/millisecond): a kinetic parameter
	kf_R18 = 8.00018 (liter/millimole-millisecond): a kinetic parameter
	kr_R18 = 0.1 (/millisecond): a kinetic parameter
	kf_R19 = 15.0003 (liter/millimole-millisecond): a kinetic parameter
	kr_R19 = 0.1 (/millisecond): a kinetic parameter
	kf_R20 = 0.00800018 (/millisecond): a kinetic parameter
	kf_R21 = 0.00150003 (/millisecond): a kinetic parameter
	kf_R22 = 0.00800018 (/millisecond): a kinetic parameter
	kf_R23 = 1299.87 (liter/millimole-millisecond): a kinetic parameter
	kr_R23 = 0.0001 (/millisecond): a kinetic parameter
	kf_R24 = 100 (liter/millimole-millisecond): a kinetic parameter
	kr_R24 = 1 (/millisecond): a kinetic parameter
	kf_R25 = 6.00067 (liter/millimole-millisecond): a kinetic parameter
	kr_R25 = 1.99986e-07 (/millisecond): a kinetic parameter
	kf_R26 = 100 (liter/millimole-millisecond): a kinetic parameter
	kr_R26 = 0.1 (/millisecond): a kinetic parameter
	kf_R27 = 100 (liter/millimole-millisecond): a kinetic parameter
	kr_R27 = 2.99985e-05 (/millisecond): a kinetic parameter
	kf_R28 = 1 (liter/millimole-millisecond): a kinetic parameter
	kr_R28 = 0.01 (/millisecond): a kinetic parameter
	kf_R29 = 10000 (liter/millimole-millisecond): a kinetic parameter
	kr_R29 = 0.001 (/millisecond): a kinetic parameter
	kf_R30 = 8.00018 (liter/millimole-millisecond): a kinetic parameter
	kr_R30 = 0.1 (/millisecond): a kinetic parameter
	kf_R31 = 0.00150003 (/millisecond): a kinetic parameter
	kf_R32 = 0.00299985 (/millisecond): a kinetic parameter
	kf_R33 = 0.00299985 (/millisecond): a kinetic parameter
	kf_R34 = 0.500035 (liter/millimole-millisecond): a kinetic parameter
	kr_R34 = 0.001 (/millisecond): a kinetic parameter
	kf_R35 = 0.500035 (liter/millimole-millisecond): a kinetic parameter
	kr_R35 = 0.001 (/millisecond): a kinetic parameter
	kf_R36 = 0.00120005 (/millisecond): a kinetic parameter
	kf_R37 = 8.00018e-06 (/millisecond): a kinetic parameter
	kf_R38 = 26.0016 (liter/millimole-millisecond): a kinetic parameter
	kr_R38 = 0.350002 (/millisecond): a kinetic parameter
	kf_R39 = 34.6019 (liter/millimole-millisecond): a kinetic parameter
	kr_R39 = 0.0500035 (/millisecond): a kinetic parameter
	kf_R40 = 0.0500035 (/millisecond): a kinetic parameter
	kr_R40 = 29.9985 (liter/millimole-millisecond): a kinetic parameter
	kf_R41 = 29.9985 (liter/millimole-millisecond): a kinetic parameter
	kr_R41 = 0.001 (/millisecond): a kinetic parameter
	kf_R42 = 0.00249977 (/millisecond): a kinetic parameter
	kf_R43 = 1e+03 (liter^2/millimole^2-millisecond): trimolecular, nM^-2 -> mM^-2 = *1e12
	kr_R43 = 0.001 (/millisecond): a kinetic parameter
	kf_R44 = 0.00299985 (/millisecond): a kinetic parameter
	kf_R45 = 100 (liter/millimole-millisecond): a kinetic parameter
	kr_R45 = 0.00199986 (/millisecond): a kinetic parameter
	kf_R46 = 0.01 (/millisecond): a kinetic parameter
	kf_R47 = 100000 (liter/millimole-millisecond): a kinetic parameter
	kf_R48 = 2.54976 (liter/millimole-millisecond): a kinetic parameter
	kr_R48 = 0.001 (/millisecond): a kinetic parameter
	kf_R49 = 0.1 (liter/millimole-millisecond): a kinetic parameter
	kr_R49 = 0.001 (/millisecond): a kinetic parameter
	kf_R50 = 0.0750067 (liter/millimole-millisecond): a kinetic parameter
	kr_R50 = 0.001 (/millisecond): a kinetic parameter
	kf_R51 = 1.29987 (liter/millimole-millisecond): a kinetic parameter
	kr_R51 = 0.001 (/millisecond): a kinetic parameter
	kf_R52 = 10000 (liter/millimole-millisecond): a kinetic parameter
	kr_R52 = 0.001 (/millisecond): a kinetic parameter
	kf_R53 = 10000 (liter/millimole-millisecond): a kinetic parameter
	kr_R53 = 0.001 (/millisecond): a kinetic parameter
	kf_R54 = 1 (liter/millimole-millisecond): a kinetic parameter
	kr_R54 = 0.01 (/millisecond): a kinetic parameter
	kf_R55 = 0.0500035 (/millisecond): a kinetic parameter
	kf_R56 = 2549.76 (liter/millimole-millisecond): a kinetic parameter
	kf_R57 = 0.001 (/millisecond): a kinetic parameter
	kf_R58 = 1.99986 (liter/millimole-millisecond): a kinetic parameter
	kf_R59 = 0.000500035 (/millisecond): a kinetic parameter
	kf_R60 = 0.750067 (liter/millimole-millisecond): a kinetic parameter
	kf_R61 = 0.0249977 (/millisecond): a kinetic parameter
	kf_R62 = 649.98 (liter/millimole-millisecond): a kinetic parameter
	kf_R63 = 0.001 (/millisecond): a kinetic parameter
	kf_R64 = 0.001 (/millisecond): a kinetic parameter
	kf_R65 = 0.001 (/millisecond): a kinetic parameter
	kf_R66 = 0.001 (/millisecond): a kinetic parameter
	kf_R67 = 60.0067 (liter/millimole-millisecond): a kinetic parameter
	kr_R67 = 0.25 (/millisecond): a kinetic parameter
	kf_R68 = 60.0067 (liter/millimole-millisecond): a kinetic parameter
	kr_R68 = 0.25 (/millisecond): a kinetic parameter
	kf_R69 = 100 (liter/millimole-millisecond): a kinetic parameter
	kr_R69 = 0.00199986 (/millisecond): a kinetic parameter
	kf_R70 = 100 (liter/millimole-millisecond): a kinetic parameter
	kr_R70 = 0.0400037 (/millisecond): a kinetic parameter
	kf_R71 = 100 (liter/millimole-millisecond): a kinetic parameter
	kr_R71 = 0.4 (/millisecond): a kinetic parameter
	kf_R72 = 100 (liter/millimole-millisecond): a kinetic parameter
	kr_R72 = 4 (/millisecond): a kinetic parameter
	kf_R73 = 100 (liter/millimole-millisecond): a kinetic parameter
	kr_R73 = 0.1 (/millisecond): a kinetic parameter
	kf_R74 = 6.00067 (liter/millimole-millisecond): a kinetic parameter
	kr_R74 = 0.00199986 (/millisecond): a kinetic parameter
	kf_R75 = 100 (liter/millimole-millisecond): a kinetic parameter
	kr_R75 = 0.01 (/millisecond): a kinetic parameter
	kf_R76 = 6.00067 (liter/millimole-millisecond): a kinetic parameter
	kr_R76 = 0.00199986 (/millisecond): a kinetic parameter
	kf_R77 = 100 (liter/millimole-millisecond): a kinetic parameter
	kr_R77 = 0.000400037 (/millisecond): a kinetic parameter
	kf_R78 = 100 (liter/millimole-millisecond): a kinetic parameter
	kr_R78 = 0.0400037 (/millisecond): a kinetic parameter
	kf_R79 = 100 (liter/millimole-millisecond): a kinetic parameter
	kr_R79 = 0.4 (/millisecond): a kinetic parameter
	kf_R80 = 44.9987 (liter/millimole-millisecond): a kinetic parameter
	kr_R80 = 0.2 (/millisecond): a kinetic parameter
	kf_R81 = 0.01 (/millisecond): a kinetic parameter
	kf_R82 = 500.035 (liter/millimole-millisecond): a kinetic parameter
	kr_R82 = 0.01 (/millisecond): a kinetic parameter
	kf_R83 = 0.01 (/millisecond): a kinetic parameter
	kf_R84 = 7.00003 (liter/millimole-millisecond): a kinetic parameter
	kr_R84 = 0.1 (/millisecond): a kinetic parameter
	kf_R85 = 0.001 (/millisecond): a kinetic parameter
	kf_R86 = 4.00037 (liter/millimole-millisecond): a kinetic parameter
	kr_R86 = 0.1 (/millisecond): a kinetic parameter
	kf_R87 = 0.01 (/millisecond): a kinetic parameter
	kf_R88 = 7.00003 (liter/millimole-millisecond): a kinetic parameter
	kr_R88 = 0.1 (/millisecond): a kinetic parameter
	kf_R89 = 0.001 (/millisecond): a kinetic parameter
	kf_R90 = 4.00037 (liter/millimole-millisecond): a kinetic parameter
	kr_R90 = 0.1 (/millisecond): a kinetic parameter
	kf_R91 = 0.500035 (liter/millimole-millisecond): a kinetic parameter
	kr_R91 = 0.001 (/millisecond): a kinetic parameter
	kf_R92 = 0.01 (/millisecond): a kinetic parameter
	kf_R93 = 0.500035 (liter/millimole-millisecond): a kinetic parameter
	kr_R93 = 0.01 (/millisecond): a kinetic parameter
	kf_R94 = 0.01 (/millisecond): a kinetic parameter
	kf_R95 = 0.0001 (/millisecond): a kinetic parameter
	kf_R96 = 0.500035 (liter/millimole-millisecond): a kinetic parameter
	kr_R96 = 0.01 (/millisecond): a kinetic parameter
	kf_R97 = 0.01 (/millisecond): a kinetic parameter
	kf_R98 = 0.500035 (liter/millimole-millisecond): a kinetic parameter
	kr_R98 = 0.01 (/millisecond): a kinetic parameter
	kf_R99 = 0.01 (/millisecond): a kinetic parameter
	kf_R100 = 0.500035 (liter/millimole-millisecond): a kinetic parameter
	kr_R100 = 0.01 (/millisecond): a kinetic parameter
	kf_R101 = 0.01 (/millisecond): a kinetic parameter
	kf_R102 = 0.500035 (liter/millimole-millisecond): a kinetic parameter
	kr_R102 = 0.01 (/millisecond): a kinetic parameter
	kf_R103 = 0.01 (/millisecond): a kinetic parameter
	kf_R104 = 0.500035 (liter/millimole-millisecond): a kinetic parameter
	kr_R104 = 0.01 (/millisecond): a kinetic parameter
	kf_R105 = 0.01 (/millisecond): a kinetic parameter
	kf_R106 = 0.500035 (liter/millimole-millisecond): a kinetic parameter
	kr_R106 = 0.01 (/millisecond): a kinetic parameter
	kf_R107 = 0.01 (/millisecond): a kinetic parameter
	kf_R108 = 0.000500035 (/millisecond): a kinetic parameter
	kr_R108 = 1e-06 (/millisecond): a kinetic parameter
	kf_R109 = 0.000500035 (/millisecond): a kinetic parameter
	kr_R109 = 1e-06 (/millisecond): a kinetic parameter
	kf_R110 = 0.000500035 (/millisecond): a kinetic parameter
	kr_R110 = 1e-06 (/millisecond): a kinetic parameter
	kf_R111 = 0.000500035 (/millisecond): a kinetic parameter
	kr_R111 = 1e-06 (/millisecond): a kinetic parameter
	kf_R112 = 100 (liter/millimole-millisecond): a kinetic parameter
	kr_R112 = 0.000400037 (/millisecond): a kinetic parameter
	kf_R113 = 100 (liter/millimole-millisecond): a kinetic parameter
	kr_R113 = 0.0400037 (/millisecond): a kinetic parameter
	kf_R114 = 100 (liter/millimole-millisecond): a kinetic parameter
	kr_R114 = 0.4 (/millisecond): a kinetic parameter
	kf_R115 = 6.00067 (liter/millimole-millisecond): a kinetic parameter
	kr_R115 = 0.00199986 (/millisecond): a kinetic parameter
	kf_R116 = 100 (liter/millimole-millisecond): a kinetic parameter
	kr_R116 = 0.01 (/millisecond): a kinetic parameter
	kf_R117 = 0.800018 (liter/millimole-millisecond): a kinetic parameter
	kr_R117 = 0.001 (/millisecond): a kinetic parameter
	kf_R118 = 0.001 (/millisecond): a kinetic parameter
	kf_R119 = 0.000500035 (/millisecond): a kinetic parameter
	kf_R120 = 100 (liter/millimole-millisecond): a kinetic parameter
	kr_R120 = 0.0400037 (/millisecond): a kinetic parameter
	kf_R121 = 100 (liter/millimole-millisecond): a kinetic parameter
	kr_R121 = 0.4 (/millisecond): a kinetic parameter
	kf_R122 = 100 (liter/millimole-millisecond): a kinetic parameter
	kr_R122 = 4 (/millisecond): a kinetic parameter
	kf_R123 = 100 (liter/millimole-millisecond): a kinetic parameter
	kr_R123 = 0.1 (/millisecond): a kinetic parameter
	kf_R124 = 6.00067 (liter/millimole-millisecond): a kinetic parameter
	kr_R124 = 0.00199986 (/millisecond): a kinetic parameter
	kf_R125 = 0.000500035 (/millisecond): a kinetic parameter
	kr_R125 = 0.000500035 (/millisecond): a kinetic parameter
	kf_R126 = 0.000500035 (/millisecond): a kinetic parameter
	kr_R126 = 0.000500035 (/millisecond): a kinetic parameter
	kf_R127 = 0.000500035 (/millisecond): a kinetic parameter
	kr_R127 = 0.000500035 (/millisecond): a kinetic parameter
	kf_R128 = 0.000500035 (/millisecond): a kinetic parameter
	kr_R128 = 0.000500035 (/millisecond): a kinetic parameter
	kf_R129 = 1e-06 (/millisecond): a kinetic parameter
	kr_R129 = 0.000500035 (/millisecond): a kinetic parameter
	kf_R130 = 0.359998 (liter/millimole-millisecond): a kinetic parameter
	kr_R130 = 0.0229985 (/millisecond): a kinetic parameter
	kf_R131 = 0.00390032 (/millisecond): a kinetic parameter
	kf_R132 = 1.10002 (liter/millimole-millisecond): a kinetic parameter
	kr_R132 = 0.00540008 (/millisecond): a kinetic parameter
	kf_R133 = 10 (/millisecond): a kinetic parameter
	kf_R134 = 0.359998 (liter/millimole-millisecond): a kinetic parameter
	kr_R134 = 0.0229985 (/millisecond): a kinetic parameter
	kf_R135 = 0.00390032 (/millisecond): a kinetic parameter
	kf_R136 = 1.10002 (liter/millimole-millisecond): a kinetic parameter
	kr_R136 = 0.00540008 (/millisecond): a kinetic parameter
	kf_R137 = 10 (/millisecond): a kinetic parameter
}
ASSIGNED {
	: USEION-read variables (inputs).
	DAi (millimole/liter)
	cali (millimole/liter)
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
	AMP = 0: assignment for expression AMP
	ATP = 5: assignment for expression ATP
	Ca = cali : cytosolic Ca from caldyn_ms (mM)
	DA = DAi : cascade species are all in mM
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
	: PKAci and pSubstratei must be STATE (not ASSIGNED) for NMODL to accept USEION WRITE.
	: Copies of internal PKAc/pSubstrate states, driven by BREAKPOINT assignment, no derivative.
	PKAci (millimole/liter)
	pSubstratei (millimole/liter)
	AC5 (millimole/liter) : a state variable
	AC5_ATP (millimole/liter) : a state variable
	AC5_Ca (millimole/liter) : a state variable
	AC5_Ca_ATP (millimole/liter) : a state variable
	AC5_Ca_GaolfGTP (millimole/liter) : a state variable
	AC5_Ca_GaolfGTP_ATP (millimole/liter) : a state variable
	AC5_GaolfGTP (millimole/liter) : a state variable
	AC5_GaolfGTP_ATP (millimole/liter) : a state variable
	B56PP2A (millimole/liter) : a state variable
	B56PP2A_D32p75 (millimole/liter) : a state variable
	B56PP2A_pARPP21 (millimole/liter) : a state variable
	B56PP2Ap (millimole/liter) : a state variable
	B56PP2Ap_D32p75 (millimole/liter) : a state variable
	B56PP2Ap_pARPP21 (millimole/liter) : a state variable
	B72PP2A (millimole/liter) : a state variable
	B72PP2A_D32p34 (millimole/liter) : a state variable
	B72PP2A_D32p75 (millimole/liter) : a state variable
	B72PP2A_pARPP21 (millimole/liter) : a state variable
	B72PP2A_Ca_D32p34 (millimole/liter) : a state variable
	B72PP2A_Ca_D32p75 (millimole/liter) : a state variable
	B72PP2A_Ca (millimole/liter) : a state variable
	B72PP2A_Ca_pARPP21 (millimole/liter) : a state variable
	CaM (millimole/liter) : a state variable
	CaM_Ca2 (millimole/liter) : a state variable
	CaM_Ca4 (millimole/liter) : a state variable
	CaM_Ca4_pARPP21 (millimole/liter) : a state variable
	CaMKII (millimole/liter) : a state variable
	CaMKII_CaM_Ca4 (millimole/liter) : a state variable
	CaMKII_CaM (millimole/liter) : a state variable
	CaMKII_CaM_Ca2 (millimole/liter) : a state variable
	CaMKII_CaM_Ca2_psd (millimole/liter) : a state variable
	CaMKII_CaM_psd (millimole/liter) : a state variable
	CaMKII_CaM_Ca4_psd (millimole/liter) : a state variable
	CaMKII_psd (millimole/liter) : a state variable
	cAMP (millimole/liter) : a state variable
	Substrate (millimole/liter) : a state variable
	CDK5 (millimole/liter) : a state variable
	CDK5_D32 (millimole/liter) : a state variable
	D1R (millimole/liter) : a state variable
	D1R_DA (millimole/liter) : a state variable
	D1R_Golf_DA (millimole/liter) : a state variable
	D1R_Golf (millimole/liter) : a state variable
	D32p34 (millimole/liter) : a state variable
	D32p75 (millimole/liter) : a state variable
	D32 (millimole/liter) : a state variable
	GaolfGDP (millimole/liter) : a state variable
	GaolfGTP (millimole/liter) : a state variable
	Gbgolf (millimole/liter) : a state variable
	Golf (millimole/liter) : a state variable
	pCaMKII (millimole/liter) : a state variable
	pCaMKII_CaM_Ca4 (millimole/liter) : a state variable
	pCaMKII_CaM (millimole/liter) : a state variable
	pCaMKII_CaM_Ca2 (millimole/liter) : a state variable
	pCaMKII_CaM_Ca2_psd (millimole/liter) : a state variable
	pCaMKII_CaM_psd (millimole/liter) : a state variable
	pCaMKII_CaM_Ca4_psd (millimole/liter) : a state variable
	pCaMKII_psd (millimole/liter) : a state variable
	pSubstrate (millimole/liter) : a state variable
	PDE4 (millimole/liter) : a state variable
	PDE4_cAMP (millimole/liter) : a state variable
	PDE10r (millimole/liter) : a state variable
	PDE10r_cAMP (millimole/liter) : a state variable
	PDE10c (millimole/liter) : a state variable
	PDE10c_cAMP (millimole/liter) : a state variable
	PKA (millimole/liter) : a state variable
	PKAc (millimole/liter) : a state variable
	PKAc_B56PP2A (millimole/liter) : a state variable
	PKAc_D32 (millimole/liter) : a state variable
	PKAc_ARPP21 (millimole/liter) : a state variable
	PKA_Ca2MP (millimole/liter) : a state variable
	PKA_Ca4MP (millimole/liter) : a state variable
	PKAc_D32p75 (millimole/liter) : a state variable
	PKAreg (millimole/liter) : a state variable
	PP1 (millimole/liter) : a state variable
	PP1_pCaMKII_psd (millimole/liter) : a state variable
	PP1_pSubstrate (millimole/liter) : a state variable
	PP1_D32p34 (millimole/liter) : a state variable
	CaMKII_CaM_Ca4_psd_CaMKII_CaM_Ca4_psd (millimole/liter) : a state variable
	pCaMKII_CaM_Ca4_psd_CaMKII_CaM_Ca4_psd (millimole/liter) : a state variable
	CaMKII_CaM_Ca4_CaMKII_CaM_Ca4 (millimole/liter) : a state variable
	pCaMKII_CaM_Ca4_CaMKII_CaM_Ca4 (millimole/liter) : a state variable
	PP2B (millimole/liter) : a state variable
	PP2Bc (millimole/liter) : a state variable
	PP2Bc_D32p34 (millimole/liter) : a state variable
	PP2B_CaM (millimole/liter) : a state variable
	PP2B_CaM_Ca2 (millimole/liter) : a state variable
	pARPP21 (millimole/liter) : a state variable
	ARPP21 (millimole/liter) : a state variable
	pCaMKII_psd_Substrate (millimole/liter) : a state variable
	pCaMKII_CaM_psd_Substrate (millimole/liter) : a state variable
	pCaMKII_CaM_Ca2_psd_Substrate (millimole/liter) : a state variable
	pCaMKII_CaM_Ca4_psd_Substrate (millimole/liter) : a state variable
	CaMKII_CaM_psd_Substrate (millimole/liter) : a state variable
	CaMKII_CaM_Ca2_psd_Substrate (millimole/liter) : a state variable
	CaMKII_CaM_Ca4_psd_Substrate (millimole/liter) : a state variable
}
INITIAL {
	 PKAci = 0 : initialized to match PKAc state
	 pSubstratei = 0 : initialized to match pSubstrate state
	 AC5 = 2.65353e-06 : initial condition
	 AC5_ATP = 0.000663484 : initial condition
	 AC5_Ca = 1.59223e-08 : initial condition
	 AC5_Ca_ATP = 3.9809e-06 : initial condition
	 AC5_Ca_GaolfGTP = 7.06997e-10 : initial condition
	 AC5_Ca_GaolfGTP_ATP = 1.77421e-07 : initial condition
	 AC5_GaolfGTP = 1.1739e-07 : initial condition
	 AC5_GaolfGTP_ATP = 2.95706e-05 : initial condition
	 B56PP2A = 0.000885087 : initial condition
	 B56PP2A_D32p75 = 0.00101736 : initial condition
	 B56PP2A_pARPP21 = 3.16136e-05 : initial condition
	 B56PP2Ap = 1.99651e-05 : initial condition
	 B56PP2Ap_D32p75 = 4.04348e-05 : initial condition
	 B56PP2Ap_pARPP21 = 1.14572e-06 : initial condition
	 B72PP2A = 0.000843825 : initial condition
	 B72PP2A_D32p34 = 1.5035e-08 : initial condition
	 B72PP2A_D32p75 = 0.000969929 : initial condition
	 B72PP2A_pARPP21 = 3.01397e-05 : initial condition
	 B72PP2A_Ca_D32p34 = 9.02132e-10 : initial condition
	 B72PP2A_Ca_D32p75 = 0.000102554 : initial condition
	 B72PP2A_Ca = 5.06314e-05 : initial condition
	 B72PP2A_Ca_pARPP21 = 2.90585e-06 : initial condition
	 CaM = 0.00319807 : initial condition
	 CaM_Ca2 = 5.75657e-05 : initial condition
	 CaM_Ca4 = 3.45401e-07 : initial condition
	 CaM_Ca4_pARPP21 = 1.55771e-05 : initial condition
	 CaMKII = 0.0167932 : initial condition
	 CaMKII_CaM_Ca4 = 1.44416e-05 : initial condition
	 CaMKII_CaM = 0.00134249 : initial condition
	 CaMKII_CaM_Ca2 = 0.000241394 : initial condition
	 CaMKII_CaM_Ca2_psd = 2.12806e-05 : initial condition
	 CaMKII_CaM_psd = 0.000116798 : initial condition
	 CaMKII_CaM_Ca4_psd = 1.31885e-06 : initial condition
	 CaMKII_psd = 0.00145894 : initial condition
	 cAMP = 3.80199e-05 : initial condition
	 Substrate = 0.00289841 : initial condition
	 CDK5 = 0.00138905 : initial condition
	 CDK5_D32 = 0.000410952 : initial condition
	 D1R = 0.001477 : initial condition
	 D1R_DA = 5.95923e-06 : initial condition
	 D1R_Golf_DA = 2.0089e-06 : initial condition
	 D1R_Golf = 0.000515033 : initial condition
	 D32p34 = 1.42595e-07 : initial condition
	 D32p75 = 0.0145835 : initial condition
	 D32 = 0.0325438 : initial condition
	 GaolfGDP = 1.00831e-08 : initial condition
	 GaolfGTP = 8.91348e-09 : initial condition
	 Gbgolf = 2.98851e-05 : initial condition
	 Golf = 0.00145307 : initial condition
	 pCaMKII = 9.06915e-09 : initial condition
	 pCaMKII_CaM_Ca4 = 1.84384e-09 : initial condition
	 pCaMKII_CaM = 7.24293e-09 : initial condition
	 pCaMKII_CaM_Ca2 = 1.5104e-09 : initial condition
	 pCaMKII_CaM_Ca2_psd = 1.37595e-09 : initial condition
	 pCaMKII_CaM_psd = 7.40117e-09 : initial condition
	 pCaMKII_CaM_Ca4_psd = 9.40534e-10 : initial condition
	 pCaMKII_psd = 9.24549e-09 : initial condition
	 pSubstrate = 8.13893e-05 : initial condition
	 PDE4 = 0.00150843 : initial condition
	 PDE4_cAMP = 0.000491573 : initial condition
	 PDE10r = 0.000397208 : initial condition
	 PDE10r_cAMP = 0.000302036 : initial condition
	 PDE10c = 5.74168e-07 : initial condition
	 PDE10c_cAMP = 1.81915e-07 : initial condition
	 PKA = 0.00113961 : initial condition
	 PKAc = 2.48479e-06 : initial condition
	 PKAc_B56PP2A = 4.39347e-06 : initial condition
	 PKAc_D32 = 3.85067e-06 : initial condition
	 PKAc_ARPP21 = 1.01202e-05 : initial condition
	 PKA_Ca2MP = 3.21867e-06 : initial condition
	 PKA_Ca4MP = 8.48953e-08 : initial condition
	 PKAc_D32p75 = 3.62372e-05 : initial condition
	 PKAreg = 5.70862e-05 : initial condition
	 PP1 = 0.00273047 : initial condition
	 PP1_pCaMKII_psd = 1.00978e-08 : initial condition
	 PP1_pSubstrate = 1.01014e-05 : initial condition
	 PP1_D32p34 = 0.000259415 : initial condition
	 CaMKII_CaM_Ca4_psd_CaMKII_CaM_Ca4_psd = 7.2881e-11 : initial condition
	 pCaMKII_CaM_Ca4_psd_CaMKII_CaM_Ca4_psd = 1.3652e-16 : initial condition
	 CaMKII_CaM_Ca4_CaMKII_CaM_Ca4 = 2.74153e-09 : initial condition
	 pCaMKII_CaM_Ca4_CaMKII_CaM_Ca4 = 2.92735e-15 : initial condition
	 PP2B = 1.94038e-05 : initial condition
	 PP2Bc = 0.000223398 : initial condition
	 PP2Bc_D32p34 = 3.18317e-05 : initial condition
	 PP2B_CaM = 2.06848e-06 : initial condition
	 PP2B_CaM_Ca2 = 0.0037233 : initial condition
	 pARPP21 = 0.000901873 : initial condition
	 ARPP21 = 0.0190066 : initial condition
	 pCaMKII_psd_Substrate = 6.69927e-10 : initial condition
	 pCaMKII_CaM_psd_Substrate = 5.36288e-10 : initial condition
	 pCaMKII_CaM_Ca2_psd_Substrate = 9.97014e-11 : initial condition
	 pCaMKII_CaM_Ca4_psd_Substrate = 6.8151e-11 : initial condition
	 CaMKII_CaM_psd_Substrate = 8.46322e-06 : initial condition
	 CaMKII_CaM_Ca2_psd_Substrate = 1.542e-06 : initial condition
	 CaMKII_CaM_Ca4_psd_Substrate = 9.55643e-08 : initial condition
}
BREAKPOINT {
	SOLVE ode METHOD euler
	assign_calculated_values() : procedure
	PKAci = PKAc
	pSubstratei = pSubstrate
}
DERIVATIVE ode {
	PKAci' = 0 : driven by BREAKPOINT assignment, not integrated
	pSubstratei' = 0 : driven by BREAKPOINT assignment, not integrated
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
