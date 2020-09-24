library(ggplot2)
library(dplyr)
library(gapminder)

gapminderMinusKuwait <- gapminder %>%
  filter(!country %in% c("Kuwait"))
#Plot1
png(filename = "Plot1.png", height=5, width = 15, 
    units ="in", res=300)
ggplot(gapminderMinusKuwait, aes(lifeExp, gdpPercap)) +
  geom_point(aes(size=pop/100000, color=continent)) + 
  theme_bw() + scale_y_continuous(trans="sqrt")+ 
  facet_wrap(~year,nrow=1) + 
  labs(x="Life Expectancy", y="GDP Per Capita",
       title ="Wealth and life expectancy through time", 
       size="Population(100K)")
dev.off()

#Plot2

gapminder_continent <- gapminderMinusKuwait %>%
  group_by(continent, year) %>%
  summarize(gdpPercapweighted = 
              weighted.mean(x = gdpPercap, w = pop),
            pop = sum(as.numeric(pop)))  

png(filename = "Plot2.png", height=5, width = 15, 
    units ="in", res=300)
ggplot(gapminderMinusKuwait,
       aes(x=year, y=gdpPercap, 
           color=continent, group=country))+
  
  geom_point(aes(size=pop/100000)) + 
  geom_line() +
  
  geom_point(data=gapminder_continent,
             aes(x=year, y=gdpPercapweighted, size=pop/100000),
             inherit.aes=FALSE) + 
  
  
  geom_line(data=gapminder_continent,
            aes(x=year, y=gdpPercapweighted), 
            inherit.aes=FALSE) + 
  
  facet_wrap(~continent, nrow = 1) + theme_bw() +
  labs(x="year", y= "GDP Per Capita", 
       size="Population(100k)") 
dev.off()





