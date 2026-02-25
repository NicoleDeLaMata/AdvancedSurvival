#data description:

#Variables
#id: Unique patient identifier
#time0: Start of being at risk (i.e. dialysis start date)
#time: Follow-up time (i.e. death or last known follow-up)
#deaths: indicator of death (2==CVD deaths, 3==Other death, 0==Still alive)
#status: Event indicator (1==event occurred, 0==censored)
#age: age in years at dialysis start
#malesex: indicator for male sex (1==male, 0==female)
#smoking: smoking status (C==current, N==never, F==former)
#late: referral for kidney failure was late (1==late referral, 0==Not late referral)


#-----read data
#load libraries
library(readr)
library(mstate)
library(dplyr)
library(tidyverse)
library(flexsurv)

compdeaths <- read_csv("https://raw.githubusercontent.com/NicoleDeLaMata/AdvancedSurvival/refs/heads/Data/competing_2deaths.csv")


#----------Prepare data using msprep



#----------Fit flexible parametric model with 1 internal knot



#--------Produce cumulative hazards plot



#--------Produce probability for each cause of death plot




