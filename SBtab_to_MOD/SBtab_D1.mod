TITLE SBtab_D1

COMMENT
	automatically generated from separate SBtab TSV files
	date: Mon Jun 29 13:44:45 2026
ENDCOMMENT

NEURON {
	SUFFIX SBtab_D1
	RANGE EX0, EX1, EX2, S8_st, S9_st, S24_st, S48_st : assigned
	RANGE S0_st : compound
	RANGE S1_st : compound
	RANGE S2_st : compound
	RANGE S3_st : compound
	RANGE S4_st : compound
	RANGE S5_st : compound
	RANGE S6_st : compound
	RANGE S7_st : compound
	RANGE S10_st : compound
	RANGE S11_st : compound
	RANGE S12_st : compound
	RANGE S13_st : compound
	RANGE S14_st : compound
	RANGE S15_st : compound
	RANGE S16_st : compound
	RANGE S17_st : compound
	RANGE S18_st : compound
	RANGE S19_st : compound
	RANGE S20_st : compound
	RANGE S21_st : compound
	RANGE S22_st : compound
	RANGE S23_st : compound
	RANGE S25_st : compound
	RANGE S26_st : compound
	RANGE S27_st : compound
	RANGE S28_st : compound
	RANGE S29_st : compound
	RANGE S30_st : compound
	RANGE S31_st : compound
	RANGE S32_st : compound
	RANGE S33_st : compound
	RANGE S34_st : compound
	RANGE S35_st : compound
	RANGE S36_st : compound
	RANGE S37_st : compound
	RANGE S38_st : compound
	RANGE S39_st : compound
	RANGE S40_st : compound
	RANGE S41_st : compound
	RANGE S42_st : compound
	RANGE S43_st : compound
	RANGE S44_st : compound
	RANGE S45_st : compound
	RANGE S46_st : compound
	RANGE S47_st : compound
	RANGE S49_st : compound
	RANGE S50_st : compound
	RANGE S51_st : compound
	RANGE S52_st : compound
	RANGE S53_st : compound
	RANGE S54_st : compound
	RANGE S55_st : compound
	RANGE S56_st : compound
	RANGE S57_st : compound
	RANGE S58_st : compound
	RANGE S59_st : compound
	RANGE S60_st : compound
	RANGE S61_st : compound
	RANGE S62_st : compound
	RANGE S63_st : compound
	RANGE S64_st : compound
	RANGE S65_st : compound
	RANGE S66_st : compound
	RANGE S67_st : compound
	RANGE S68_st : compound
	RANGE S69_st : compound
	RANGE S70_st : compound
	RANGE S71_st : compound
	RANGE S72_st : compound
	RANGE S73_st : compound
	RANGE S74_st : compound
	RANGE S75_st : compound
	RANGE S76_st : compound
	RANGE S77_st : compound
	RANGE S78_st : compound
	RANGE S79_st : compound
	RANGE S80_st : compound
	RANGE S81_st : compound
	RANGE S82_st : compound
	RANGE S83_st : compound
	RANGE S84_st : compound
	RANGE S85_st : compound
	RANGE S86_st : compound
	RANGE S87_st : compound
	RANGE S88_st : compound
	RANGE S89_st : compound
	RANGE S90_st : compound
	RANGE S91_st : compound
	RANGE S92_st : compound
	RANGE S93_st : compound
	RANGE S94_st : compound
	RANGE S95_st : compound
	RANGE S96_st : compound
	RANGE S97_st : compound
	RANGE S98_st : compound
	USEION pSubstrate  WRITE pSubstratei VALENCE 0
	USEION PKAc  WRITE PKAci VALENCE 0
	POINTER ca_ref
	POINTER da_ref
}

CONSTANT {
	C0 = 34.979 (millisecond) : a constant (C0)
	C1 = 420.0 (millisecond) : a constant (C1)
	C2 = 20.0 (nanomole/liter) : a constant (C2)
	C3 = 60.0 (nanomole/liter) : a constant (C3)
}

