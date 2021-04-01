
performance = read.csv(file = "st_query.csv", header=T)
# multiple line
line2 <-ggplot(data = performance, mapping = aes(x=factor(sr),y=time,group = interaction(tr,storage),color = tr,linetype=storage))+ geom_point()+ geom_line() + theme_bw() + labs(y="time [ms]",x="spatial range")
ggsave("l2.pdf",plot=line2)