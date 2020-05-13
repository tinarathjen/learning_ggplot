library(tidyverse)

setwd("C:/Users/rat05a/DATA School FOCUS/Learning_ggplot/")

#read gapminder and filter 1977 data

gapminder <- read_csv("Rawdata/gapminder.csv")

glimpse(gapminder)
gapminder1977 <- filter(gapminder, year=="1977")

#ggplot, basic

ggplot(data=gapminder1977, mapping=aes(x=gdpPercap, y=lifeExp, colour=continent, size=pop))+
  geom_point()+scale_x_log10()


#Challenge 4


ggplot(data=gapminder, mapping=aes(x=year, y=lifeExp, colour=continent))+
  geom_point()


ggplot(data=gapminder1977, mapping=aes(x=pop, y=lifeExp, colour=continent))+
  geom_point()+scale_x_log10()



ggplot(data=gapminder1977, mapping=aes(x=pop, y=gdpPercap, colour=lifeExp))+
  geom_point()+scale_x_log10()


#Challenge 5
?geom_point

#Aesthetics
#geom_point() understands the following aesthetics (required aesthetics are in bold):
  
  #x  y alpha colour  fill  group shape size  stroke

#alpha=transparency

vignette("ggplot2-specs")

ggplot(data=gapminder1977, mapping=aes(x=gdpPercap, y=lifeExp, size=pop))+
  geom_point(colour="blue")+scale_x_log10()

ggplot(data=gapminder1977, mapping=aes(x=gdpPercap, y=lifeExp, size=pop))+
  geom_point(colour="blue", shape=2)+scale_x_log10()

ggplot(data=gapminder1977, mapping=aes(x=gdpPercap, y=lifeExp, size=pop))+
  geom_point(colour="blue", alpha=0.5)+scale_x_log10()

ggplot(data=gapminder1977, mapping=aes(x=gdpPercap, y=lifeExp, size=pop))+
  geom_point(colour="blue", stroke=2)+scale_x_log10()

#Challenge 6

ggplot(data=gapminder1977, mapping=aes(x=gdpPercap, y=lifeExp, colour=continent, size=pop))+
         geom_point()+
         scale_x_log10()

ggplot(data=gapminder1977, mapping=aes(x=gdpPercap, y=lifeExp, colour=continent, size=pop))+
  geom_point(colour="green")+
  scale_x_log10()

#hee hee
ggplot(data=gapminder1977, mapping=aes(x=gdpPercap, y=lifeExp, colour=continent, size=pop))+
  geom_point(shape="6")+
  scale_x_log10()

#try again
ggplot(data=gapminder1977, mapping=aes(x=gdpPercap, y=lifeExp, colour=continent, size=pop))+
  geom_point(shape=6)+
  scale_x_log10()

ggplot(data=gapminder1977, mapping=aes(x=gdpPercap, y=lifeExp, colour=continent, size=pop))+
  geom_point(shape=8, colour="blue")+
  scale_x_log10()

#Challenge 7

ggplot(data=gapminder, mapping=aes(x=year, y=lifeExp, colour=continent))+
  geom_point()

ggplot(data=gapminder, mapping=aes(x=year, y=lifeExp, colour=continent))+
  geom_point(shape=8, alpha=0.4)

#geom_line (#what does group do?? tells ggplot we want each country to have its own line)
ggplot(data=gapminder, mapping=aes(x=year, y=lifeExp, group=country,colour=continent))+
  geom_line()

#Challenge 8

ggplot(data=gapminder, mapping=aes(x=year, y=lifeExp, group=country,colour=continent))+
  geom_line()+
  geom_point(colour="black")

ggplot(data=gapminder, mapping=aes(x=year, y=lifeExp, group=country,colour=continent))+
 geom_point(colour="black")+
  geom_line()

#other types of plots

ggplot(data=gapminder, mapping=aes(x=year, y=lifeExp))+
         geom_point()

ggplot(data=gapminder, mapping=aes(x=year, y=lifeExp,group=country, colour=continent))+
  geom_line()

ggplot(data=gapminder, mapping=aes(x=lifeExp, y=pop))+
  geom_area()

#one variable
ggplot(data=gapminder, mapping=aes(lifeExp))+
  geom_histogram(binwidth=2,colour="blue", alpha=0.5)

ggplot(data=gapminder, mapping=aes(lifeExp))+
  geom_density(binwidth=2, colour="blue", alpha=0.5)

ggplot(data=gapminder, mapping=aes(lifeExp))+
  geom_dotplot()

ggplot(data=gapminder, mapping=aes(lifeExp))+
  geom_bar()

#two variable, one discrete, one continuous

ggplot(data=gapminder, mapping=aes(x=continent, y=lifeExp))+
  geom_boxplot()