PARAMETER {
	K0 = 1.0 (/millisecond): does not appear in reactions. (K0)
	K1 = 1.0 (/millisecond): does not appear in reactions. (K1)
	K2 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K2)
	K3 = 1.0 (/millisecond): does not appear in reactions. (K3)
	K4 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K4)
	K5 = 1.0 (/millisecond): does not appear in reactions. (K5)
	K6 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K6)
	K7 = 1.0 (/millisecond): does not appear in reactions. (K7)
	K8 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K8)
	K9 = 1.0 (/millisecond): does not appear in reactions. (K9)
	K10 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K10)
	K11 = 1.0 (/millisecond): does not appear in reactions. (K11)
	K12 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K12)
	K13 = 1.0 (/millisecond): does not appear in reactions. (K13)
	K14 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K14)
	K15 = 1.0 (/millisecond): does not appear in reactions. (K15)
	K16 = 1.0 (/millisecond): does not appear in reactions. (K16)
	K17 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K17)
	K18 = 1.0 (/millisecond): does not appear in reactions. (K18)
	K19 = 1.0 (/millisecond): does not appear in reactions. (K19)
	K20 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K20)
	K21 = 1.0 (/millisecond): does not appear in reactions. (K21)
	K22 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K22)
	K23 = 1.0 (/millisecond): does not appear in reactions. (K23)
	K24 = 1.0 (/millisecond): does not appear in reactions. (K24)
	K25 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K25)
	K26 = 1.0 (/millisecond): does not appear in reactions. (K26)
	K27 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K27)
	K28 = 1.0 (/millisecond): does not appear in reactions. (K28)
	K29 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K29)
	K30 = 1.0 (/millisecond): does not appear in reactions. (K30)
	K31 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K31)
	K32 = 1.0 (/millisecond): does not appear in reactions. (K32)
	K33 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K33)
	K34 = 1.0 (/millisecond): does not appear in reactions. (K34)
	K35 = 1.0 (/millisecond): does not appear in reactions. (K35)
	K36 = 1.0 (/millisecond): does not appear in reactions. (K36)
	K37 = 1.0 (/millisecond): does not appear in reactions. (K37)
	K38 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K38)
	K39 = 1.0 (/millisecond): does not appear in reactions. (K39)
	K40 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K40)
	K41 = 1.0 (/millisecond): does not appear in reactions. (K41)
	K42 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K42)
	K43 = 1.0 (/millisecond): does not appear in reactions. (K43)
	K44 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K44)
	K45 = 1.0 (/millisecond): does not appear in reactions. (K45)
	K46 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K46)
	K47 = 1.0 (/millisecond): does not appear in reactions. (K47)
	K48 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K48)
	K49 = 1.0 (/millisecond): does not appear in reactions. (K49)
	K50 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K50)
	K51 = 1.0 (/millisecond): does not appear in reactions. (K51)
	K52 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K52)
	K53 = 1.0 (/millisecond): does not appear in reactions. (K53)
	K54 = 1.0 (/millisecond): does not appear in reactions. (K54)
	K55 = 1.0 (/millisecond): does not appear in reactions. (K55)
	K56 = 1.0 (/millisecond): does not appear in reactions. (K56)
	K57 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K57)
	K58 = 1.0 (/millisecond): does not appear in reactions. (K58)
	K59 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K59)
	K60 = 1.0 (/millisecond): does not appear in reactions. (K60)
	K61 = 1.0 (/millisecond): does not appear in reactions. (K61)
	K62 = 1.0 (/millisecond): does not appear in reactions. (K62)
	K63 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K63)
	K64 = 1.0 (/millisecond): does not appear in reactions. (K64)
	K65 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K65)
	K66 = 1.0 (/millisecond): does not appear in reactions. (K66)
	K67 = 1.0 (/millisecond): does not appear in reactions. (K67)
	K68 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K68)
	K69 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K69)
	K70 = 1.0 (/millisecond): does not appear in reactions. (K70)
	K71 = 1.0 (/millisecond): does not appear in reactions. (K71)
	K72 = 1.0 (liter^2/nanomole^2-millisecond): does not appear in reactions. (K72)
	K73 = 1.0 (/millisecond): does not appear in reactions. (K73)
	K74 = 1.0 (/millisecond): does not appear in reactions. (K74)
	K75 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K75)
	K76 = 1.0 (/millisecond): does not appear in reactions. (K76)
	K77 = 1.0 (/millisecond): does not appear in reactions. (K77)
	K78 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K78)
	K79 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K79)
	K80 = 1.0 (/millisecond): does not appear in reactions. (K80)
	K81 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K81)
	K82 = 1.0 (/millisecond): does not appear in reactions. (K82)
	K83 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K83)
	K84 = 1.0 (/millisecond): does not appear in reactions. (K84)
	K85 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K85)
	K86 = 1.0 (/millisecond): does not appear in reactions. (K86)
	K87 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K87)
	K88 = 1.0 (/millisecond): does not appear in reactions. (K88)
	K89 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K89)
	K90 = 1.0 (/millisecond): does not appear in reactions. (K90)
	K91 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K91)
	K92 = 1.0 (/millisecond): does not appear in reactions. (K92)
	K93 = 1.0 (/millisecond): does not appear in reactions. (K93)
	K94 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K94)
	K95 = 1.0 (/millisecond): does not appear in reactions. (K95)
	K96 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K96)
	K97 = 1.0 (/millisecond): does not appear in reactions. (K97)
	K98 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K98)
	K99 = 1.0 (/millisecond): does not appear in reactions. (K99)
	K100 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K100)
	K101 = 1.0 (/millisecond): does not appear in reactions. (K101)
	K102 = 1.0 (/millisecond): does not appear in reactions. (K102)
	K103 = 1.0 (/millisecond): does not appear in reactions. (K103)
	K104 = 1.0 (/millisecond): does not appear in reactions. (K104)
	K105 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K105)
	K106 = 1.0 (/millisecond): does not appear in reactions. (K106)
	K107 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K107)
	K108 = 1.0 (/millisecond): does not appear in reactions. (K108)
	K109 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K109)
	K110 = 1.0 (/millisecond): does not appear in reactions. (K110)
	K111 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K111)
	K112 = 1.0 (/millisecond): does not appear in reactions. (K112)
	K113 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K113)
	K114 = 1.0 (/millisecond): does not appear in reactions. (K114)
	K115 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K115)
	K116 = 1.0 (/millisecond): does not appear in reactions. (K116)
	K117 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K117)
	K118 = 1.0 (/millisecond): does not appear in reactions. (K118)
	K119 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K119)
	K120 = 1.0 (/millisecond): does not appear in reactions. (K120)
	K121 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K121)
	K122 = 1.0 (/millisecond): does not appear in reactions. (K122)
	K123 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K123)
	K124 = 1.0 (/millisecond): does not appear in reactions. (K124)
	K125 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K125)
	K126 = 1.0 (/millisecond): does not appear in reactions. (K126)
	K127 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K127)
	K128 = 1.0 (/millisecond): does not appear in reactions. (K128)
	K129 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K129)
	K130 = 1.0 (/millisecond): does not appear in reactions. (K130)
	K131 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K131)
	K132 = 1.0 (/millisecond): does not appear in reactions. (K132)
	K133 = 1.0 (/millisecond): does not appear in reactions. (K133)
	K134 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K134)
	K135 = 1.0 (/millisecond): does not appear in reactions. (K135)
	K136 = 1.0 (/millisecond): does not appear in reactions. (K136)
	K137 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K137)
	K138 = 1.0 (/millisecond): does not appear in reactions. (K138)
	K139 = 1.0 (/millisecond): does not appear in reactions. (K139)
	K140 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K140)
	K141 = 1.0 (/millisecond): does not appear in reactions. (K141)
	K142 = 1.0 (/millisecond): does not appear in reactions. (K142)
	K143 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K143)
	K144 = 1.0 (/millisecond): does not appear in reactions. (K144)
	K145 = 1.0 (/millisecond): does not appear in reactions. (K145)
	K146 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K146)
	K147 = 1.0 (/millisecond): does not appear in reactions. (K147)
	K148 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K148)
	K149 = 1.0 (/millisecond): does not appear in reactions. (K149)
	K150 = 1.0 (/millisecond): does not appear in reactions. (K150)
	K151 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K151)
	K152 = 1.0 (/millisecond): does not appear in reactions. (K152)
	K153 = 1.0 (/millisecond): does not appear in reactions. (K153)
	K154 = 1.0 (/millisecond): does not appear in reactions. (K154)
	K155 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K155)
	K156 = 1.0 (/millisecond): does not appear in reactions. (K156)
	K157 = 1.0 (/millisecond): does not appear in reactions. (K157)
	K158 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K158)
	K159 = 1.0 (/millisecond): does not appear in reactions. (K159)
	K160 = 1.0 (/millisecond): does not appear in reactions. (K160)
	K161 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K161)
	K162 = 1.0 (/millisecond): does not appear in reactions. (K162)
	K163 = 1.0 (/millisecond): does not appear in reactions. (K163)
	K164 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K164)
	K165 = 1.0 (/millisecond): does not appear in reactions. (K165)
	K166 = 1.0 (/millisecond): does not appear in reactions. (K166)
	K167 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K167)
	K168 = 1.0 (/millisecond): does not appear in reactions. (K168)
	K169 = 1.0 (/millisecond): does not appear in reactions. (K169)
	K170 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K170)
	K171 = 1.0 (/millisecond): does not appear in reactions. (K171)
	K172 = 1.0 (/millisecond): does not appear in reactions. (K172)
	K173 = 1.0 (/millisecond): does not appear in reactions. (K173)
	K174 = 1.0 (/millisecond): does not appear in reactions. (K174)
	K175 = 1.0 (/millisecond): does not appear in reactions. (K175)
	K176 = 1.0 (/millisecond): does not appear in reactions. (K176)
	K177 = 1.0 (/millisecond): does not appear in reactions. (K177)
	K178 = 1.0 (/millisecond): does not appear in reactions. (K178)
	K179 = 1.0 (/millisecond): does not appear in reactions. (K179)
	K180 = 1.0 (/millisecond): does not appear in reactions. (K180)
	K181 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K181)
	K182 = 1.0 (/millisecond): does not appear in reactions. (K182)
	K183 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K183)
	K184 = 1.0 (/millisecond): does not appear in reactions. (K184)
	K185 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K185)
	K186 = 1.0 (/millisecond): does not appear in reactions. (K186)
	K187 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K187)
	K188 = 1.0 (/millisecond): does not appear in reactions. (K188)
	K189 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K189)
	K190 = 1.0 (/millisecond): does not appear in reactions. (K190)
	K191 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K191)
	K192 = 1.0 (/millisecond): does not appear in reactions. (K192)
	K193 = 1.0 (/millisecond): does not appear in reactions. (K193)
	K194 = 1.0 (/millisecond): does not appear in reactions. (K194)
	K195 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K195)
	K196 = 1.0 (/millisecond): does not appear in reactions. (K196)
	K197 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K197)
	K198 = 1.0 (/millisecond): does not appear in reactions. (K198)
	K199 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K199)
	K200 = 1.0 (/millisecond): does not appear in reactions. (K200)
	K201 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K201)
	K202 = 1.0 (/millisecond): does not appear in reactions. (K202)
	K203 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K203)
	K204 = 1.0 (/millisecond): does not appear in reactions. (K204)
	K205 = 1.0 (/millisecond): does not appear in reactions. (K205)
	K206 = 1.0 (/millisecond): does not appear in reactions. (K206)
	K207 = 1.0 (/millisecond): does not appear in reactions. (K207)
	K208 = 1.0 (/millisecond): does not appear in reactions. (K208)
	K209 = 1.0 (/millisecond): does not appear in reactions. (K209)
	K210 = 1.0 (/millisecond): does not appear in reactions. (K210)
	K211 = 1.0 (/millisecond): does not appear in reactions. (K211)
	K212 = 1.0 (/millisecond): does not appear in reactions. (K212)
	K213 = 1.0 (/millisecond): does not appear in reactions. (K213)
	K214 = 1.0 (/millisecond): does not appear in reactions. (K214)
	K215 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K215)
	K216 = 1.0 (/millisecond): does not appear in reactions. (K216)
	K217 = 1.0 (/millisecond): does not appear in reactions. (K217)
	K218 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K218)
	K219 = 1.0 (/millisecond): does not appear in reactions. (K219)
	K220 = 1.0 (/millisecond): does not appear in reactions. (K220)
	K221 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K221)
	K222 = 1.0 (/millisecond): does not appear in reactions. (K222)
	K223 = 1.0 (/millisecond): does not appear in reactions. (K223)
	K224 = 1.0 (liter/nanomole-millisecond): does not appear in reactions. (K224)
	K225 = 1.0 (/millisecond): does not appear in reactions. (K225)
	K226 = 1.0 (/millisecond): does not appear in reactions. (K226)
	kf_R0 = 1.0 (1) : implicitly declared missing rate constant (kf_R0)
	kf_R1 = 1.0 (1) : implicitly declared missing rate constant (kf_R1)
	kf_R2 = 1.0 (1) : implicitly declared missing rate constant (kf_R2)
	kr_R2 = 1.0 (1) : implicitly declared missing rate constant (kr_R2)
	kf_R3 = 1.0 (1) : implicitly declared missing rate constant (kf_R3)
	kr_R3 = 1.0 (1) : implicitly declared missing rate constant (kr_R3)
	kf_R4 = 1.0 (1) : implicitly declared missing rate constant (kf_R4)
	kr_R4 = 1.0 (1) : implicitly declared missing rate constant (kr_R4)
	kf_R5 = 1.0 (1) : implicitly declared missing rate constant (kf_R5)
	kr_R5 = 1.0 (1) : implicitly declared missing rate constant (kr_R5)
	kf_R6 = 1.0 (1) : implicitly declared missing rate constant (kf_R6)
	kr_R6 = 1.0 (1) : implicitly declared missing rate constant (kr_R6)
	kf_R7 = 1.0 (1) : implicitly declared missing rate constant (kf_R7)
	kr_R7 = 1.0 (1) : implicitly declared missing rate constant (kr_R7)
	kf_R8 = 1.0 (1) : implicitly declared missing rate constant (kf_R8)
	kr_R8 = 1.0 (1) : implicitly declared missing rate constant (kr_R8)
	kf_R9 = 1.0 (1) : implicitly declared missing rate constant (kf_R9)
	kf_R10 = 1.0 (1) : implicitly declared missing rate constant (kf_R10)
	kr_R10 = 1.0 (1) : implicitly declared missing rate constant (kr_R10)
	kf_R11 = 1.0 (1) : implicitly declared missing rate constant (kf_R11)
	kf_R12 = 1.0 (1) : implicitly declared missing rate constant (kf_R12)
	kr_R12 = 1.0 (1) : implicitly declared missing rate constant (kr_R12)
	kf_R13 = 1.0 (1) : implicitly declared missing rate constant (kf_R13)
	kr_R13 = 1.0 (1) : implicitly declared missing rate constant (kr_R13)
	kf_R14 = 1.0 (1) : implicitly declared missing rate constant (kf_R14)
	kf_R15 = 1.0 (1) : implicitly declared missing rate constant (kf_R15)
	kr_R15 = 1.0 (1) : implicitly declared missing rate constant (kr_R15)
	kf_R16 = 1.0 (1) : implicitly declared missing rate constant (kf_R16)
	kr_R16 = 1.0 (1) : implicitly declared missing rate constant (kr_R16)
	kf_R17 = 1.0 (1) : implicitly declared missing rate constant (kf_R17)
	kr_R17 = 1.0 (1) : implicitly declared missing rate constant (kr_R17)
	kf_R18 = 1.0 (1) : implicitly declared missing rate constant (kf_R18)
	kr_R18 = 1.0 (1) : implicitly declared missing rate constant (kr_R18)
	kf_R19 = 1.0 (1) : implicitly declared missing rate constant (kf_R19)
	kr_R19 = 1.0 (1) : implicitly declared missing rate constant (kr_R19)
	kf_R20 = 1.0 (1) : implicitly declared missing rate constant (kf_R20)
	kf_R21 = 1.0 (1) : implicitly declared missing rate constant (kf_R21)
	kf_R22 = 1.0 (1) : implicitly declared missing rate constant (kf_R22)
	kf_R23 = 1.0 (1) : implicitly declared missing rate constant (kf_R23)
	kr_R23 = 1.0 (1) : implicitly declared missing rate constant (kr_R23)
	kf_R24 = 1.0 (1) : implicitly declared missing rate constant (kf_R24)
	kr_R24 = 1.0 (1) : implicitly declared missing rate constant (kr_R24)
	kf_R25 = 1.0 (1) : implicitly declared missing rate constant (kf_R25)
	kr_R25 = 1.0 (1) : implicitly declared missing rate constant (kr_R25)
	kf_R26 = 1.0 (1) : implicitly declared missing rate constant (kf_R26)
	kr_R26 = 1.0 (1) : implicitly declared missing rate constant (kr_R26)
	kf_R27 = 1.0 (1) : implicitly declared missing rate constant (kf_R27)
	kr_R27 = 1.0 (1) : implicitly declared missing rate constant (kr_R27)
	kf_R28 = 1.0 (1) : implicitly declared missing rate constant (kf_R28)
	kr_R28 = 1.0 (1) : implicitly declared missing rate constant (kr_R28)
	kf_R29 = 1.0 (1) : implicitly declared missing rate constant (kf_R29)
	kr_R29 = 1.0 (1) : implicitly declared missing rate constant (kr_R29)
	kf_R30 = 1.0 (1) : implicitly declared missing rate constant (kf_R30)
	kr_R30 = 1.0 (1) : implicitly declared missing rate constant (kr_R30)
	kf_R31 = 1.0 (1) : implicitly declared missing rate constant (kf_R31)
	kf_R32 = 1.0 (1) : implicitly declared missing rate constant (kf_R32)
	kf_R33 = 1.0 (1) : implicitly declared missing rate constant (kf_R33)
	kf_R34 = 1.0 (1) : implicitly declared missing rate constant (kf_R34)
	kr_R34 = 1.0 (1) : implicitly declared missing rate constant (kr_R34)
	kf_R35 = 1.0 (1) : implicitly declared missing rate constant (kf_R35)
	kr_R35 = 1.0 (1) : implicitly declared missing rate constant (kr_R35)
	kf_R36 = 1.0 (1) : implicitly declared missing rate constant (kf_R36)
	kf_R37 = 1.0 (1) : implicitly declared missing rate constant (kf_R37)
	kf_R38 = 1.0 (1) : implicitly declared missing rate constant (kf_R38)
	kr_R38 = 1.0 (1) : implicitly declared missing rate constant (kr_R38)
	kf_R39 = 1.0 (1) : implicitly declared missing rate constant (kf_R39)
	kr_R39 = 1.0 (1) : implicitly declared missing rate constant (kr_R39)
	kf_R40 = 1.0 (1) : implicitly declared missing rate constant (kf_R40)
	kr_R40 = 1.0 (1) : implicitly declared missing rate constant (kr_R40)
	kf_R41 = 1.0 (1) : implicitly declared missing rate constant (kf_R41)
	kr_R41 = 1.0 (1) : implicitly declared missing rate constant (kr_R41)
	kf_R42 = 1.0 (1) : implicitly declared missing rate constant (kf_R42)
	kf_R43 = 1.0 (1) : implicitly declared missing rate constant (kf_R43)
	kr_R43 = 1.0 (1) : implicitly declared missing rate constant (kr_R43)
	kf_R44 = 1.0 (1) : implicitly declared missing rate constant (kf_R44)
	kf_R45 = 1.0 (1) : implicitly declared missing rate constant (kf_R45)
	kr_R45 = 1.0 (1) : implicitly declared missing rate constant (kr_R45)
	kf_R46 = 1.0 (1) : implicitly declared missing rate constant (kf_R46)
	kf_R47 = 1.0 (1) : implicitly declared missing rate constant (kf_R47)
	kf_R48 = 1.0 (1) : implicitly declared missing rate constant (kf_R48)
	kr_R48 = 1.0 (1) : implicitly declared missing rate constant (kr_R48)
	kf_R49 = 1.0 (1) : implicitly declared missing rate constant (kf_R49)
	kr_R49 = 1.0 (1) : implicitly declared missing rate constant (kr_R49)
	kf_R50 = 1.0 (1) : implicitly declared missing rate constant (kf_R50)
	kr_R50 = 1.0 (1) : implicitly declared missing rate constant (kr_R50)
	kf_R51 = 1.0 (1) : implicitly declared missing rate constant (kf_R51)
	kr_R51 = 1.0 (1) : implicitly declared missing rate constant (kr_R51)
	kf_R52 = 1.0 (1) : implicitly declared missing rate constant (kf_R52)
	kr_R52 = 1.0 (1) : implicitly declared missing rate constant (kr_R52)
	kf_R53 = 1.0 (1) : implicitly declared missing rate constant (kf_R53)
	kr_R53 = 1.0 (1) : implicitly declared missing rate constant (kr_R53)
	kf_R54 = 1.0 (1) : implicitly declared missing rate constant (kf_R54)
	kr_R54 = 1.0 (1) : implicitly declared missing rate constant (kr_R54)
	kf_R55 = 1.0 (1) : implicitly declared missing rate constant (kf_R55)
	kf_R56 = 1.0 (1) : implicitly declared missing rate constant (kf_R56)
	kf_R57 = 1.0 (1) : implicitly declared missing rate constant (kf_R57)
	kf_R58 = 1.0 (1) : implicitly declared missing rate constant (kf_R58)
	kf_R59 = 1.0 (1) : implicitly declared missing rate constant (kf_R59)
	kf_R60 = 1.0 (1) : implicitly declared missing rate constant (kf_R60)
	kf_R61 = 1.0 (1) : implicitly declared missing rate constant (kf_R61)
	kf_R62 = 1.0 (1) : implicitly declared missing rate constant (kf_R62)
	kf_R63 = 1.0 (1) : implicitly declared missing rate constant (kf_R63)
	kf_R64 = 1.0 (1) : implicitly declared missing rate constant (kf_R64)
	kf_R65 = 1.0 (1) : implicitly declared missing rate constant (kf_R65)
	kf_R66 = 1.0 (1) : implicitly declared missing rate constant (kf_R66)
	kf_R67 = 1.0 (1) : implicitly declared missing rate constant (kf_R67)
	kr_R67 = 1.0 (1) : implicitly declared missing rate constant (kr_R67)
	kf_R68 = 1.0 (1) : implicitly declared missing rate constant (kf_R68)
	kr_R68 = 1.0 (1) : implicitly declared missing rate constant (kr_R68)
	kf_R69 = 1.0 (1) : implicitly declared missing rate constant (kf_R69)
	kr_R69 = 1.0 (1) : implicitly declared missing rate constant (kr_R69)
	kf_R70 = 1.0 (1) : implicitly declared missing rate constant (kf_R70)
	kr_R70 = 1.0 (1) : implicitly declared missing rate constant (kr_R70)
	kf_R71 = 1.0 (1) : implicitly declared missing rate constant (kf_R71)
	kr_R71 = 1.0 (1) : implicitly declared missing rate constant (kr_R71)
	kf_R72 = 1.0 (1) : implicitly declared missing rate constant (kf_R72)
	kr_R72 = 1.0 (1) : implicitly declared missing rate constant (kr_R72)
	kf_R73 = 1.0 (1) : implicitly declared missing rate constant (kf_R73)
	kr_R73 = 1.0 (1) : implicitly declared missing rate constant (kr_R73)
	kf_R74 = 1.0 (1) : implicitly declared missing rate constant (kf_R74)
	kr_R74 = 1.0 (1) : implicitly declared missing rate constant (kr_R74)
	kf_R75 = 1.0 (1) : implicitly declared missing rate constant (kf_R75)
	kr_R75 = 1.0 (1) : implicitly declared missing rate constant (kr_R75)
	kf_R76 = 1.0 (1) : implicitly declared missing rate constant (kf_R76)
	kr_R76 = 1.0 (1) : implicitly declared missing rate constant (kr_R76)
	kf_R77 = 1.0 (1) : implicitly declared missing rate constant (kf_R77)
	kr_R77 = 1.0 (1) : implicitly declared missing rate constant (kr_R77)
	kf_R78 = 1.0 (1) : implicitly declared missing rate constant (kf_R78)
	kr_R78 = 1.0 (1) : implicitly declared missing rate constant (kr_R78)
	kf_R79 = 1.0 (1) : implicitly declared missing rate constant (kf_R79)
	kr_R79 = 1.0 (1) : implicitly declared missing rate constant (kr_R79)
	kf_R80 = 1.0 (1) : implicitly declared missing rate constant (kf_R80)
	kr_R80 = 1.0 (1) : implicitly declared missing rate constant (kr_R80)
	kf_R81 = 1.0 (1) : implicitly declared missing rate constant (kf_R81)
	kf_R82 = 1.0 (1) : implicitly declared missing rate constant (kf_R82)
	kr_R82 = 1.0 (1) : implicitly declared missing rate constant (kr_R82)
	kf_R83 = 1.0 (1) : implicitly declared missing rate constant (kf_R83)
	kf_R84 = 1.0 (1) : implicitly declared missing rate constant (kf_R84)
	kr_R84 = 1.0 (1) : implicitly declared missing rate constant (kr_R84)
	kf_R85 = 1.0 (1) : implicitly declared missing rate constant (kf_R85)
	kf_R86 = 1.0 (1) : implicitly declared missing rate constant (kf_R86)
	kr_R86 = 1.0 (1) : implicitly declared missing rate constant (kr_R86)
	kf_R87 = 1.0 (1) : implicitly declared missing rate constant (kf_R87)
	kf_R88 = 1.0 (1) : implicitly declared missing rate constant (kf_R88)
	kr_R88 = 1.0 (1) : implicitly declared missing rate constant (kr_R88)
	kf_R89 = 1.0 (1) : implicitly declared missing rate constant (kf_R89)
	kf_R90 = 1.0 (1) : implicitly declared missing rate constant (kf_R90)
	kr_R90 = 1.0 (1) : implicitly declared missing rate constant (kr_R90)
	kf_R91 = 1.0 (1) : implicitly declared missing rate constant (kf_R91)
	kr_R91 = 1.0 (1) : implicitly declared missing rate constant (kr_R91)
	kf_R92 = 1.0 (1) : implicitly declared missing rate constant (kf_R92)
	kf_R93 = 1.0 (1) : implicitly declared missing rate constant (kf_R93)
	kr_R93 = 1.0 (1) : implicitly declared missing rate constant (kr_R93)
	kf_R94 = 1.0 (1) : implicitly declared missing rate constant (kf_R94)
	kf_R95 = 1.0 (1) : implicitly declared missing rate constant (kf_R95)
	kf_R96 = 1.0 (1) : implicitly declared missing rate constant (kf_R96)
	kr_R96 = 1.0 (1) : implicitly declared missing rate constant (kr_R96)
	kf_R97 = 1.0 (1) : implicitly declared missing rate constant (kf_R97)
	kf_R98 = 1.0 (1) : implicitly declared missing rate constant (kf_R98)
	kr_R98 = 1.0 (1) : implicitly declared missing rate constant (kr_R98)
	kf_R99 = 1.0 (1) : implicitly declared missing rate constant (kf_R99)
	kf_R100 = 1.0 (1) : implicitly declared missing rate constant (kf_R100)
	kr_R100 = 1.0 (1) : implicitly declared missing rate constant (kr_R100)
	kf_R101 = 1.0 (1) : implicitly declared missing rate constant (kf_R101)
	kf_R102 = 1.0 (1) : implicitly declared missing rate constant (kf_R102)
	kr_R102 = 1.0 (1) : implicitly declared missing rate constant (kr_R102)
	kf_R103 = 1.0 (1) : implicitly declared missing rate constant (kf_R103)
	kf_R104 = 1.0 (1) : implicitly declared missing rate constant (kf_R104)
	kr_R104 = 1.0 (1) : implicitly declared missing rate constant (kr_R104)
	kf_R105 = 1.0 (1) : implicitly declared missing rate constant (kf_R105)
	kf_R106 = 1.0 (1) : implicitly declared missing rate constant (kf_R106)
	kr_R106 = 1.0 (1) : implicitly declared missing rate constant (kr_R106)
	kf_R107 = 1.0 (1) : implicitly declared missing rate constant (kf_R107)
	kf_R108 = 1.0 (1) : implicitly declared missing rate constant (kf_R108)
	kr_R108 = 1.0 (1) : implicitly declared missing rate constant (kr_R108)
	kf_R109 = 1.0 (1) : implicitly declared missing rate constant (kf_R109)
	kr_R109 = 1.0 (1) : implicitly declared missing rate constant (kr_R109)
	kf_R110 = 1.0 (1) : implicitly declared missing rate constant (kf_R110)
	kr_R110 = 1.0 (1) : implicitly declared missing rate constant (kr_R110)
	kf_R111 = 1.0 (1) : implicitly declared missing rate constant (kf_R111)
	kr_R111 = 1.0 (1) : implicitly declared missing rate constant (kr_R111)
	kf_R112 = 1.0 (1) : implicitly declared missing rate constant (kf_R112)
	kr_R112 = 1.0 (1) : implicitly declared missing rate constant (kr_R112)
	kf_R113 = 1.0 (1) : implicitly declared missing rate constant (kf_R113)
	kr_R113 = 1.0 (1) : implicitly declared missing rate constant (kr_R113)
	kf_R114 = 1.0 (1) : implicitly declared missing rate constant (kf_R114)
	kr_R114 = 1.0 (1) : implicitly declared missing rate constant (kr_R114)
	kf_R115 = 1.0 (1) : implicitly declared missing rate constant (kf_R115)
	kr_R115 = 1.0 (1) : implicitly declared missing rate constant (kr_R115)
	kf_R116 = 1.0 (1) : implicitly declared missing rate constant (kf_R116)
	kr_R116 = 1.0 (1) : implicitly declared missing rate constant (kr_R116)
	kf_R117 = 1.0 (1) : implicitly declared missing rate constant (kf_R117)
	kr_R117 = 1.0 (1) : implicitly declared missing rate constant (kr_R117)
	kf_R118 = 1.0 (1) : implicitly declared missing rate constant (kf_R118)
	kf_R119 = 1.0 (1) : implicitly declared missing rate constant (kf_R119)
	kf_R120 = 1.0 (1) : implicitly declared missing rate constant (kf_R120)
	kr_R120 = 1.0 (1) : implicitly declared missing rate constant (kr_R120)
	kf_R121 = 1.0 (1) : implicitly declared missing rate constant (kf_R121)
	kr_R121 = 1.0 (1) : implicitly declared missing rate constant (kr_R121)
	kf_R122 = 1.0 (1) : implicitly declared missing rate constant (kf_R122)
	kr_R122 = 1.0 (1) : implicitly declared missing rate constant (kr_R122)
	kf_R123 = 1.0 (1) : implicitly declared missing rate constant (kf_R123)
	kr_R123 = 1.0 (1) : implicitly declared missing rate constant (kr_R123)
	kf_R124 = 1.0 (1) : implicitly declared missing rate constant (kf_R124)
	kr_R124 = 1.0 (1) : implicitly declared missing rate constant (kr_R124)
	kf_R125 = 1.0 (1) : implicitly declared missing rate constant (kf_R125)
	kr_R125 = 1.0 (1) : implicitly declared missing rate constant (kr_R125)
	kf_R126 = 1.0 (1) : implicitly declared missing rate constant (kf_R126)
	kr_R126 = 1.0 (1) : implicitly declared missing rate constant (kr_R126)
	kf_R127 = 1.0 (1) : implicitly declared missing rate constant (kf_R127)
	kr_R127 = 1.0 (1) : implicitly declared missing rate constant (kr_R127)
	kf_R128 = 1.0 (1) : implicitly declared missing rate constant (kf_R128)
	kr_R128 = 1.0 (1) : implicitly declared missing rate constant (kr_R128)
	kf_R129 = 1.0 (1) : implicitly declared missing rate constant (kf_R129)
	kr_R129 = 1.0 (1) : implicitly declared missing rate constant (kr_R129)
	kf_R130 = 1.0 (1) : implicitly declared missing rate constant (kf_R130)
	kr_R130 = 1.0 (1) : implicitly declared missing rate constant (kr_R130)
	kf_R131 = 1.0 (1) : implicitly declared missing rate constant (kf_R131)
	kf_R132 = 1.0 (1) : implicitly declared missing rate constant (kf_R132)
	kr_R132 = 1.0 (1) : implicitly declared missing rate constant (kr_R132)
	kf_R133 = 1.0 (1) : implicitly declared missing rate constant (kf_R133)
	kf_R134 = 1.0 (1) : implicitly declared missing rate constant (kf_R134)
	kr_R134 = 1.0 (1) : implicitly declared missing rate constant (kr_R134)
	kf_R135 = 1.0 (1) : implicitly declared missing rate constant (kf_R135)
	kf_R136 = 1.0 (1) : implicitly declared missing rate constant (kf_R136)
	kr_R136 = 1.0 (1) : implicitly declared missing rate constant (kr_R136)
	kf_R137 = 1.0 (1) : implicitly declared missing rate constant (kf_R137)
	S98_st_cc = 0.0 : total amount for subset (S98_st_cc)
	S97_st_cc = 0.0 : total amount for subset (S97_st_cc)
	S96_st_cc = 0.0 : total amount for subset (S96_st_cc)
	S95_st_cc = 0.0 : total amount for subset (S95_st_cc)
	S94_st_cc = 0.0 : total amount for subset (S94_st_cc)
	S93_st_cc = 0.0 : total amount for subset (S93_st_cc)
	S92_st_cc = 0.0 : total amount for subset (S92_st_cc)
	S91_st_cc = 20000.0 : total amount for subset (S91_st_cc)
	S90_st_cc = 0.0 : total amount for subset (S90_st_cc)
	S89_st_cc = 0.0 : total amount for subset (S89_st_cc)
	S88_st_cc = 0.0 : total amount for subset (S88_st_cc)
	S87_st_cc = 0.0 : total amount for subset (S87_st_cc)
	S86_st_cc = 0.0 : total amount for subset (S86_st_cc)
	S85_st_cc = 4000.0 : total amount for subset (S85_st_cc)
	S84_st_cc = 0.0 : total amount for subset (S84_st_cc)
	S83_st_cc = 0.0 : total amount for subset (S83_st_cc)
	S82_st_cc = 0.0 : total amount for subset (S82_st_cc)
	S81_st_cc = 0.0 : total amount for subset (S81_st_cc)
	S80_st_cc = 0.0 : total amount for subset (S80_st_cc)
	S79_st_cc = 0.0 : total amount for subset (S79_st_cc)
	S78_st_cc = 0.0 : total amount for subset (S78_st_cc)
	S77_st_cc = 3000.0 : total amount for subset (S77_st_cc)
	S76_st_cc = 0.0 : total amount for subset (S76_st_cc)
	S75_st_cc = 0.0 : total amount for subset (S75_st_cc)
	S74_st_cc = 0.0 : total amount for subset (S74_st_cc)
	S73_st_cc = 0.0 : total amount for subset (S73_st_cc)
	S72_st_cc = 0.0 : total amount for subset (S72_st_cc)
	S71_st_cc = 0.0 : total amount for subset (S71_st_cc)
	S70_st_cc = 0.0 : total amount for subset (S70_st_cc)
	S69_st_cc = 0.0 : total amount for subset (S69_st_cc)
	S68_st_cc = 1200.0 : total amount for subset (S68_st_cc)
	S67_st_cc = 0.0 : total amount for subset (S67_st_cc)
	S66_st_cc = 0.0 : total amount for subset (S66_st_cc)
	S65_st_cc = 0.0 : total amount for subset (S65_st_cc)
	S64_st_cc = 700.0 : total amount for subset (S64_st_cc)
	S63_st_cc = 0.0 : total amount for subset (S63_st_cc)
	S62_st_cc = 2000.0 : total amount for subset (S62_st_cc)
	S61_st_cc = 0.0 : total amount for subset (S61_st_cc)
	S60_st_cc = 0.0 : total amount for subset (S60_st_cc)
	S59_st_cc = 0.0 : total amount for subset (S59_st_cc)
	S58_st_cc = 0.0 : total amount for subset (S58_st_cc)
	S57_st_cc = 0.0 : total amount for subset (S57_st_cc)
	S56_st_cc = 0.0 : total amount for subset (S56_st_cc)
	S55_st_cc = 0.0 : total amount for subset (S55_st_cc)
	S54_st_cc = 0.0 : total amount for subset (S54_st_cc)
	S53_st_cc = 0.0 : total amount for subset (S53_st_cc)
	S52_st_cc = 2000.0 : total amount for subset (S52_st_cc)
	S51_st_cc = 0.0 : total amount for subset (S51_st_cc)
	S50_st_cc = 0.0 : total amount for subset (S50_st_cc)
	S49_st_cc = 0.0 : total amount for subset (S49_st_cc)
	S47_st_cc = 50000.0 : total amount for subset (S47_st_cc)
	S46_st_cc = 0.0 : total amount for subset (S46_st_cc)
	S45_st_cc = 0.0 : total amount for subset (S45_st_cc)
	S44_st_cc = 0.0 : total amount for subset (S44_st_cc)
	S43_st_cc = 0.0 : total amount for subset (S43_st_cc)
	S42_st_cc = 0.0 : total amount for subset (S42_st_cc)
	S41_st_cc = 2000.0 : total amount for subset (S41_st_cc)
	S40_st_cc = 0.0 : total amount for subset (S40_st_cc)
	S39_st_cc = 1800.0 : total amount for subset (S39_st_cc)
	S38_st_cc = 3000.0 : total amount for subset (S38_st_cc)
	S37_st_cc = 0.0 : total amount for subset (S37_st_cc)
	S36_st_cc = 0.0 : total amount for subset (S36_st_cc)
	S35_st_cc = 0.0 : total amount for subset (S35_st_cc)
	S34_st_cc = 0.0 : total amount for subset (S34_st_cc)
	S33_st_cc = 0.0 : total amount for subset (S33_st_cc)
	S32_st_cc = 0.0 : total amount for subset (S32_st_cc)
	S31_st_cc = 0.0 : total amount for subset (S31_st_cc)
	S30_st_cc = 0.0 : total amount for subset (S30_st_cc)
	S29_st_cc = 20000.0 : total amount for subset (S29_st_cc)
	S28_st_cc = 0.0 : total amount for subset (S28_st_cc)
	S27_st_cc = 0.0 : total amount for subset (S27_st_cc)
	S26_st_cc = 0.0 : total amount for subset (S26_st_cc)
	S25_st_cc = 9000.0 : total amount for subset (S25_st_cc)
	S23_st_cc = 0.0 : total amount for subset (S23_st_cc)
	S22_st_cc = 0.0 : total amount for subset (S22_st_cc)
	S21_st_cc = 0.0 : total amount for subset (S21_st_cc)
	S20_st_cc = 0.0 : total amount for subset (S20_st_cc)
	S19_st_cc = 0.0 : total amount for subset (S19_st_cc)
	S18_st_cc = 0.0 : total amount for subset (S18_st_cc)
	S17_st_cc = 0.0 : total amount for subset (S17_st_cc)
	S16_st_cc = 2000.0 : total amount for subset (S16_st_cc)
	S15_st_cc = 0.0 : total amount for subset (S15_st_cc)
	S14_st_cc = 0.0 : total amount for subset (S14_st_cc)
	S13_st_cc = 0.0 : total amount for subset (S13_st_cc)
	S12_st_cc = 0.0 : total amount for subset (S12_st_cc)
	S11_st_cc = 0.0 : total amount for subset (S11_st_cc)
	S10_st_cc = 2000.0 : total amount for subset (S10_st_cc)
	S7_st_cc = 0.0 : total amount for subset (S7_st_cc)
	S6_st_cc = 0.0 : total amount for subset (S6_st_cc)
	S5_st_cc = 0.0 : total amount for subset (S5_st_cc)
	S4_st_cc = 0.0 : total amount for subset (S4_st_cc)
	S3_st_cc = 0.0 : total amount for subset (S3_st_cc)
	S2_st_cc = 0.0 : total amount for subset (S2_st_cc)
	S1_st_cc = 0.0 : total amount for subset (S1_st_cc)
	S0_st_cc = 700.0 : total amount for subset (S0_st_cc)
}

