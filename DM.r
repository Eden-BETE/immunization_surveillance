library(dplyr)
library(tidyr)
library(lubridate)

data_cleaning = function(path) {
    data_df = read.csv(path)
    colnames(data_df) <- gsub("^X", "", colnames(data_df))

    data_df_long <-  pivot_longer(data_df, cols = 5:ncol(data_df),  names_to = "year", values_to = "coverage")
    return(data_df_long)
}

bcg_df = data_cleaning("Unicef Databases/BCG.csv")
dtp1_df = data_cleaning("Unicef Databases/DTP1.csv")
hepb3_df = data_cleaning("Unicef Databases/HEPB3.csv")
hepbb_df = data_cleaning("Unicef Databases/HEPBB.csv")
hib3_df = data_cleaning("Unicef Databases/HIB3.csv")
ipv1_df = data_cleaning("Unicef Databases/IPV1.csv")
ipv2_df = data_cleaning("Unicef Databases/IPV2.csv")
mcv1_df = data_cleaning("Unicef Databases/MCV1.csv")
mcv2_df = data_cleaning("Unicef Databases/MCV2.csv")
menga_df = data_cleaning("Unicef Databases/MENGA.csv")
pcv3_df = data_cleaning("Unicef Databases/PCV3.csv")
pol3_df = data_cleaning("Unicef Databases/POL3.csv")
rcv1_df = data_cleaning("Unicef Databases/RCV1.csv")
dtp3_df = data_cleaning("Unicef Databases/DTP3.csv")




bcg_df
dtp1_df

df_combined <- bind_rows(bcg_df, dtp1_df, hepb3_df, hepbb_df, hib3_df, ipv1_df, ipv2_df, mcv1_df, mcv2_df, menga_df, pcv3_df, pol3_df, rcv1_df, dtp3_df)
write.csv(df_combined, "combined_vaccine_coverage.csv", row.names = FALSE)
