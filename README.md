# GDP Growth

You need to install **R Studio** from [here](https://posit.co/download/rstudio-desktop/)

Various libraries which we are utlizing are:

```R
library(gganimate)
library(ggplot2)
library(dplyr)
library(gapminder)
library(ggthemes)
```
## Ploting the graph
```R
gapminder

graph1 = gapminder %>%
  ggplot(aes(
    x = gdpPercap,
    y = lifeExp,
    color = continent,
    size = pop
  )) +
  geom_point(alpha = 0.7, stroke = 0) +
  theme_fivethirtyeight() +
  scale_size(range = c(2, 12), guide = "none") +
  scale_x_log10() +
  labs(
    title = "GDP Per Capita by Country",
    x = "Income per person (GDP / capita)",
    y = "Life expectancy (years)",
    color = "Continent",
    caption = "Source: Vivek Padia"
  ) +
  theme(
    axis.title = element_text(),
    text = element_text(family = "Rubik"),
    legend.text = element_text(size = 10)
  ) +
  scale_color_brewer(palette = "Set2")
```
## Adding animation to the graph
```R
graph1.animation = graph1 +
  transition_time(year) +
  labs(subtitle = "Year: {frame_time}") +
  shadow_wake(wake_length = 0.1)
```
## Viewing the animation
```R
animate(
  graph1.animation,
  height = 1080,
  width = 1728,
  fps = 40,
  duration = 10,
  end_pause = 60,
  res = 100
)
```
## Reference images : <br>

<img src="Images/GDP.gif" alt="drawing"/><br><br>

This is the README file for GDP Growth repository. [^1]

[^1]: By : Vivek Padia.