ASSIGNED {
	time (millisecond) : alias for t
	EX0 : pre-defined algebraic expression (EX0)
	EX1 : pre-defined algebraic expression (EX1)
	EX2 : pre-defined algebraic expression (EX2)
	S8_st : pre-defined algebraic expression (S8_st)
	S9_st : pre-defined algebraic expression (S9_st)
	S24_st : pre-defined algebraic expression (S24_st)
	S48_st : pre-defined algebraic expression (S48_st)
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
	S98_st : computed from conservation law (S98_st)
	S97_st : computed from conservation law (S97_st)
	S96_st : computed from conservation law (S96_st)
	S95_st : computed from conservation law (S95_st)
	S94_st : computed from conservation law (S94_st)
	S93_st : computed from conservation law (S93_st)
	S92_st : computed from conservation law (S92_st)
	S91_st : computed from conservation law (S91_st)
	S90_st : computed from conservation law (S90_st)
	S89_st : computed from conservation law (S89_st)
	S88_st : computed from conservation law (S88_st)
	S87_st : computed from conservation law (S87_st)
	S86_st : computed from conservation law (S86_st)
	S85_st : computed from conservation law (S85_st)
	S84_st : computed from conservation law (S84_st)
	S83_st : computed from conservation law (S83_st)
	S82_st : computed from conservation law (S82_st)
	S81_st : computed from conservation law (S81_st)
	S80_st : computed from conservation law (S80_st)
	S79_st : computed from conservation law (S79_st)
	S78_st : computed from conservation law (S78_st)
	S77_st : computed from conservation law (S77_st)
	S76_st : computed from conservation law (S76_st)
	S75_st : computed from conservation law (S75_st)
	S74_st : computed from conservation law (S74_st)
	S73_st : computed from conservation law (S73_st)
	S72_st : computed from conservation law (S72_st)
	S71_st : computed from conservation law (S71_st)
	S70_st : computed from conservation law (S70_st)
	S69_st : computed from conservation law (S69_st)
	S68_st : computed from conservation law (S68_st)
	S67_st : computed from conservation law (S67_st)
	S66_st : computed from conservation law (S66_st)
	S65_st : computed from conservation law (S65_st)
	S64_st : computed from conservation law (S64_st)
	S63_st : computed from conservation law (S63_st)
	S62_st : computed from conservation law (S62_st)
	S61_st : computed from conservation law (S61_st)
	S60_st : computed from conservation law (S60_st)
	S59_st : computed from conservation law (S59_st)
	S58_st : computed from conservation law (S58_st)
	S57_st : computed from conservation law (S57_st)
	S56_st : computed from conservation law (S56_st)
	S55_st : computed from conservation law (S55_st)
	S54_st : computed from conservation law (S54_st)
	S53_st : computed from conservation law (S53_st)
	S52_st : computed from conservation law (S52_st)
	S51_st : computed from conservation law (S51_st)
	S50_st : computed from conservation law (S50_st)
	S49_st : computed from conservation law (S49_st)
	S47_st : computed from conservation law (S47_st)
	S46_st : computed from conservation law (S46_st)
	S45_st : computed from conservation law (S45_st)
	S44_st : computed from conservation law (S44_st)
	S43_st : computed from conservation law (S43_st)
	S42_st : computed from conservation law (S42_st)
	S41_st : computed from conservation law (S41_st)
	S40_st : computed from conservation law (S40_st)
	S39_st : computed from conservation law (S39_st)
	S38_st : computed from conservation law (S38_st)
	S37_st : computed from conservation law (S37_st)
	S36_st : computed from conservation law (S36_st)
	S35_st : computed from conservation law (S35_st)
	S34_st : computed from conservation law (S34_st)
	S33_st : computed from conservation law (S33_st)
	S32_st : computed from conservation law (S32_st)
	S31_st : computed from conservation law (S31_st)
	S30_st : computed from conservation law (S30_st)
	S29_st : computed from conservation law (S29_st)
	S28_st : computed from conservation law (S28_st)
	S27_st : computed from conservation law (S27_st)
	S26_st : computed from conservation law (S26_st)
	S25_st : computed from conservation law (S25_st)
	S23_st : computed from conservation law (S23_st)
	S22_st : computed from conservation law (S22_st)
	S21_st : computed from conservation law (S21_st)
	S20_st : computed from conservation law (S20_st)
	S19_st : computed from conservation law (S19_st)
	S18_st : computed from conservation law (S18_st)
	S17_st : computed from conservation law (S17_st)
	S16_st : computed from conservation law (S16_st)
	S15_st : computed from conservation law (S15_st)
	S14_st : computed from conservation law (S14_st)
	S13_st : computed from conservation law (S13_st)
	S12_st : computed from conservation law (S12_st)
	S11_st : computed from conservation law (S11_st)
	S10_st : computed from conservation law (S10_st)
	S7_st : computed from conservation law (S7_st)
	S6_st : computed from conservation law (S6_st)
	S5_st : computed from conservation law (S5_st)
	S4_st : computed from conservation law (S4_st)
	S3_st : computed from conservation law (S3_st)
	S2_st : computed from conservation law (S2_st)
	S1_st : computed from conservation law (S1_st)
	S0_st : computed from conservation law (S0_st)
	ca_ref (millimole/liter)
	Ca_rate (millimole/liter/millisecond)
	da_ref (millimole/liter)
	DA_rate (millimole/liter/millisecond)
	PKAci (millimole/liter) : ion variable registered for internal scope linkage
	pSubstratei (millimole/liter) : ion variable registered for internal scope linkage
	AC5 : catch-all baseline fallback tracking structural bounds (AC5)
	AC5_ATP : catch-all baseline fallback tracking structural bounds (AC5_ATP)
	AC5_Ca : catch-all baseline fallback tracking structural bounds (AC5_Ca)
	AC5_Ca_ATP : catch-all baseline fallback tracking structural bounds (AC5_Ca_ATP)
	AC5_Ca_GaolfGTP : catch-all baseline fallback tracking structural bounds (AC5_Ca_GaolfGTP)
	AC5_Ca_GaolfGTP_ATP : catch-all baseline fallback tracking structural bounds (AC5_Ca_GaolfGTP_ATP)
	AC5_GaolfGTP : catch-all baseline fallback tracking structural bounds (AC5_GaolfGTP)
	AC5_GaolfGTP_ATP : catch-all baseline fallback tracking structural bounds (AC5_GaolfGTP_ATP)
	ARPP21 : catch-all baseline fallback tracking structural bounds (ARPP21)
	ATP : catch-all baseline fallback tracking structural bounds (ATP)
	B56PP2A : catch-all baseline fallback tracking structural bounds (B56PP2A)
	B56PP2A_D32p75 : catch-all baseline fallback tracking structural bounds (B56PP2A_D32p75)
	B56PP2A_pARPP21 : catch-all baseline fallback tracking structural bounds (B56PP2A_pARPP21)
	B56PP2Ap : catch-all baseline fallback tracking structural bounds (B56PP2Ap)
	B56PP2Ap_D32p75 : catch-all baseline fallback tracking structural bounds (B56PP2Ap_D32p75)
	B56PP2Ap_pARPP21 : catch-all baseline fallback tracking structural bounds (B56PP2Ap_pARPP21)
	B72PP2A : catch-all baseline fallback tracking structural bounds (B72PP2A)
	B72PP2A_Ca : catch-all baseline fallback tracking structural bounds (B72PP2A_Ca)
	B72PP2A_Ca_D32p34 : catch-all baseline fallback tracking structural bounds (B72PP2A_Ca_D32p34)
	B72PP2A_Ca_D32p75 : catch-all baseline fallback tracking structural bounds (B72PP2A_Ca_D32p75)
	B72PP2A_Ca_pARPP21 : catch-all baseline fallback tracking structural bounds (B72PP2A_Ca_pARPP21)
	B72PP2A_D32p34 : catch-all baseline fallback tracking structural bounds (B72PP2A_D32p34)
	B72PP2A_D32p75 : catch-all baseline fallback tracking structural bounds (B72PP2A_D32p75)
	B72PP2A_pARPP21 : catch-all baseline fallback tracking structural bounds (B72PP2A_pARPP21)
	CDK5 : catch-all baseline fallback tracking structural bounds (CDK5)
	CDK5_D32 : catch-all baseline fallback tracking structural bounds (CDK5_D32)
	Ca : catch-all baseline fallback tracking structural bounds (Ca)
	CaM : catch-all baseline fallback tracking structural bounds (CaM)
	CaMKII : catch-all baseline fallback tracking structural bounds (CaMKII)
	CaMKII_CaM : catch-all baseline fallback tracking structural bounds (CaMKII_CaM)
	CaMKII_CaM_Ca2 : catch-all baseline fallback tracking structural bounds (CaMKII_CaM_Ca2)
	CaMKII_CaM_Ca2_psd : catch-all baseline fallback tracking structural bounds (CaMKII_CaM_Ca2_psd)
	CaMKII_CaM_Ca2_psd_Substrate : catch-all baseline fallback tracking structural bounds (CaMKII_CaM_Ca2_psd_Substrate)
	CaMKII_CaM_Ca4 : catch-all baseline fallback tracking structural bounds (CaMKII_CaM_Ca4)
	CaMKII_CaM_Ca4_CaMKII_CaM_Ca4 : catch-all baseline fallback tracking structural bounds (CaMKII_CaM_Ca4_CaMKII_CaM_Ca4)
	CaMKII_CaM_Ca4_psd : catch-all baseline fallback tracking structural bounds (CaMKII_CaM_Ca4_psd)
	CaMKII_CaM_Ca4_psd_CaMKII_CaM_Ca4_psd : catch-all baseline fallback tracking structural bounds (CaMKII_CaM_Ca4_psd_CaMKII_CaM_Ca4_psd)
	CaMKII_CaM_Ca4_psd_Substrate : catch-all baseline fallback tracking structural bounds (CaMKII_CaM_Ca4_psd_Substrate)
	CaMKII_CaM_psd : catch-all baseline fallback tracking structural bounds (CaMKII_CaM_psd)
	CaMKII_CaM_psd_Substrate : catch-all baseline fallback tracking structural bounds (CaMKII_CaM_psd_Substrate)
	CaMKII_psd : catch-all baseline fallback tracking structural bounds (CaMKII_psd)
	CaM_Ca2 : catch-all baseline fallback tracking structural bounds (CaM_Ca2)
	CaM_Ca4 : catch-all baseline fallback tracking structural bounds (CaM_Ca4)
	CaM_Ca4_pARPP21 : catch-all baseline fallback tracking structural bounds (CaM_Ca4_pARPP21)
	D1R : catch-all baseline fallback tracking structural bounds (D1R)
	D1R_DA : catch-all baseline fallback tracking structural bounds (D1R_DA)
	D1R_Golf : catch-all baseline fallback tracking structural bounds (D1R_Golf)
	D1R_Golf_DA : catch-all baseline fallback tracking structural bounds (D1R_Golf_DA)
	D32 : catch-all baseline fallback tracking structural bounds (D32)
	D32p34 : catch-all baseline fallback tracking structural bounds (D32p34)
	D32p75 : catch-all baseline fallback tracking structural bounds (D32p75)
	DA : catch-all baseline fallback tracking structural bounds (DA)
	DA_basal : catch-all baseline fallback tracking structural bounds (DA_basal)
	DA_max : catch-all baseline fallback tracking structural bounds (DA_max)
	DA_start : catch-all baseline fallback tracking structural bounds (DA_start)
	GaolfGDP : catch-all baseline fallback tracking structural bounds (GaolfGDP)
	GaolfGTP : catch-all baseline fallback tracking structural bounds (GaolfGTP)
	Gbgolf : catch-all baseline fallback tracking structural bounds (Gbgolf)
	Golf : catch-all baseline fallback tracking structural bounds (Golf)
	PDE10c : catch-all baseline fallback tracking structural bounds (PDE10c)
	PDE10c_cAMP : catch-all baseline fallback tracking structural bounds (PDE10c_cAMP)
	PDE10r : catch-all baseline fallback tracking structural bounds (PDE10r)
	PDE10r_cAMP : catch-all baseline fallback tracking structural bounds (PDE10r_cAMP)
	PDE4 : catch-all baseline fallback tracking structural bounds (PDE4)
	PDE4_cAMP : catch-all baseline fallback tracking structural bounds (PDE4_cAMP)
	PKA : catch-all baseline fallback tracking structural bounds (PKA)
	PKA_Ca2MP : catch-all baseline fallback tracking structural bounds (PKA_Ca2MP)
	PKA_Ca4MP : catch-all baseline fallback tracking structural bounds (PKA_Ca4MP)
	PKAc : catch-all baseline fallback tracking structural bounds (PKAc)
	PKAc_ARPP21 : catch-all baseline fallback tracking structural bounds (PKAc_ARPP21)
	PKAc_B56PP2A : catch-all baseline fallback tracking structural bounds (PKAc_B56PP2A)
	PKAc_D32 : catch-all baseline fallback tracking structural bounds (PKAc_D32)
	PKAc_D32p75 : catch-all baseline fallback tracking structural bounds (PKAc_D32p75)
	PKAreg : catch-all baseline fallback tracking structural bounds (PKAreg)
	PP1 : catch-all baseline fallback tracking structural bounds (PP1)
	PP1_D32p34 : catch-all baseline fallback tracking structural bounds (PP1_D32p34)
	PP1_pCaMKII_psd : catch-all baseline fallback tracking structural bounds (PP1_pCaMKII_psd)
	PP1_pSubstrate : catch-all baseline fallback tracking structural bounds (PP1_pSubstrate)
	PP2B : catch-all baseline fallback tracking structural bounds (PP2B)
	PP2B_CaM : catch-all baseline fallback tracking structural bounds (PP2B_CaM)
	PP2B_CaM_Ca2 : catch-all baseline fallback tracking structural bounds (PP2B_CaM_Ca2)
	PP2Bc : catch-all baseline fallback tracking structural bounds (PP2Bc)
	PP2Bc_D32p34 : catch-all baseline fallback tracking structural bounds (PP2Bc_D32p34)
	Substrate : catch-all baseline fallback tracking structural bounds (Substrate)
	cAMP : catch-all baseline fallback tracking structural bounds (cAMP)
	pARPP21 : catch-all baseline fallback tracking structural bounds (pARPP21)
	pCaMKII : catch-all baseline fallback tracking structural bounds (pCaMKII)
	pCaMKII_CaM : catch-all baseline fallback tracking structural bounds (pCaMKII_CaM)
	pCaMKII_CaM_Ca2 : catch-all baseline fallback tracking structural bounds (pCaMKII_CaM_Ca2)
	pCaMKII_CaM_Ca2_psd : catch-all baseline fallback tracking structural bounds (pCaMKII_CaM_Ca2_psd)
	pCaMKII_CaM_Ca2_psd_Substrate : catch-all baseline fallback tracking structural bounds (pCaMKII_CaM_Ca2_psd_Substrate)
	pCaMKII_CaM_Ca4 : catch-all baseline fallback tracking structural bounds (pCaMKII_CaM_Ca4)
	pCaMKII_CaM_Ca4_CaMKII_CaM_Ca4 : catch-all baseline fallback tracking structural bounds (pCaMKII_CaM_Ca4_CaMKII_CaM_Ca4)
	pCaMKII_CaM_Ca4_psd : catch-all baseline fallback tracking structural bounds (pCaMKII_CaM_Ca4_psd)
	pCaMKII_CaM_Ca4_psd_CaMKII_CaM_Ca4_psd : catch-all baseline fallback tracking structural bounds (pCaMKII_CaM_Ca4_psd_CaMKII_CaM_Ca4_psd)
	pCaMKII_CaM_Ca4_psd_Substrate : catch-all baseline fallback tracking structural bounds (pCaMKII_CaM_Ca4_psd_Substrate)
	pCaMKII_CaM_psd : catch-all baseline fallback tracking structural bounds (pCaMKII_CaM_psd)
	pCaMKII_CaM_psd_Substrate : catch-all baseline fallback tracking structural bounds (pCaMKII_CaM_psd_Substrate)
	pCaMKII_psd : catch-all baseline fallback tracking structural bounds (pCaMKII_psd)
	pCaMKII_psd_Substrate : catch-all baseline fallback tracking structural bounds (pCaMKII_psd_Substrate)
	pSubstrate : catch-all baseline fallback tracking structural bounds (pSubstrate)
	tau_DA1 : catch-all baseline fallback tracking structural bounds (tau_DA1)
	tau_DA2 : catch-all baseline fallback tracking structural bounds (tau_DA2)
}

