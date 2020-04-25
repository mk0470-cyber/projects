***********GENDARMERIE, STATE CAPACITY AND TERRORISM***************

use "C:\Users\musta\Google Drive\OTHERS\REPLICATION DATASETS\ghatak et al 2017 domestic terrorism in democratic states\Ghatak et al JCR-16-0357.dta"
sort ccode year
merge ccode year using "C:\Users\musta\Google Drive\OTHERS\REPLICATION DATASETS\daxecker 2015 torture and terrorism\UED JCR repdata finalsubm.dta"
drop if _merge==2
drop _merge
sort ccode year 
merge ccode year using "C:\Users\musta\Google Drive\OTHERS\REPLICATION DATASETS\OTHER DATASETS\ucdp civil war onset.dta"
drop if _merge==2
drop _merge
sort ccode year
merge ccode year using "C:\Users\musta\Google Drive\OTHERS\REPLICATION DATASETS\buhaug et al 2014 new measures of inequality and fractionalization\BCG_squarepegs.dta"
drop if _merge==2
drop _merge
sort ccode year
merge ccode year using "C:\Users\musta\Google Drive\OTHERS\REPLICATION DATASETS\Thyne dataset\coup data 3.dta"
drop if _merge==2
drop _merge
sort ccode year 
merge ccode year using "C:\Users\musta\Google Drive\OTHERS\REPLICATION DATASETS\peter white military participatin in government data\stata version.dta"
drop if _merge==2
drop _merge

********the empirical models********
use "C:\Users\musta\Google Drive\PUBLICATION\MY MANUSCRIPTS\gendarmerie and terrorist incidents\data.dta"
nbreg numberofgroups gendarmerie MAR incidencev414 lpopl democracy PTS_S lgdppc , robust cl(ccode)
nbreg numberofgroups gendarmerie MAR incidencev414 lpopl democracy durable PTS_S lgdppc , robust cl(ccode)
nbreg numberofgroups gendarmerie rpc MAR incidencev414 lpopl democracy PTS_S lgdppc , robust cl(ccode)
nbreg numberofgroups gendarmerie rpc gendarmeriexrpc MAR incidencev414 lpopl democracy PTS_S lgdppc , robust cl(ccode)
nbreg numberofgroups gendarmerie logrpc gendarmeriexlogrpc MAR incidencev414 lpopl democracy PTS_S lgdppc , robust cl(ccode)
nbreg gtddomestic gendarmerie logrpc gendarmeriexlogrpc MAR incidencev414 lpopl democracy PTS_S lgdppc , robust cl(ccode)
nbreg gtddomestic gendarmerie rpc gendarmeriexrpc MAR incidencev414 lpopl democracy PTS_S lgdppc , robust cl(ccode)
nbreg gtddomestic gendarmerie rpc MAR incidencev414 lpopl democracy PTS_S lgdppc , robust cl(ccode)

margins, atmeans at(gendarmerie=0 rpc=0 gendarmeriexrpc=0) at(gendarmerie=0 rpc=1 gendarmeriexrpc=0) at(gendarmerie=0 rpc=2 gendarmeriexrpc=0) at(gendarmerie=0 rpc=3 gendarmeriexrpc=0) at(gendarmerie=0 rpc=5 gendarmeriexrpc=0) at(gendarmerie=0 rpc=5 gendarmeriexrpc=0) at(gendarmerie=0 rpc=6 gendarmeriexrpc=0) 
marginsplot
margins, atmeans at(gendarmerie=1 rpc=0 gendarmeriexrpc=0) at(gendarmerie=1 rpc=1 gendarmeriexrpc=1) at(gendarmerie=1 rpc=2 gendarmeriexrpc=2) at(gendarmerie=1 rpc=3 gendarmeriexrpc=3) at(gendarmerie=1 rpc=4 gendarmeriexrpc=4) at(gendarmerie=1 rpc=5 gendarmeriexrpc=5) at(gendarmerie=1 rpc=6 gendarmeriexrpc=6) 
marginsplot

***burdaki findingler guzel, olayi military influence on politics muhabbetine kaydirabiliriz, gendarmerie yerine***
nbreg gtddomestic actmilcabshare MAR civilwar2 lpopl dem PTS_S lgdppc , robust cl(ccode)
nbreg gtddomestic military_politics_icrg MAR civilwar2 lpopl dem PTS_S lgdppc , robust cl(ccode)




******************publishing the paper*****************************************************************************************************************
use "C:\Users\musta\Google Drive\PUBLICATION\MY MANUSCRIPTS\gendarmerie and terrorist incidents\data.dta"

