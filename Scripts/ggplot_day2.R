library(tidyverse)

gapminder <- read_csv("Rawdata/gapminder.csv")
gapminder_1977 <- filter(gapminder_1977, year == 1977)

ggplot(data = gapminder_1977,
       mapping = aes(x = gdpPercap, y = lifeExp, 
                     colour = continent, size = pop))+
       geom_point()+scale_x_log10()

#could use
#gapminder_1977 %>% ggplot(mapping = aes(x = gdpPercap, y = lifeExp, 
#colour = continent, size = pop))+
  #geom_point()+scale_x_log10()

ggplot(data = gapminder_1977,
       mapping = aes(x = pop, y =gdpPercap, colour = continent, size=lifeExp))+
  geom_point()+scale_x_log10()+scale_y_log10()

gapminder_1977 %>% 
  ggplot() +
  geom_point(mapping = aes(x=gdpPercap, y = lifeExp, colour = continent,
                            size = pop)) +
  geom_line(mapping = aes(x =gdpPercap, y = lifeExp))+
  scale_x_log10()

?geom_point
vignette("ggplot2-specs")

gapminder_1977 %>% 
  ggplot() +
  geom_point(mapping = aes(x=gdpPercap, y = lifeExp, alpha = continent,
                           colour = pop)) +
  geom_line(mapping = aes(x =gdpPercap, y = lifeExp))+
  scale_x_log10()


gapminder_1977 %>% 
  ggplot(mapping = aes(x=gdpPercap, y = lifeExp, colour = continent,
                       size = pop)) +
  geom_point(colour='blue', size = 5) +
  scale_x_log10()


gapminder_1977 %>% 
  ggplot(mapping = aes(x=gdpPercap, y = lifeExp, colour = continent,
                       size = pop)) +
  geom_point(colour='purple', size=3) +
  scale_x_log10()

gapminder_1977 %>% 
  ggplot(mapping = aes(x=gdpPercap, y = lifeExp, colour = continent,
                       size = pop)) +
  geom_point(colour='purple', shape=8) +
  geom_line(colour='grey', alpha=1/10)
  
  scale_x_log10()
  
  #Kerensa's favorite, alpha is transparency
  gapminder_1977 %>% 
    ggplot(mapping = aes(x=gdpPercap, y = lifeExp, shape = continent,
                         size = pop)) +
    geom_point(alpha=.4)+
  scale_x_log10()
  
  gapminder_1977 %>% 
    ggplot(mapping = aes(x=gdpPercap, y = lifeExp, colour = continent,
                         size = pop)) +
    geom_point(alpha=.4)+
    scale_x_log10()

  
  gapminder %>% ggplot(mapping=aes(x=year, y=lifeExp, colour=continent))+
    geom_point(alpha=.4)
  
  #stephen's answer
  #ggplot(<DATA>,<AESTHETIC MAPPINGS>)+<GEOMETRY LAYER>+<GEOMETRY LATER>
  
  gapminder %>% ggplot(aes(x=year, y=lifeExp, colour=continent, group=country))+
    geom_line()+
  geom_point(colour='black')
  
  gapminder %>% ggplot(aes(x=year, y=lifeExp, colour=continent, group=country))+
    geom_line()+
    geom_point(colour='black', alpha=.3)
  
  
  gapminder %>% ggplot(aes(x=year, y=lifeExp, colour=continent, group=country))+
    geom_point(colour='black', alpha=.3)+geom_line()
  
  #alternative
  
  gapminder %>% ggplot(aes(x=year, y=lifeExp, group=country))+
    geom_line(mapping=aes(colour=continent))+
    geom_point(alpha=.3)
#try other geom, check the cheat sheet
  
  #adding in statistical information to plots
  
  #adding a trendline (linear model)
  gapminder %>% ggplot(aes(x = gdpPercap, y = lifeExp))+
    geom_point(alpha=0.3, colour="blue", size=0.5)+
    scale_x_log10()+
    geom_smooth(method= "lm", size=1, colour ="red")
  
  #smooth line for continent plus overall trendline
  
  gapminder %>% ggplot(aes(x = gdpPercap, y = lifeExp, colour=continent))+
    geom_point(alpha=0.3, size=0.5, shape=15)+
    scale_x_log10()+
    geom_smooth(method="lm", size=1)+