STATE {
	: S0_st is calculated via Conservation Law
	: S1_st is calculated via Conservation Law
	: S2_st is calculated via Conservation Law
	: S3_st is calculated via Conservation Law
	: S4_st is calculated via Conservation Law
	: S5_st is calculated via Conservation Law
	: S6_st is calculated via Conservation Law
	: S7_st is calculated via Conservation Law
	: S10_st is calculated via Conservation Law
	: S11_st is calculated via Conservation Law
	: S12_st is calculated via Conservation Law
	: S13_st is calculated via Conservation Law
	: S14_st is calculated via Conservation Law
	: S15_st is calculated via Conservation Law
	: S16_st is calculated via Conservation Law
	: S17_st is calculated via Conservation Law
	: S18_st is calculated via Conservation Law
	: S19_st is calculated via Conservation Law
	: S20_st is calculated via Conservation Law
	: S21_st is calculated via Conservation Law
	: S22_st is calculated via Conservation Law
	: S23_st is calculated via Conservation Law
	: S25_st is calculated via Conservation Law
	: S26_st is calculated via Conservation Law
	: S27_st is calculated via Conservation Law
	: S28_st is calculated via Conservation Law
	: S29_st is calculated via Conservation Law
	: S30_st is calculated via Conservation Law
	: S31_st is calculated via Conservation Law
	: S32_st is calculated via Conservation Law
	: S33_st is calculated via Conservation Law
	: S34_st is calculated via Conservation Law
	: S35_st is calculated via Conservation Law
	: S36_st is calculated via Conservation Law
	: S37_st is calculated via Conservation Law
	: S38_st is calculated via Conservation Law
	: S39_st is calculated via Conservation Law
	: S40_st is calculated via Conservation Law
	: S41_st is calculated via Conservation Law
	: S42_st is calculated via Conservation Law
	: S43_st is calculated via Conservation Law
	: S44_st is calculated via Conservation Law
	: S45_st is calculated via Conservation Law
	: S46_st is calculated via Conservation Law
	: S47_st is calculated via Conservation Law
	: S49_st is calculated via Conservation Law
	: S50_st is calculated via Conservation Law
	: S51_st is calculated via Conservation Law
	: S52_st is calculated via Conservation Law
	: S53_st is calculated via Conservation Law
	: S54_st is calculated via Conservation Law
	: S55_st is calculated via Conservation Law
	: S56_st is calculated via Conservation Law
	: S57_st is calculated via Conservation Law
	: S58_st is calculated via Conservation Law
	: S59_st is calculated via Conservation Law
	: S60_st is calculated via Conservation Law
	: S61_st is calculated via Conservation Law
	: S62_st is calculated via Conservation Law
	: S63_st is calculated via Conservation Law
	: S64_st is calculated via Conservation Law
	: S65_st is calculated via Conservation Law
	: S66_st is calculated via Conservation Law
	: S67_st is calculated via Conservation Law
	: S68_st is calculated via Conservation Law
	: S69_st is calculated via Conservation Law
	: S70_st is calculated via Conservation Law
	: S71_st is calculated via Conservation Law
	: S72_st is calculated via Conservation Law
	: S73_st is calculated via Conservation Law
	: S74_st is calculated via Conservation Law
	: S75_st is calculated via Conservation Law
	: S76_st is calculated via Conservation Law
	: S77_st is calculated via Conservation Law
	: S78_st is calculated via Conservation Law
	: S79_st is calculated via Conservation Law
	: S80_st is calculated via Conservation Law
	: S81_st is calculated via Conservation Law
	: S82_st is calculated via Conservation Law
	: S83_st is calculated via Conservation Law
	: S84_st is calculated via Conservation Law
	: S85_st is calculated via Conservation Law
	: S86_st is calculated via Conservation Law
	: S87_st is calculated via Conservation Law
	: S88_st is calculated via Conservation Law
	: S89_st is calculated via Conservation Law
	: S90_st is calculated via Conservation Law
	: S91_st is calculated via Conservation Law
	: S92_st is calculated via Conservation Law
	: S93_st is calculated via Conservation Law
	: S94_st is calculated via Conservation Law
	: S95_st is calculated via Conservation Law
	: S96_st is calculated via Conservation Law
	: S97_st is calculated via Conservation Law
	: S98_st is calculated via Conservation Law
}

