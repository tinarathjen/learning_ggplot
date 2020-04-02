library(tidyverse)

gapminder <- read_csv("Rawdata/gapminder.csv")
gapminder_1977 <- filter(gapminder, year==1977)
ggplot(
  data=gapminder_1977, 
  mapping=aes(x = gdpPercap, y = lifeExp, colour = continent, size = pop)
 ) +geom_point()

# ggplot(<DATA>,<AESTHETICS MAPPINGS>)+<GEOMETRY LAYER> + <GEOMETRY LAYER>


ggplot(
  data=gapminder_1977, 
  mapping=aes(x = gdpPercap, y = lifeExp, colour = continent, size = pop)
) +geom_point()+
  scale_x_log10()

##TRy new variable combinations
#ggplot(gapminder_1977, aes(x = <VAR1>, y = <VAR2>, colour = <VAR3>)) + geom_point()
#variables - country, pop, continent, lifeExp, and gdpPercap.

ggplot(gapminder_1977, mapping=aes(x = lifeExp, y=gdpPercap, colour=year, size=pop)) + 
  geom_point()
ggplot(gapminder, mapping=aes(x = year, y=lifeExp, colour=continent)) + 
  geom_point()+scale_y_log10()

gapminder_year <- gapminder %>%  group_by(year)
ggplot(gapminder_year, mapping=aes(x = continent, y=lifeExp, colour=pop)) + 
  geom_point()+scale_y_log10()
