# TODO: Add comment
# 
# Author: igor
###############################################################################

library("languageR")
library("MASS")

#task1
alice=tolower(alice)
wonderland=data.frame(word=alice[1:25920],chunk=cut(1:25920,breaks=40,labels=F))
for (word in c("alice","hare","very")){
	wonderland$is_the_word=wonderland$word==word
	temp_count=tapply(wonderland$is_the_word,wonderland$chunk,sum)
	assign(paste(word,"count",sep="_"),temp_count)
	assign(paste(word,"tab",sep="_"),xtabs(~temp_var))
}

#wonderland$low_word=tolower(wonderland$word)

#task2
par(mfrow=c(1,3))
plot(1:40,alice_count,type="h")
plot(1:40,very_count,type="h")
plot(1:40,hare_count,type="h")

#task3
par(mfrow=c(1,3))
plot(as.numeric(names(alice_tab)),alice_tab/sum(alice_tab),ylim=c(0,0.9),type="h")
plot(as.numeric(names(very_tab)),very_tab/sum(very_tab),type="h")
plot(as.numeric(names(hare_tab)),hare_tab/sum(hare_tab),type="h")

#task4
par(mfrow=c(1,2))
n=length(alice)/40
p=mean(alice_count/n)
lambda=p*n
nums_count=as.numeric(names(alice_tab))
plot(nums_count,dpois(nums_count,lambda), type="h",ylim=c(0,0.9))
plot(as.numeric(names(alice_tab)),alice_tab/sum(alice_tab),ylim=c(0,0.9),type="h")

#task5
quant_seq=seq(0.05,0.95,by=0.05)

pois_quant=qpois(quant_seq,lambda)
real_quant=quantile(alice_count,quant_seq)
plot(pois_quant,real_quant)

#task6
pois10=ppois(10,lambda)
quantile(alice_count, pois10)