# Bryan Shalloway
# @brshallo
# bryanshalloway.com

# GRAPHICS EXAMPLES
# https://swcarpentry.github.io/r-novice-gapminder/08-plot-ggplot2/index.html

# install.packages("ggplot2")
# install.packages("gapminder")

library("ggplot2")
library("gapminder")

# gapminder data
gapminder

# example plot
ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point()

# ggplot, global options & aesthetics
ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp))

# adding geoms
ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point()

# Challenge 1 -------------------------------------------------------------

# Modify the example so that the figure shows how life expectancy has changed
# over time:

# Hint: the gapminder dataset has a column called “year”, which should appear on
# the x-axis.

ggplot(data = gapminder, mapping = aes(x = year, y = lifeExp))+
  geom_point()

# Challenge 2 -------------------------------------------------------------


# Modify the code from the previous challenge to color the points by the
# “continent” column. What trends do you see in the data? Are they what you
# expected?

ggplot(data = gapminder, mapping = aes(x = year, y = lifeExp, color = continent))+
  geom_point()



# Layers, multiple geoms

ggplot(data = gapminder, mapping = aes(x = year, 
                                       y = lifeExp, 
                                       group = country, 
                                       color = continent))+
  geom_line()


# aesthetics in geoms

ggplot(data = gapminder, mapping = aes(x = year, 
                                       y = lifeExp, 
                                       group = country, 
                                       color = continent))+
  geom_line() +
  geom_point()


# colour as fixed values
ggplot(data = gapminder, mapping = aes(x = gdpPercap, 
                                       y = lifeExp))+
  geom_point(color = "blue",
             alpha = 1)

ggplot(data = gapminder, mapping = aes(x = year, 
                                       y = lifeExp, 
                                       group = country, 
                                       color = continent))+
  geom_line() +
  geom_point(colour = "black")

ggplot(data = gapminder, mapping = aes(x = year, 
                                       y = lifeExp, 
                                       group = country, 
                                       color = continent))+
  geom_line() +
  geom_point(color = "black")

ggplot(data = gapminder, mapping = aes(x = year, 
                                       y = lifeExp, 
                                       group = country))+
  geom_line(mapping = aes(color = continent)) +
  geom_point()


# Challenge 3 -------------------------------------------------------------

# Switch the order of the point and line layers from the previous example. What
# happened?

ggplot(data = gapminder, mapping = aes(x = year, 
                                       y = lifeExp, 
                                       group = country, 
                                       color = continent))+
  geom_line() +
  geom_point(colour = "black")

ggplot(data = gapminder, mapping = aes(x = year, 
                                       y = lifeExp, 
                                       group = country, 
                                       color = continent))+
  geom_point(colour = "black") +
  geom_line()

# scales, log

ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point(alpha = 0.2) + 
  scale_x_log10()



# alpha fixed

# alpha, size, colour as aesthetics

# geom_smooth, method = "lm", and messing with other aesthetics

ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(size = pop), alpha = 0.2) +
  geom_smooth(method = "lm", size = 2) +
  scale_x_log10()


# example plot
ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point() + 
  scale_x_log10() + 
  geom_smooth(method="lm", size=1.5)


# challenge 4a -------------------------------------------------------------

# Modify the color and size of the points on the point layer in the previous example.
# Hint: do not use the aes function.

ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point(size = 2, colour = "purple") + 
  scale_x_log10() + 
  geom_smooth(method = "lm", size = 1.5)

# challenge 4b ------------------------------------------------------------

# Modify your solution to Challenge 4a so that the points are now a different
# shape and are colored by continent with new trendlines. Hint: The color
# argument can be used inside the aesthetic.

ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point(mapping = aes(color = continent), size = 2, shape = 3) + 
  scale_x_log10() + 
  geom_smooth(method = "lm", size = 1.5)

# specific by each continent
ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp, color = continent)) +
  geom_point(size = 2, shape = 3) + 
  scale_x_log10() + 
  geom_smooth(method = "lm", size = 1.5)


# Multi-panel figures, facet_wrap()
ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp, color = continent)) +
  geom_point(size = 2, shape = 3) + 
  geom_smooth(method = "lm", size = 1.5)+
  facet_wrap( ~ continent) +
  scale_x_log10()

ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point(size = 2, shape = 3) + 
  geom_smooth(method = "lm", size = 1.5)+
  facet_wrap( ~ continent) +
  scale_x_log10()


# text with labs
ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point(size = 2, shape = 3) + 
  geom_smooth(method = "lm", size = 1.5)+
  facet_wrap( ~ continent) +
  scale_x_log10()+
  labs(x = "GDP Per Capita",
       y = "Life Expectancy",
       title = "Relationship between GDP and Life Expectancy Varies by Continent"
       )

# ggsave, saving the plot
ggsave(filename = "results/gdp-lifeexp.png")

# ggsave, saving with details
# ggsave(filename = "results/lifeExp.png", plot = lifeExp_plot, width = 12, height = 10, dpi = 300, units = "cm")

# challenge 5 -------------------------------------------------------------

# Generate boxplots to compare life expectancy between the different continents during the available years.
# 
# Advanced:
#   
# Rename y axis as Life Expectancy.
# Remove x axis labels.