#TRansformation and statistics

ggplot(data=gapminder, mapping=aes(x=gdpPercap, y=lifeExp))+geom_point(alpha=0.5)

ggplot(data=gapminder, mapping=aes(x=gdpPercap, y=lifeExp))+geom_point(alpha=0.5)+
  scale_x_log10()

ggplot(data=gapminder, mapping=aes(x=gdpPercap, y=lifeExp))+geom_point(alpha=0.5)+
  scale_x_log10()+
  geom_smooth(method="lm", size=0.5)

#Challenge9

ggplot(data=gapminder, mapping=aes(x=gdpPercap, y=lifeExp))+
  geom_point(colour="blue",alpha=0.5, size=1)+
  scale_x_log10()+
  geom_smooth(method="lm", size=0.5, colour="red")

#Challenge 10
ggplot(data=gapminder, mapping=aes(x=gdpPercap, y=lifeExp, colour=continent))+
  geom_point(alpha=0.5, shape=3,size=1)+
  scale_colour_brewer(palette="Set1")+
  scale_x_log10()+
  geom_smooth(method="lm", size=0.5, colour="black")

?scale_color_brewer


ggplot(data=gapminder, mapping=aes(x=gdpPercap, y=lifeExp, colour=continent))+
  geom_point(alpha=0.5, shape=1,size=1)+
  scale_colour_manual(values=c("pink","blue","purple","red","magenta"))+
  scale_x_log10()+
  geom_smooth(method="lm", size=0.5, colour="black")


colours()

ggplot(data=gapminder, mapping=aes(x=gdpPercap, y=lifeExp, colour=continent))+
  geom_point(alpha=0.5, shape=6,size=0.5)+
  scale_colour_manual(values=c("tomato4","yellow4","blue","turquoise4","black"))+
  scale_x_log10()+
  geom_smooth(method="lm", size=0.5, colour="black")

#facet_wraps
a_countries <- filter(gapminder, str_starts(country, "A"))

ggplot(data = a_countries, mapping=aes(x=year, y=lifeExp, colour=continent))+geom_line()+facet_wrap(~country)

#Challenge 12
ggplot(data=gapminder1977, mapping=aes(x=gdpPercap, y=lifeExp, colour=continent, size=pop))+
  geom_point()+scale_x_log10()


ggplot(data=gapminder, mapping=aes(x=gdpPercap, y=lifeExp, colour=continent, size=pop))+
  geom_point()+
  scale_x_log10()+
  facet_wrap(~year)

#Challenge13
ggplot(data=gapminder, mapping=aes(pop, fill=continent))+
  geom_density(alpha=0.5)+scale_x_log10()+
  facet_wrap(~year)

#Challenge 14 agridat package, done elsewhere
library(agridat)
b_wheat <- blackman.wheat
glimpse(b_wheat)
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

b_wheat <- mutate(b_wheat, (nitro = as.factor(nitro))) %>% mutate(nitro=fct_relevel(nitro, c("L", "H")))




b_wheat %>% ggplot(mapping=aes(x=loc, y=yield, colour=nitro))+
  geom_point()+
  facet_wrap(~gen)

b_wheat %>% ggplot(mapping=aes(x=gen, y=yield, colour=nitro))+
  geom_point()+
  facet_wrap(~loc)

b_wheat %>% ggplot(mapping=aes(x=fct_relevel(nitro, c("L","H")), y=yield, group=gen))+
  geom_point()+
  geom_line(aes(colour=gen), alpha=0.6)+
  facet_wrap(~loc)

b_plot <- b_wheat %>% ggplot(mapping=aes(x=fct_relevel(nitro, c("L","H")), y=yield, group=gen))+
  geom_point()+
  geom_line(aes(colour=gen), alpha=0.6)+
  facet_wrap(~loc)

b_plot+
  labs(title="Plot yields of current Australian cultivars grown with two different nitrogen concentrations across 7 sites",
       x="Nitrogen Concentration",
       y="Yield",
       colour="Genotype")

#Preparing plots for display
#(assigning plot to a variable)
rough_plot <- ggplot(data=a_countries, aes(x=year, y=lifeExp, colour=continent))+
  geom_line()+
  facet_wrap(~country)

rough_plot+labs(
  title="Figure 1", 
  x="Year",
  y="Life Expectancy",
  colour="Continent")


#Challenge 1
rough_plot+labs(
  title="Life expectancy in 'A' countries", 
  x="Year",
  y="Life Expectancy",
  colour="Continent",
  caption = "Data Source: Gapminder")


#themes
rough_plot +
  labs(
    title = "Figure 1",
    x = "Year",              
    y = "Life expectancy",   
    color = "Continent"     
  ) +
  theme_bw()