gen b1=gendarmerie*bureaucratic_quality_icrg
gen b2=gendarmerie*bureaufac2
gen a1=gendarmerie*bureauc_quality
gen a2=gendarmerie* bur_qua
gen a3=gendarmerie*wgi
gen a4=gendarmerie*i_wgi
gen a5=gendarmerie*ln_bureau_new
gen a6=gendarmerie*log_bur

nbreg gtddomestic gendarmerie lmtnest MAR coldwar incidencev414 PTS_S lpopl democracy lgdppc , robust cl(ccode)
nbreg gtddomestic gendarmerie bureaufac2 lmtnest MAR coldwar incidencev414 PTS_S lpopl democracy lgdppc , robust cl(ccode)
nbreg gtddomestic gendarmerie bureaufac2 b2 lmtnest MAR coldwar incidencev414 PTS_S lpopl democracy lgdppc , robust cl(ccode)

nbreg gtddomestic gendarmerie bureaucratic_quality_icrg MAR lmtnest september2001 coldwar incidencev414 PTS_A democracy lpopl lgdppc , robust cl(ccode)
nbreg gtddomestic gendarmerie bureaucratic_quality_icrg b1 MAR lmtnest september2001 coldwar incidencev414 PTS_A democracy lpopl lgdppc , robust cl(ccode)


nbreg gtddomestic gendarmerie bureaucratic_quality_icrg war2 MAR lmtnest  september2001 coldwar incidencev414 PTS_A democracy lpopl lgdppc , robust cl(ccode)
nbreg gtddomestic gendarmerie bureaucratic_quality_icrg b1 war2 MAR lmtnest  september2001 coldwar incidencev414 PTS_A democracy lpopl lgdppc , robust cl(ccode)
nbreg gtddomestic gendarmerie war2 MAR lmtnest  september2001 coldwar incidencev414 PTS_A democracy lpopl lgdppc , robust cl(ccode)

nbreg gtddomestic gendarmerie bureaucratic_quality_icrg Oil war2 MAR lmtnest  september2001 coldwar incidencev414 PTS_A democracy lpopl lgdppc , robust cl(ccode)
nbreg gtddomestic gendarmerie bureaucratic_quality_icrg b1 Oil war2 MAR lmtnest  september2001 coldwar incidencev414 PTS_A democracy lpopl lgdppc , robust cl(ccode)

xtset ccode year
xtgee gtddomestic gendarmerie bureaucratic_quality_icrg b1 Oil war2 MAR lmtnest  september2001 coldwar incidencev414 PTS_A democracy lpopl lgdppc , fam(nbinomial) corr(AR1)
xtgee gtddomestic gendarmerie bureaucratic_quality_icrg Oil war2 MAR lmtnest  september2001 coldwar incidencev414 PTS_A democracy lpopl lgdppc , fam(nbinomial) corr(AR1)
xtgee gtddomestic gendarmerie Oil war2 MAR lmtnest  september2001 coldwar incidencev414 PTS_A democracy lpopl lgdppc , fam(nbinomial) corr(AR1)

*********(final)***********

**all attacks**
xtset ccode year
xtgee attacks gendarmerie war2 lrexclpop september2001 coldwar incidencev414 PTS_A democracy lpopl lgdppc , fam(nbinomial) corr(AR1)
outreg2 using myreg.doc, replace label symbol(***, **, *)
xtgee attacks gendarmerie bureaucratic_quality_icrg war2 lrexclpop september2001 coldwar incidencev414 PTS_A democracy lpopl lgdppc , fam(nbinomial) corr(AR1)
outreg2 using myreg.doc, append label symbol(***, **, *) 
xtgee attacks gendarmerie bureaucratic_quality_icrg b1 war2 lrexclpop september2001 coldwar incidencev414 PTS_A democracy lpopl lgdppc , fam(nbinomial) corr(AR1)
outreg2 using myreg.doc, append label symbol(***, **, *) 
xtgee attacks bureaucratic_quality_icrg war2 lrexclpop september2001 coldwar incidencev414 PTS_A democracy lpopl lgdppc , fam(nbinomial) corr(AR1)
outreg2 using myreg.doc, append label symbol(***, **, *) 

**substantive effects**
margins, atmeans at(gendarmerie=(0(1)1))  
marginsplot

margins, atmeans at(gendarmerie=1 bureaucratic_quality_icrg=0 b1=0) at(gendarmerie=1 bureaucratic_quality_icrg=1 b1=1) at(gendarmerie=1 bureaucratic_quality_icrg=2 b1=2) at(gendarmerie=1 bureaucratic_quality_icrg=3 b1=3) at(gendarmerie=0 bureaucratic_quality_icrg=4 b1=4)
marginsplot

