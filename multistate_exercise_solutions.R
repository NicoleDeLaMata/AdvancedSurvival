#data description:

#Variables
#id: Unique patient identifier
#Tstart: Time point from
#Tstop: Time point to
#Time: Time of the transition
#from: State from (1==Active, 2==Suspended, 3==Transplant)
#to: State to (1==Active, 2==Suspended, 3==Transplant)
#trans: Transition type (1==from active to suspended, 2==from suspended to active, 3==from active to transplant)
#status: Event indicator (1==event occurred, 0==censored)
#hospunit: Hospital unit providing care (factor variable)
#age: age in years at dialysis start
#malesex: indicator for male sex (1==male, 0==female)
#late: referral for kidney failure was late (1==late referral, 0==Not late referral)


#-----read data
#load libraries
library(dplyr)
library(tidyr)
library(ggplot2)
library(survival)
library(mstate)
library(flexsurv)
library(mvna)
library(readr)


wt_trans <- read_csv("https://raw.githubusercontent.com/NicoleDeLaMata/AdvancedSurvival/refs/heads/Data/waitlist_trans.csv")

#Create as factor
wt_trans$hospunit <- factor(wt_trans$hospunit)

#----------Fit transition-specific Cox model

#Fit transition: active to suspended
cox_active_sus <- coxph(Surv(Tstart, Tstop, status) ~ hospunit + age + malesex + late, data=wt_trans, subset=(trans==1), id=id)
summary(cox_active_sus)

#Fit transition: suspended to active
cox_sus_active <- coxph(Surv(Tstart, Tstop, status) ~ hospunit + age + malesex + late, data=wt_trans, subset=(trans==2), id=id)
summary(cox_sus_active)

#Fit transition: active to transplant
cox_active_tx <- coxph(Surv(Tstart, Tstop, status) ~ hospunit + age + malesex + late, data=wt_trans, subset=(trans==3), id=id)
summary(cox_active_tx)

#--------Produce cumulative hazards plot



#--------Produce probability for each state



#----------Transition-specific flexible parametric survival model with 1 internal knot

#Fit separate models for each transition - as given by msprep
msm_active_sus <- flexsurvspline(Surv(Tstart, Tstop, status) ~ hospunit + age + malesex + late, data=wt_trans, subset=(trans==1), k=1, scale="hazard")
msm_active_sus

msm_sus_active <- flexsurvspline(Surv(Tstart, Tstop, status) ~ hospunit + age + malesex + late, data=wt_trans, subset=(trans==2), k=1, scale="hazard")
msm_sus_active

msm_active_tx <- flexsurvspline(Surv(Tstart, Tstop, status) ~ hospunit + age + malesex + late, data=wt_trans, subset=(trans==3), k=1, scale="hazard")
msm_active_tx

#--------Produce cumulative hazards plot



#--------Produce probability for each state



#--------BONUS: Expected time in state by 5 years




