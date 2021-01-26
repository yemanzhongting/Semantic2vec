
library(ggpubr)
library(ggplot2)
library(gridExtra)
data4_1<-read.csv("E:/Githubresponsity/Semantic2vec/toR.csv")
#"list"
typeof(data4_1)

compared<-list(c('Residence','Public Serv'),c('Residence','Business'))

palette<-RColorBrewer::brewer.pal(5,"Set2")
#
p1<-ggboxplot<-ggboxplot(data4_1,x="type",y="NUMS",palette = "palette",fill="type")+
  theme(legend.position = "none")

p11<-p1+stat_compare_means(comparisons = compared,method = 't.test')+
  stat_compare_means(method = 'anova')#,label.y = 500
#wilcox.test,test,anova,kruskal.test
p11

p2<-ggboxplot<-ggboxplot(data4_1,x="type",y="Count",palette = "palette",fill="type")+
  theme(legend.position = "none")

p21<-p2+stat_compare_means(comparisons = compared,method = 't.test')+
  stat_compare_means(method = 'anova')#,label.y = 500

p21

#Í¼ÐÎ×éºÏ
grid.arrange(p11,p21,ncol=2)

#948,434
ggsave(filename = "C:/Users/hp/Desktop/R.pdf",
       grid.arrange(p1_1,p2_1,ncol=2),
       width = 5, height = 4, dpi = 300, units = "in", device='pdf')
