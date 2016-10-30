# Shiny app, life table

library(HMDHFDplus)

DNKf <- readHMDweb(CNTRY="DNK", item="fltper_1x1",
                  username="catalina_tc@hotmail.com", password = "bgk383")

DNKm <- readHMDweb(CNTRY="DNK", item="mltper_1x1",
                   username="catalina_tc@hotmail.com", password = "bgk383")

library(dplyr)

DNKf%>% mutate(Sex="F")->DNKf
DNKm%>% mutate(Sex="M")->DNKm

DNK <- rbind(DNKf, DNKm)

subset(DNK, mx==0)

for (i in 1:length(DNK$Year)){
  if(DNK$mx[i]==0){
    DNK$mx[i] <- (DNK$mx[i-1] + DNK$mx[i+1])/2
  }
}

library(tidyr)

DNK%>%
  mutate(log.mx = log(mx))%>%
  select(Sex, Year, Age, log.mx, lx, dx, ex)%>%
  gather(key=Function, value=value, 4:7)-> DNK2

unique(DNK2$Function)
DNK2$Heading[DNK2$Function=="log.mx"]="Death rates, log(mx)"
DNK2$Heading[DNK2$Function=="lx"]="Survivors, lx"
DNK2$Heading[DNK2$Function=="dx"]="Deaths, dx"
DNK2$Heading[DNK2$Function=="ex"]="Remaining life expectancy"

DNK2$YrSx <- paste(DNK2$Year, DNK2$Sex, sep="-")

save(DNK2, file="HMD_DNK_lt.Rdata")



