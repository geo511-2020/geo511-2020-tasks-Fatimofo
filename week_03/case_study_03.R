library(ggplot2)
library(dplyr)
library(gapminder)

gapminderMinusKuwait <- gapminder %>%
  filter(!country %in% c("Kuwait"))
#Plot1
png(filename = "GDP Vs Life Expectancy.png", height=5, width = 15, 
    units ="in",res = 72)
ggplot(gapminderMinusKuwait, aes(lifeExp, gdpPercap)) +
  geom_point(aes(size=pop/100000, color=continent)) + 
  theme_bw() + scale_y_continuous(trans="sqrt")+ 
  facet_wrap(~year,nrow=1) + 
  labs(x="Life Expectancy", y="GDP Per Capita",
       title ="Wealth and life expectancy through time", 
       size="Population(100K)")
dev.off()

#Plot2
#Giving me a headache, seems impossible to figure out.
#Tried to cheat but seems no one figured it out.Sighs.
#The error occurs on adding gapminder_continent to the geom
gapminder_continent <- gapminderMinusKuwait %>%
  group_by(continent, year) %>%
  summarize(gdpPercapweighted = weighted.mean(x = gdpPercap, w = pop),
            pop = sum(as.numeric(pop)))  

ggplot(gapminderMinusKuwait,aes(x=year, y=gdpPercap)) + 
  geom_point(aes(size=pop/100000, color=continent)) + 
  geom_line(aes(color=continent, group=country)) +
  facet_wrap(~continent, nrow = 1) + theme_bw() +
  labs(x="year", y= "GDP Per Capita", size="Population(100k)") +
  expand_limits(y=0) +
  geom_line(gapminder_continent,
            aes(year, gdpPercapweighted, color="black", inherit.aes=FALSE)) + 
  geom_point(gapminder_continent,
             aes(year, gdpPercapweighted, color="black", inherit.aes=FALSE)) 




