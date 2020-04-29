library(ggplot2)
library(tidyr)

library(viridis)

data <- read.csv("Q1_planting1976-2019.csv",skip = 1)
data <- data %>% rename("Year" = "Year.to..31.March") %>% select("Year","Conifers","Broadleaves")
data

data2 <- data %>%  gather(Plant, Area, 'Conifers':'Broadleaves')
data2

ggplot(data = data2, aes(
  x = Year,
  y = Area,
  color = Plant,
  fill = Plant
)) +
  geom_bar(
    stat = "identity",
    position = "dodge",
    na.rm = TRUE,
    lwd = 1,
    width = 1
  ) +
  scale_fill_brewer() +
  scale_y_continuous(breaks = seq(0, 30, 5)) +
  xlab("") + theme_classic() +
  scale_x_continuous(breaks = seq(min(data2$Year), max(data2$Year) + 2 , by = 2)) +
  theme(
    axis.text.x = element_text(
      margin = margin(r = -1, unit = "cm"),
      vjust = -0.5,
      size = 9,
      angle = 45,
      hjust = 1.1
    ),
    axis.ticks = element_blank() ,
    legend.text = element_text(face = "italic", size = 9),
    legend.position = "bottom",
    legend.justification = "left"
  ) +
  xlab("") +
  ggtitle("Broadleaves Vs Conifer")
ggsave('plot.png')
