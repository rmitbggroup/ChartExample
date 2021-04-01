#install.packages("dplyr")
#install.packages("ggplot2")
library(dplyr) 
library(ggplot2)
stack_info = read.csv(file = "stack_figure0.csv", header=T)
sf0 <- ggplot(data=stack_info,mapping = aes (x=storage,fill=step,y=time)) + geom_col() + labs(y="time [us]")
sf1 <- ggplot(data=stack_info,mapping = aes (x=storage,fill=step,y=time)) +geom_col() + labs(y="time [us]") + facet_wrap(~step)
stack_info %>% group_by(storage) %>% mutate(percentage=time/sum(time)*100) %>% ungroup()->d
sf2 <-ggplot(data=d,mapping = aes(x=storage,fill=step,y=percentage))+geom_col() + annotate(
    geom = "text",
    x = S1, y = 1.1, hjust = 0,
    label="100")
sf3 <- ggplot(data=stack_info,mapping = aes (x=storage,fill=step,y=time)) + geom_col(position="dodge") + labs(y="time [us]")
ggsave("sf0.pdf",plot=sf0)
ggsave("sf1.pdf",plot=sf1)
ggsave("sf2.pdf",plot=sf2)
ggsave("sf3.pdf",plot=sf3)