margins, atmeans at(gendarmerie=0 bureaucratic_quality_icrg=0 b1=0) at(gendarmerie=0 bureaucratic_quality_icrg=1 b1=0) at(gendarmerie=0 bureaucratic_quality_icrg=2 b1=0) at(gendarmerie=0 bureaucratic_quality_icrg=3 b1=0) at(gendarmerie=0 bureaucratic_quality_icrg=4 b1=0)






**domestic**
xtgee gtddomevents gendarmerie war2 lrexclpop september2001 coldwar incidencev414 PTS_A democracy lpopl lgdppc , fam(nbinomial) corr(AR1)
outreg2 using myreg.doc, replace label symbol(***, **, *)
xtgee gtddomevents gendarmerie bureaucratic_quality_icrg war2 lrexclpop september2001 coldwar incidencev414 PTS_A democracy lpopl lgdppc , fam(nbinomial) corr(AR1)
outreg2 using myreg.doc, append label symbol(***, **, *) 
xtgee gtddomevents gendarmerie bureaucratic_quality_icrg b1 war2 lrexclpop september2001 coldwar incidencev414 PTS_A democracy lpopl lgdppc , fam(nbinomial) corr(AR1)
outreg2 using myreg.doc, append label symbol(***, **, *) 
xtgee gtddomevents bureaucratic_quality_icrg war2 lrexclpop september2001 coldwar incidencev414 PTS_A democracy lpopl lgdppc , fam(nbinomial) corr(AR1)
outreg2 using myreg.doc, append label symbol(***, **, *) 

**transnational**
xtgee transnationalattack gendarmerie war2 lrexclpop september2001 coldwar incidencev414 PTS_A democracy lpopl lgdppc , fam(nbinomial) corr(AR1)
outreg2 using myreg.doc, replace label symbol(***, **, *)
xtgee transnationalattack gendarmerie bureaucratic_quality_icrg war2 lrexclpop september2001 coldwar incidencev414 PTS_A democracy lpopl lgdppc , fam(nbinomial) corr(AR1)
outreg2 using myreg.doc, append label symbol(***, **, *) 
xtgee transnationalattack gendarmerie bureaucratic_quality_icrg b1 war2 lrexclpop september2001 coldwar incidencev414 PTS_A democracy lpopl lgdppc , fam(nbinomial) corr(AR1)
outreg2 using myreg.doc, append label symbol(***, **, *) 
xtgee transnationalattack bureaucratic_quality_icrg war2 lrexclpop september2001 coldwar incidencev414 PTS_A democracy lpopl lgdppc , fam(nbinomial) corr(AR1)
outreg2 using myreg.doc, append label symbol(***, **, *) 



**robustness**
zinb attacks gendarmerie war2 lrexclpop september2001 coldwar incidencev414 PTS_A democracy lpopl lgdppc, inflate(gendarmerie war2 lrexclpop september2001 coldwar incidencev414 PTS_A democracy lpopl lgdppc)
outreg2 using myreg.doc, replace label symbol(***, **, *)
zinb attacks gendarmerie bureaucratic_quality_icrg war2 lrexclpop september2001 coldwar incidencev414 PTS_A democracy lpopl lgdppc, inflate(gendarmerie bureaucratic_quality_icrg war2 lrexclpop september2001 coldwar incidencev414 PTS_A democracy lpopl lgdppc)
outreg2 using myreg.doc, append label symbol(***, **, *)
zinb attacks gendarmerie bureaucratic_quality_icrg b1 war2 lrexclpop september2001 coldwar incidencev414 PTS_A democracy lpopl lgdppc, inflate(gendarmerie bureaucratic_quality_icrg b1 war2 lrexclpop september2001 coldwar incidencev414 PTS_A democracy lpopl lgdppc)
outreg2 using myreg.doc, append label symbol(***, **, *)


**summary statistics**
outreg2 using x.doc, replace sum(log) keep(gtddomevents gendarmerie bureaucratic_quality_icrg war2 lrexclpop september2001 coldwar incidencev414 PTS_A democracy lpopl lgdppc)


**propensity score matching**
teffects psmatch (attacks) (gendarmerie war2 lrexclpop september2001 coldwar incidencev414 PTS_A democracy lpopl lgdppc)
teffects psmatch (gtddomevents) (gendarmerie war2 lrexclpop september2001 coldwar incidencev414 PTS_A democracy lpopl lgdppc)
teffects psmatch (gtddomevents) (gendarmerie war2 lrexclpop september2001 coldwar incidencev414 PTS_A democracy lpopl lgdppc), atet
teffects psmatch (attacks) (gendarmerie war2 lrexclpop september2001 coldwar incidencev414 PTS_A democracy lpopl lgdppc), atet

