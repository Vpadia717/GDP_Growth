# Loading necessary libraries and dataset
library(gganimate)
library(ggplot2)
library(dplyr)
library(gapminder)
library(ggthemes)

# Checking the gapminder dataset
gapminder

# Creating a static graph using ggplot2
graph1 = gapminder %>%
  ggplot(aes(
    x = gdpPercap,
    y = lifeExp,
    color = continent,
    size = pop
  )) +
  geom_point(alpha = 0.7, stroke = 0) +
  
  # Applying a theme
  theme_fivethirtyeight() +
  
  # Scaling size of points
  scale_size(range = c(2, 12), guide = "none") +
  
  # Applying a log transformation to the x-axis
  scale_x_log10() +
  
  # Adding labels and titles
  labs(
    title = "GDP Per Capita by Country",
    x = "Income per person (GDP / capita)",
    y = "Life expectancy (years)",
    color = "Continent",
    caption = "Source: Vivek Padia"
  ) +
  
  # Customizing the theme
  theme(
    axis.title = element_text(),
    text = element_text(family = "Rubik"),
    legend.text = element_text(size = 10)
  ) +
  
  # Using a color palette for the continents
  scale_color_brewer(palette = "Set2")

# Displaying the static graph
graph1

# Creating an animated graph using gganimate
graph1.animation = graph1 +
  
  # Adding a transition based on the "year" variable in the dataset
  transition_time(year) +
  
  # Adding a subtitle showing the current year
  labs(subtitle = "Year: {frame_time}") +
  
  # Adding a shadow effect to improve animation quality
  shadow_wake(wake_length = 0.1)

# Displaying the animated graph using gganimate's animate function
animate(
  graph1.animation,
  height = 1080,
  width = 1728,
  fps = 40,
  duration = 10,
  end_pause = 60,
  res = 100
)

# Saving the resulting animation as a GIF file
anim_save("GDP graph.gif")