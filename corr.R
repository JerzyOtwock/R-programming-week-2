
corr <- function(directory, threshold = 0 ){
    library(data.table)
    library(tidyverse)

    df <-
        list.files(path = paste("./",directory,"/", sep = ""),
                   pattern = "*.csv", 
                   full.names = T) %>%
        map_df(~read_csv(.))
    df_bez_na <- na.omit(df)
    dtable <- data.table(df_bez_na)
    dtable_nobs <-     dtable[, ':='(n_obs = length(sulfate)), by = ID]
    dtable_corr <-      dtable_nobs[n_obs > threshold,.(CORR = cor(nitrate, sulfate)) , by = ID]
    output <- as.vector(dtable_corr$CORR)
    
    return(output)
    
}



