library(readr)
library(tidyverse)
library(ggrepel)


read_csv("in-airports.csv")%>%
  data.frame()->data
glimpse(data)

data%>%
  select(name,latitude_deg,longitude_deg,country_name,iso_country)->data1

ggplot(data1, aes(longitude_deg, latitude_deg,label=name)) +
  geom_point(size=0.7,colour = "#2ab7ca",show.legend = FALSE) + 
  coord_quickmap()+
  geom_text_repel(colour="#fed766",max.overlaps = 3,size=3)+
  theme(plot.background = element_rect(fill="black"),
  panel.background = element_rect(fill =  "black"),
  axis.text = element_blank(),
        axis.title = element_blank(),
        axis.ticks = element_blank(),
        panel.grid = element_blank(),
  plot.margin = unit(c(.5, 1, .5, 1), "cm"),
  plot.title.position = "plot",
  plot.caption.position = "plot",
  plot.title=element_text(size=16, colour = "#f4f4f8", face="bold"),
  plot.subtitle=element_text(size=11, colour="white", margin=margin(b=15)),
    plot.caption=element_text(hjust=0, size=9, colour="#f4f4f8", margin=margin(t=15)))+
  guides(color=guide_legend(override.aes = list(size=4)))+
  labs(title="AIRPORTS IN INDIA",
       subtitle="Each blue dot represents an airport in the country",
       caption = "Data:Humanitarian Data Exchange | Design: @annapurani93")->pointmap

ggsave("pointmap.png",pointmap,width=14,height=15)

