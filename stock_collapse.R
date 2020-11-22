# MSCI 599
# Stock Collapse

library(tidyverse)

fish = load("data/DBdata[asmt][v4.491].RData")
head(cpue.data)
summary(cpue.data)
class(cpue.data)
dim(cpue.data)

cpue.data$year = as.numeric(row.names(cpue.data))

ggplot(data=cpue.data, aes(x=year, y=SNOWCRAB3K)) +
  geom_line()

head(stock)

head(timeseries)




