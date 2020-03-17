
pollutantmean <- function(directory , pollutant , id = 23 ){
    library(data.table)
    # do zmiany adres na git
    
    fullPath <-  paste0(getwd(),"\\",directory,"\\")
    
    
    # lista <- data.frame(list.files(path = "H:\\LITERATURA_i_POBRANE\\R_kurs\\R_STUDIA_USA\\rprog_data_specdata\\specdata\\", pattern = "csv"))
    # pollutant = 'nitrate'
    
    #### tworzę zmienną którą mam usunąć 
    if (pollutant == 'sulfate'){
        drop_pollutant = 'nitrate'
    } else { if (pollutant == 'nitrate') {
        drop_pollutant = 'sulfate'
    }else (print("Error"))
    }
    
    #### doklejam zera do nazwy
    
    data_analysis <- data.table()
    
    for(i in id){
        fileName <- substr(paste0("000", i,".csv"), nchar( paste0("000", i,".csv")) - 6 ,nchar( paste0("000", i,".csv")))
        tmp <- read.csv2(paste0(fullPath, fileName), sep = ',' , dec ="." )
        data_analysis <- rbind(  data_analysis, tmp)
    }
    
    
    data_analysis$sulfate <- as.numeric(data_analysis$sulfate)
    data_analysis$nitrate <- as.numeric(data_analysis$nitrate)
    
    #### wylicznaki  
    # mean(data_analysis$nitrate, na.rm = TRUE)
    data_analysis[,c(drop_pollutant)] <- NULL
    data_analysis[ID %in% id,]
    data_analysis <- data_analysis[complete.cases(data_analysis)]
    if (pollutant == 'sulfate'){
        final <- mean(data_analysis$sulfate)
    } else{
        final <-mean(data_analysis$nitrate) 
    }    
    
    
    return(final)
    
}