recode gtddomestic (1/5=1) (6/10=2) (11/20=3) (21/50=4) (50/1252=5), gen(z)
drop if z==0
histogram z if gendarmerie==0, percent
histogram z if gendarmerie==1, percent
tab z if gendarmerie==0
tab z if gendarmerie==1

bysort year: egen allterror=mean(attacks) if gendarmerie==0
bysort year: egen allterror_new=mean(attacks) if gendarmerie==1
tabstat allterror
tabstat allterror_new

bysort year: egen avgterror=mean(gtddomestic) if gendarmerie==0
bysort year: egen avgterror_new=mean(gtddomestic) if gendarmerie==1
tabstat avterror
tabstat avgterror_new

bysort year: egen allterror_0=mean(attacks) if gendarmerie==1 & bureaucratic_quality_icrg==0
bysort year: egen allterror_05=mean(attacks) if gendarmerie==1 & bureaucratic_quality_icrg==0.5
bysort year: egen allterror_1=mean(attacks) if gendarmerie==1 & bureaucratic_quality_icrg==1
bysort year: egen allterror_15=mean(attacks) if gendarmerie==1 & bureaucratic_quality_icrg==1.5
bysort year: egen allterror_2=mean(attacks) if gendarmerie==1 & bureaucratic_quality_icrg==2
bysort year: egen allterror_25=mean(attacks) if gendarmerie==1 & bureaucratic_quality_icrg==2.5
bysort year: egen allterror_3=mean(attacks) if gendarmerie==1 & bureaucratic_quality_icrg==3
bysort year: egen allterror_35=mean(attacks) if gendarmerie==1 & bureaucratic_quality_icrg==3.5
bysort year: egen allterror_4=mean(attacks) if gendarmerie==1 & bureaucratic_quality_icrg==4
tabstat allterror_0 allterror_05 allterror_1 allterror_15 allterror_2 allterror_25 allterror_3 allterror_35 allterror_4


bysort year: egen avgterror_0=mean(gtddomestic) if gendarmerie==1 & bureaucratic_quality_icrg==0
bysort year: egen avgterror_05=mean(gtddomestic) if gendarmerie==1 & bureaucratic_quality_icrg==0.5
bysort year: egen avgterror_1=mean(gtddomestic) if gendarmerie==1 & bureaucratic_quality_icrg==1
bysort year: egen avgterror_15=mean(gtddomestic) if gendarmerie==1 & bureaucratic_quality_icrg==1.5
bysort year: egen avgterror_2=mean(gtddomestic) if gendarmerie==1 & bureaucratic_quality_icrg==2
bysort year: egen avgterror_25=mean(gtddomestic) if gendarmerie==1 & bureaucratic_quality_icrg==2.5
bysort year: egen avgterror_3=mean(gtddomestic) if gendarmerie==1 & bureaucratic_quality_icrg==3
bysort year: egen avgterror_35=mean(gtddomestic) if gendarmerie==1 & bureaucratic_quality_icrg==3.5
bysort year: egen avgterror_4=mean(gtddomestic) if gendarmerie==1 & bureaucratic_quality_icrg==4
tabstat avgterror_0 avgterror_05
tabstat avgterror_0 avgterror_05 avgterror_1 avgterror_15
tabstat avgterror_0
tabstat avgterror_05
tabstat avgterror_1
tabstat avgterror_15
tabstat avgterror_2
tabstat avgterror_25
tabstat avgterror_3
tabstat avgterror_35
tabstat avgterror_4


******correlation matrix************
estpost correlate gendarmerie war2 lrexclpop september2001 coldwar incidencev414 PTS_A democracy lpopl lgdppc, matrix listwise
est store c1
esttab using easy1.rtf, unstack not noobs compress

********why some countries have gendarmeries others don't?****************
logit gendarmerie attacks colbrit colfra PTS_A incidencev414 war2 lmtnest lpopl lgdppc democracy, robust cl(ccode)
logit gendarmerie gtddomestic colbrit colfra PTS_A incidencev414 war2 lmtnest lpopl lgdppc democracy, robust cl(ccode)
logit gendarmerie transnational colbrit colfra PTS_A incidencev414 war2 lmtnest lpopl lgdppc democracy, robust cl(ccode)
logit gendarmerie attacks PTS_A incidencev414 war2 lpopl lgdppc democracy september2001 coldwar, robust cl(ccode)
logit gendarmerie attacks PTS_A incidencev414 lmtnest war2 lpopl lgdppc democracy september2001 coldwar, robust cl(ccode)