rough_plot +
  labs(
    title = "Figure 1",
    x = "Year",              
    y = "Life expectancy",   
    color = "Continent"     
  ) +
  theme_grey()#default#

rough_plot +
  labs(
    title = "Figure 1",
    x = "Year",              
    y = "Life expectancy",   
    color = "Continent"     
  ) +
  theme_linedraw()

rough_plot +
  labs(
    title = "Figure 1",
    x = "Year",              
    y = "Life expectancy",   
    color = "Continent"     
  ) +
  theme_minimal()

#themes

rough_plot +
  labs(
    title = "Figure 1",
    x = "Year",              
    y = "Life expectancy",   
    color = "Continent"     
  ) +
  theme_bw()+
  theme(panel.grid.minor = element_blank(),
        plot.title = element_text(face="bold"))


#Challenge 2

#2-1
rough_plot +
  labs(
    title = "Figure 1",
    x = "Year",              
    y = "Life expectancy",   
    color = "Continent"     
  ) +
  theme_bw()+
  theme(strip.background = element_blank())

#2-2
rough_plot +
  labs(
    title = "Figure 1",
    x = "Year",              
    y = "Life expectancy",   
    color = "Continent"     
  ) +
  theme_bw()+
  theme(panel.grid.major=element_line(1))

#2-3
rough_plot +
  labs(
    title = "Figure 1",
    x = "Year",              
    y = "Life expectancy",   
    color = "Continent"     
  ) +
  theme_bw()+
  theme(axis.title = element_text(size=10, colour="blue"))

#2-4

rough_plot +
  labs(
    title = "Figure 1",
    x = "Year",              
    y = "Life expectancy",   
    color = "Continent"     
  ) +
  theme_bw()+
  theme(legend.position = "bottom")


#Exporting the plot
Plot_lifeExp <- rough_plot +
  labs(
    title = "Figure 1",
    x = "Year",              
    y = "Life expectancy",   
    color = "Continent"     
  ) +
  theme_bw()+
  theme(legend.position = "bottom")

ggsave(filename="results/lifeExp.png", plot=Plot_lifeExp, 
       width=12, height=10, dpi=300, units="cm")


#Cowplot
library(cowplot)

plot1 <- ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) + geom_point()
plot2 <- ggplot(gapminder, aes(x = continent, y = lifeExp)) + geom_boxplot()
plot3 <- ggplot(gapminder, aes(x = gdpPercap, y = pop)) + geom_point()
plot4 <- ggplot(gapminder, aes(x = lifeExp, y = pop)) + geom_point()

plot_grid(plot1,plot2,plot3,plot4)

plot_grid(plot1,plot2,plot3,plot4, rel_heights = c(1,3), labels="auto")


#Challenge 3 Tidy Tuesday

board_games <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-03-12/board_games.csv")


glimpse(board_games)

Rough_plot <- ggplot(data=board_games, mapping=aes(x=year_published, y=average_rating))+
  geom_point(alpha=0.1)+
  geom_smooth( se=FALSE,colour="red", size=1.5, )+
  theme_minimal()



Rough_plot+ labs(title="A Golden Age of Board Games?",
        x="",
        y="Average user rating",
       subtitle = "Average user ratings for games by original year of production", 
       caption= "SOURCE:BOARDGAMEGEEK/RASMUS GREVE")+
  theme(title = element_text("bold"),
        plot.background = element_rect(fill="gray93"),
        panel.grid.major =element_line(size=0.5, colour="gray"),
        panel.grid.minor =element_line(size=0.5, colour="gray"))+
  xlim(1950,2010)+
  ylim(0,10)
  

#things to still fix
#x scale numbers
#x and y scle numbers darker
#caption has dark background and bit missing
#labelling data points (geom_text?)geom_text(label=name, data="name")



named_games <- filter(board_games, 
                      name %in% c("Acquire",
                                  "Connect Four",
                                  "Mouse Trap", 
                                  "Twilight Struggle", 
                                  "Catan")) %>% mutate(name=ifelse(name=="Catan","The Settlers of Catan", name))

Rough_plot+ labs(title="A Golden Age of Board Games?",
                 x="",
                 y="Average user rating",
                 subtitle = "Average user ratings for games by original year of production", 
                 caption= "SOURCE:BOARDGAMEGEEK/RASMUS GREVE")+
  theme(title = element_text("bold"),
        plot.background = element_rect(fill="gray93"),
        panel.grid.major =element_line(size=0.5, colour="gray"),
        panel.grid.minor =element_line(size=0.5, colour="gray"))+
  xlim(1950,2010)+
  ylim(0,10)+
  geom_point(data=named_games, mapping=aes(x=year_published, y=average_rating))+
  geom_text(aes(label=name), data=named_games, nudge_y=0.4)