geom_smooth(method="lm", colour="blue")  
  
  #or
  
  gapminder %>% ggplot(aes(x = gdpPercap, y = lifeExp))+
    geom_point(aes(colour=continent),alpha=0.3, size=0.5, shape=15)+
    scale_x_log10()+
    geom_smooth(aes(colour=continent), method="lm", size=1)+
    geom_smooth(method="lm") #no colour for continent
  
  #Scales
  
  #this is the default
  gapminder %>% ggplot(aes(x = year, y = lifeExp, colour=continent))+
    geom_point()
  
  gapminder %>% ggplot(aes(x = year, y = lifeExp, colour=continent))+
    geom_point()+
    scale_colour_manual(values=c("red","green","blue","purple", "black"))
  
  #shows the possible scales
  colours()
  
  scale_colour_brewer()
  
  gapminder %>% ggplot(aes(x = gdpPercap, y = lifeExp, colour=continent))+
    geom_point(alpha=0.3, size=0.5, shape=15)+
    scale_x_log10()+
    scale_colour_brewer(palette = "Set2")+
    geom_smooth(method="lm", size=1)
    
  
  gapminder %>% ggplot(aes(x = gdpPercap, y = lifeExp, colour=continent))+
    geom_point(alpha=0.3, size=0.5, shape=15)+
    scale_x_log10()+
    scale_colour_brewer(palette = "Dark2")+
    geom_smooth(method="lm", size=1)
  
  ?scale_color_brewer
  
  #how to deal with visual clutter , separating plots
  
a_countries <- filter(gapminder, str_starts(country, "A"))

ggplot(a_countries, mapping=aes(x=year, y=lifeExp, colour=continent, group=country))+
  geom_line()+
  facet_wrap(~country)


ggplot(data = gapminder,
       mapping = aes(x = gdpPercap, y = lifeExp, 
                     colour = continent, size = pop))+
  geom_point()+scale_x_log10()+
facet_wrap(~continent)

ggplot(data = gapminder,
       mapping = aes(x = gdpPercap, y = lifeExp, 
                     colour = continent, size = pop))+
  geom_point(size=0.5)+scale_x_log10()+scale_color_brewer(palette = 'Set2')+
  facet_wrap(~year)

#stephens plot
gapminder %>% 
ggplot(mapping=aes(x=gdpPercap, y=lifeExp, 
                             colour=continent, size=pop))+
         geom_point()+
         scale_x_log10()+
        facet_wrap(~year)


#ggplot(<DATA>< <AESTHETICS>)+<GEOM>+<GEOM>+<SCALES>+<FACETS>

#Challenge 13
#Create a density plot of population, filled by continent.

#Advanced:Transform the x axis to better visualise the data spread.
#Add a facet layer to panel the density plots by year.

gapminder  %>%  ggplot(aes( x=pop, colour=continent,group=continent))+
  geom_density()+
  scale_x_log10()

gapminder  %>%  ggplot(aes( x=pop, colour=continent,group=continent))+
  geom_density()+
  scale_x_log10()+
  facet_wrap(~year)

gapminder  %>%  ggplot(aes( x=pop, colour=continent,group=continent))+
  geom_density()+
  scale_x_log10()+
  facet_wrap(~year)

?geom_density

#Challenge 14:
#Use the agridat package to visualise some agricultural data.

#Explore the blackman.wheat dataset from agridat. 
#Generate a plot that shows the effect of fertiliser treatment 
#across genotypes (gen) and sites (loc).

install.packages("agridat")
library(agridat)
b_wheat <- blackman.wheat

b_wheat %>% ggplot(mapping=aes(x=loc, y=yield, colour=nitro))+
  geom_point()+
  facet_wrap(~gen)

b_wheat %>% ggplot(mapping=aes(x=gen, y=yield, colour=nitro))+
  geom_point()+
  facet_wrap(~loc)


b_wheat %>% ggplot(mapping=aes(x=nitro, y=yield, group=gen))+
  geom_point()+
  geom_line(aes(colour=gen), alpha=0.6)+
facet_wrap(~loc)

######day3 of ggplot########
#Lost everything:(
#from Trijntje
roughplot <- ggplot(a_countries, aes(x = year, y = lifeExp, colour = continent)) +
  geom_line() +
  facet_wrap(~country)



roughplot +
  labs(title = "Figure 1", 
       x = "Year", 
       y = "Life Expectancy",
       colour = "Continent")