INITIAL {
	: S0_st cannot have initial values as it is determined by conservation law
	: S1_st cannot have initial values as it is determined by conservation law
	: S2_st cannot have initial values as it is determined by conservation law
	: S3_st cannot have initial values as it is determined by conservation law
	: S4_st cannot have initial values as it is determined by conservation law
	: S5_st cannot have initial values as it is determined by conservation law
	: S6_st cannot have initial values as it is determined by conservation law
	: S7_st cannot have initial values as it is determined by conservation law
	: S10_st cannot have initial values as it is determined by conservation law
	: S11_st cannot have initial values as it is determined by conservation law
	: S12_st cannot have initial values as it is determined by conservation law
	: S13_st cannot have initial values as it is determined by conservation law
	: S14_st cannot have initial values as it is determined by conservation law
	: S15_st cannot have initial values as it is determined by conservation law
	: S16_st cannot have initial values as it is determined by conservation law
	: S17_st cannot have initial values as it is determined by conservation law
	: S18_st cannot have initial values as it is determined by conservation law
	: S19_st cannot have initial values as it is determined by conservation law
	: S20_st cannot have initial values as it is determined by conservation law
	: S21_st cannot have initial values as it is determined by conservation law
	: S22_st cannot have initial values as it is determined by conservation law
	: S23_st cannot have initial values as it is determined by conservation law
	: S25_st cannot have initial values as it is determined by conservation law
	: S26_st cannot have initial values as it is determined by conservation law
	: S27_st cannot have initial values as it is determined by conservation law
	: S28_st cannot have initial values as it is determined by conservation law
	: S29_st cannot have initial values as it is determined by conservation law
	: S30_st cannot have initial values as it is determined by conservation law
	: S31_st cannot have initial values as it is determined by conservation law
	: S32_st cannot have initial values as it is determined by conservation law
	: S33_st cannot have initial values as it is determined by conservation law
	: S34_st cannot have initial values as it is determined by conservation law
	: S35_st cannot have initial values as it is determined by conservation law
	: S36_st cannot have initial values as it is determined by conservation law
	: S37_st cannot have initial values as it is determined by conservation law
	: S38_st cannot have initial values as it is determined by conservation law
	: S39_st cannot have initial values as it is determined by conservation law
	: S40_st cannot have initial values as it is determined by conservation law
	: S41_st cannot have initial values as it is determined by conservation law
	: S42_st cannot have initial values as it is determined by conservation law
	: S43_st cannot have initial values as it is determined by conservation law
	: S44_st cannot have initial values as it is determined by conservation law
	: S45_st cannot have initial values as it is determined by conservation law
	: S46_st cannot have initial values as it is determined by conservation law
	: S47_st cannot have initial values as it is determined by conservation law
	: S49_st cannot have initial values as it is determined by conservation law
	: S50_st cannot have initial values as it is determined by conservation law
	: S51_st cannot have initial values as it is determined by conservation law
	: S52_st cannot have initial values as it is determined by conservation law
	: S53_st cannot have initial values as it is determined by conservation law
	: S54_st cannot have initial values as it is determined by conservation law
	: S55_st cannot have initial values as it is determined by conservation law
	: S56_st cannot have initial values as it is determined by conservation law
	: S57_st cannot have initial values as it is determined by conservation law
	: S58_st cannot have initial values as it is determined by conservation law
	: S59_st cannot have initial values as it is determined by conservation law
	: S60_st cannot have initial values as it is determined by conservation law
	: S61_st cannot have initial values as it is determined by conservation law
	: S62_st cannot have initial values as it is determined by conservation law
	: S63_st cannot have initial values as it is determined by conservation law
	: S64_st cannot have initial values as it is determined by conservation law
	: S65_st cannot have initial values as it is determined by conservation law
	: S66_st cannot have initial values as it is determined by conservation law
	: S67_st cannot have initial values as it is determined by conservation law
	: S68_st cannot have initial values as it is determined by conservation law
	: S69_st cannot have initial values as it is determined by conservation law
	: S70_st cannot have initial values as it is determined by conservation law
	: S71_st cannot have initial values as it is determined by conservation law
	: S72_st cannot have initial values as it is determined by conservation law
	: S73_st cannot have initial values as it is determined by conservation law
	: S74_st cannot have initial values as it is determined by conservation law
	: S75_st cannot have initial values as it is determined by conservation law
	: S76_st cannot have initial values as it is determined by conservation law
	: S77_st cannot have initial values as it is determined by conservation law
	: S78_st cannot have initial values as it is determined by conservation law
	: S79_st cannot have initial values as it is determined by conservation law
	: S80_st cannot have initial values as it is determined by conservation law
	: S81_st cannot have initial values as it is determined by conservation law
	: S82_st cannot have initial values as it is determined by conservation law
	: S83_st cannot have initial values as it is determined by conservation law
	: S84_st cannot have initial values as it is determined by conservation law
	: S85_st cannot have initial values as it is determined by conservation law
	: S86_st cannot have initial values as it is determined by conservation law
	: S87_st cannot have initial values as it is determined by conservation law
	: S88_st cannot have initial values as it is determined by conservation law
	: S89_st cannot have initial values as it is determined by conservation law
	: S90_st cannot have initial values as it is determined by conservation law
	: S91_st cannot have initial values as it is determined by conservation law
	: S92_st cannot have initial values as it is determined by conservation law
	: S93_st cannot have initial values as it is determined by conservation law
	: S94_st cannot have initial values as it is determined by conservation law
	: S95_st cannot have initial values as it is determined by conservation law
	: S96_st cannot have initial values as it is determined by conservation law
	: S97_st cannot have initial values as it is determined by conservation law
	: S98_st cannot have initial values as it is determined by conservation law
}

