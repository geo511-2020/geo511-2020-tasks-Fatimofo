library(tidyverse)
temp=read_csv("https://raw.githubusercontent.com/AdamWilsonLab/GEO511/master/CS_02.csv",
              skip=1,
              na="999.90", 
              col_names = c("YEAR","JAN","FEB","MAR", # define column names 
                            "APR","MAY","JUN","JUL",  
                            "AUG","SEP","OCT","NOV",  
                            "DEC","DJF","MAM","JJA",  
                            "SON","metANN"))
view(temp)
summary(temp)
glimpse(temp)
head(temp)
tail(glimpse)

ggplot(temp, aes(YEAR, JJA))+
  geom_line() + geom_smooth() +
  labs(x="Year", y="Mean Summer Temp(C)",
       title="Annual Mean Summer Temperatures in Buffalo, NY",
       subtitle = "Summer Months include June, July, and August
Data from the Global Historical Climate Network
Blue line is a LOESS smooth")