#change source include gapminder data and change title (I did subtitle,
# KM did caption)
roughplot +
  labs(title = "Growth in life expectancy for 'A' countries", 
       x = "Year", 
       y = "Life Expectancy",
       colour = "Continent",
       subtitle = "source: Gapminder Data")

roughplot +
  labs(title = "Growth in life expectancy for 'A' countries", 
       x = "Year", 
       y = "Life Expectancy",
       colour = "Continent",
       caption = "source: Gapminder Data")

roughplot +
  labs(title = "Growth in life expectancy for 'A' countries", 
       x = "Year", 
       y = "Life Expectancy",
       colour = "Continent",
       caption = "source: gapminder data")



roughplot +
  labs(title = "Growth in life expectancy for 'A' countries", 
       x = "Year", 
       y = "Life Expectancy",
       colour = "Continent",
       caption = "source: gapminder data") + 
  theme_bw() +
  theme(
    panel.grid.minor = element_blank(),
    plot.title = element_text(face = "bold")
  )
#challenge applying theme
roughplot +
  labs(title = "Growth in life expectancy for 'A' countries", 
       x = "Year", 
       y = "Life Expectancy",
       colour = "Continent",
       caption = "source: gapminder data") + 
  theme_bw() + 
  theme(
    strip.background = element_blank(),
    panel.grid.major = element_line(size = 1),
    axis.title  = element_text(size  = 10, colour = "blue"),
    legend.position = "bottom"
  )



#check out theme options
?theme



lifeExp_plot <- roughplot +
  labs(title = "Growth in life expectancy for 'A' countries", 
       x = "Year", 
       y = "Life Expectancy",
       colour = "Continent",
       caption = "source: gapminder data") + 
  theme_bw() + 
  theme(
    strip.background = element_blank(),
    panel.grid.major = element_line(size = 1),
    axis.title  = element_text(size  = 10, colour = "blue"),
    legend.position = "bottom"
  )



#saving files
ggsave(filename = "results/lifeExp.png" , 
       plot = lifeExp_plot,
       width = 12, height = 10, dpi = 300, units = "cm")



ggsave(filename = "results/lifeExp2.png" , 
       plot = lifeExp_plot,
       width = 5, height = 20, dpi = 300, units = "cm")

ggsave(filename = "results/lifeExp3.png" , 
       plot = lifeExp_plot,
       width = 20, height = 20, dpi = 300, units = "cm")



#cowplot
install.packages("cowplot")
library(cowplot)



plot1 <- ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point()
plot2 <- ggplot(gapminder, aes(x = continent, y = lifeExp)) +
  geom_boxplot()
plot3 <- ggplot(gapminder, aes(x = gdpPercap, y = pop)) +
  geom_point()
plot4 <- ggplot(gapminder, aes(x = lifeExp, y = pop)) +
  geom_point()



plot_grid(plot1, plot2, plot3, plot4)

#relative to each other 
plot_grid(plot1, plot2, plot3, plot4, rel_heights = c(1,3),
          rel_widths = c(4,1))



#labels in capitals
plot_grid(plot1, plot2, plot3, plot4, labels = "AUTO")    



#labels in regular
plot_grid(plot1, plot2, plot3, plot4, labels = "auto")

setwd("C:/Users/rat05a/DATA School FOCUS/Learning_ggplot/")

install.packages("cowplot")

library(cowplot)
plot1 <- ggplot(gapminder, aes(x=gdpPercap, y=lifeExp))+geom_point()
plot2 <- ggplot(gapminder, aes(x=continent, y=lifeExp))+geom_boxplot()
plot3 <- ggplot(gapminder, aes(x=gdpPercap, y=pop))+geom_point()
plot4 <- ggplot(gapminder, aes(x=lifeExp, y=pop))+geom_point()

plot_grid(plot1, plot2, plot3, plot4, rel_heights = c(1, 3),
          rel_widths =c(4,1))

plot_grid(plot1, plot2, plot3, plot4, labels="auto")

library(tidyverse)
setwd("C:/Users/rat05a/DATA School FOCUS/Learning_ggplot/")
gapminder <- read_csv("Rawdata/gapminder.csv") 
gapminder_Australia <-  filter(gapminder,country=="Australia")
view(gapminder_Australia)
ggplot(gapminder_Australia)+aes(x=year, y=pop)+geom_line()+scale_x_log10()
