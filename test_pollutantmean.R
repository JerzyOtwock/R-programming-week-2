setwd("H:\\LITERATURA_i_POBRANE\\R_kurs\\R_STUDIA_USA\\rprog_data_specdata\\")
source("pollutantmean.R")
pollutantmean("specdata", "nitrate", 23) # exoected 1.280833
pollutantmean("specdata", "nitrate", 70:72) # exoected 1.706047
pollutantmean("specdata", "sulfate", 1:10) # exoected 4.064128
