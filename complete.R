
complete <- function(directory , id = c(2,4) ){
    library(data.table)
    # do zmiany adres na git
    # directory <- "specdata"
    fullPath <-  paste0(getwd(),"\\",directory,"\\")
    
    # fullPath <- ('H:\\LITERATURA_i_POBRANE\\R_kurs\\Cursera R\\specdata\\')
       
    #### doklejam zera do nazwy
    
    data_analysis <- data.table()
    # data_analysis <- read.csv2('H:\\LITERATURA_i_POBRANE\\R_kurs\\Cursera R\\specdata\\001.csv', sep = ',' , dec =".")
    
    for(i in id){
        fileName <- substr(paste0("000", i,".csv"), nchar( paste0("000", i,".csv")) - 6 ,nchar( paste0("000", i,".csv")))
        tmp <- read.csv2(paste0(fullPath, fileName), sep = ',' , dec ="." )
        data_analysis <- rbind(  data_analysis, tmp)
    }
    
    #### wylicznaki  

    # data_analysis[ID %in% id,]
    data_analysis <- data.table(na.omit(data_analysis))
    final <- data_analysis[ ,.( nobs = table(data_analysis$ID))]
    final <- final[,.(id = nobs.V1, nobs = nobs.N )]
    
    return(final)
    
}

source("complete.R")
complete("specdata")