BREAKPOINT {
	assign_calculated_values() : completely algebraic system loop
}

PROCEDURE assign_calculated_values() {
	time = t : an alias for the time variable, if needed.
	S98_st = S98_st_cc : conservation law for (S98_st)
	S97_st = S97_st_cc : conservation law for (S97_st)
	S96_st = S96_st_cc : conservation law for (S96_st)
	S95_st = S95_st_cc : conservation law for (S95_st)
	S94_st = S94_st_cc : conservation law for (S94_st)
	S93_st = S93_st_cc : conservation law for (S93_st)
	S92_st = S92_st_cc : conservation law for (S92_st)
	S91_st = S91_st_cc : conservation law for (S91_st)
	S90_st = S90_st_cc : conservation law for (S90_st)
	S89_st = S89_st_cc : conservation law for (S89_st)
	S88_st = S88_st_cc : conservation law for (S88_st)
	S87_st = S87_st_cc : conservation law for (S87_st)
	S86_st = S86_st_cc : conservation law for (S86_st)
	S85_st = S85_st_cc : conservation law for (S85_st)
	S84_st = S84_st_cc : conservation law for (S84_st)
	S83_st = S83_st_cc : conservation law for (S83_st)
	S82_st = S82_st_cc : conservation law for (S82_st)
	S81_st = S81_st_cc : conservation law for (S81_st)
	S80_st = S80_st_cc : conservation law for (S80_st)
	S79_st = S79_st_cc : conservation law for (S79_st)
	S78_st = S78_st_cc : conservation law for (S78_st)
	S77_st = S77_st_cc : conservation law for (S77_st)
	S76_st = S76_st_cc : conservation law for (S76_st)
	S75_st = S75_st_cc : conservation law for (S75_st)
	S74_st = S74_st_cc : conservation law for (S74_st)
	S73_st = S73_st_cc : conservation law for (S73_st)
	S72_st = S72_st_cc : conservation law for (S72_st)
	S71_st = S71_st_cc : conservation law for (S71_st)
	S70_st = S70_st_cc : conservation law for (S70_st)
	S69_st = S69_st_cc : conservation law for (S69_st)
	S68_st = S68_st_cc : conservation law for (S68_st)
	S67_st = S67_st_cc : conservation law for (S67_st)
	S66_st = S66_st_cc : conservation law for (S66_st)
	S65_st = S65_st_cc : conservation law for (S65_st)
	S64_st = S64_st_cc : conservation law for (S64_st)
	S63_st = S63_st_cc : conservation law for (S63_st)
	S62_st = S62_st_cc : conservation law for (S62_st)
	S61_st = S61_st_cc : conservation law for (S61_st)
	S60_st = S60_st_cc : conservation law for (S60_st)
	S59_st = S59_st_cc : conservation law for (S59_st)
	S58_st = S58_st_cc : conservation law for (S58_st)
	S57_st = S57_st_cc : conservation law for (S57_st)
	S56_st = S56_st_cc : conservation law for (S56_st)
	S55_st = S55_st_cc : conservation law for (S55_st)
	S54_st = S54_st_cc : conservation law for (S54_st)
	S53_st = S53_st_cc : conservation law for (S53_st)
	S52_st = S52_st_cc : conservation law for (S52_st)
	S51_st = S51_st_cc : conservation law for (S51_st)
	S50_st = S50_st_cc : conservation law for (S50_st)
	S49_st = S49_st_cc : conservation law for (S49_st)
	S47_st = S47_st_cc : conservation law for (S47_st)
	S46_st = S46_st_cc : conservation law for (S46_st)
	S45_st = S45_st_cc : conservation law for (S45_st)
	S44_st = S44_st_cc : conservation law for (S44_st)
	S43_st = S43_st_cc : conservation law for (S43_st)
	S42_st = S42_st_cc : conservation law for (S42_st)
	S41_st = S41_st_cc : conservation law for (S41_st)
	S40_st = S40_st_cc : conservation law for (S40_st)
	S39_st = S39_st_cc : conservation law for (S39_st)
	S38_st = S38_st_cc : conservation law for (S38_st)
	S37_st = S37_st_cc : conservation law for (S37_st)
	S36_st = S36_st_cc : conservation law for (S36_st)
	S35_st = S35_st_cc : conservation law for (S35_st)
	S34_st = S34_st_cc : conservation law for (S34_st)
	S33_st = S33_st_cc : conservation law for (S33_st)
	S32_st = S32_st_cc : conservation law for (S32_st)
	S31_st = S31_st_cc : conservation law for (S31_st)
	S30_st = S30_st_cc : conservation law for (S30_st)
	S29_st = S29_st_cc : conservation law for (S29_st)
	S28_st = S28_st_cc : conservation law for (S28_st)
	S27_st = S27_st_cc : conservation law for (S27_st)
	S26_st = S26_st_cc : conservation law for (S26_st)
	S25_st = S25_st_cc : conservation law for (S25_st)
	S23_st = S23_st_cc : conservation law for (S23_st)
	S22_st = S22_st_cc : conservation law for (S22_st)
	S21_st = S21_st_cc : conservation law for (S21_st)
	S20_st = S20_st_cc : conservation law for (S20_st)
	S19_st = S19_st_cc : conservation law for (S19_st)
	S18_st = S18_st_cc : conservation law for (S18_st)
	S17_st = S17_st_cc : conservation law for (S17_st)
	S16_st = S16_st_cc : conservation law for (S16_st)
	S15_st = S15_st_cc : conservation law for (S15_st)
	S14_st = S14_st_cc : conservation law for (S14_st)
	S13_st = S13_st_cc : conservation law for (S13_st)
	S12_st = S12_st_cc : conservation law for (S12_st)
	S11_st = S11_st_cc : conservation law for (S11_st)
	S10_st = S10_st_cc : conservation law for (S10_st)
	S7_st = S7_st_cc : conservation law for (S7_st)
	S6_st = S6_st_cc : conservation law for (S6_st)
	S5_st = S5_st_cc : conservation law for (S5_st)
	S4_st = S4_st_cc : conservation law for (S4_st)
	S3_st = S3_st_cc : conservation law for (S3_st)
	S2_st = S2_st_cc : conservation law for (S2_st)
	S1_st = S1_st_cc : conservation law for (S1_st)
	S0_st = S0_st_cc : conservation law for (S0_st)
	: Ion WRITE variable value updates
	pSubstratei = pSubstrate
	PKAci = PKAc
	EX0 = 5000000 : assignment for expression (EX0)
	EX1 = 1 : assignment for expression (EX1)
	EX2 = DA_basal+(1/(1+exp((-10E+10)*(time-DA_start)))*(DA_max/(exp(-tau_DA1*tau_DA2/(tau_DA2-tau_DA1)*log(tau_DA2/tau_DA1)/tau_DA1)-exp(-tau_DA1*tau_DA2/(tau_DA2-tau_DA1)*log(tau_DA2/tau_DA1)/tau_DA2))*(exp(-(time-DA_start)/tau_DA1)-exp(-(time-DA_start)/tau_DA2)))) : assignment for expression (EX2)
	S8_st = 0 : assignment for expression (S8_st)
	S9_st = 5000000 : assignment for expression (S9_st)
	S24_st = 60 : assignment for expression (S24_st)
	S48_st = 20 : assignment for expression (S48_st)
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