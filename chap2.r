# TODO: Add comment
# 
# Author: igor
###############################################################################


library("languageR")
library("MASS")

#task1
?warlpiri
xtabs.warl=xtabs(~CaseMarking+AgeGroup+WordOrder+AnimacyOfSubject,data=warlpiri)
mosaicplot(xtabs.warl)
xtabs.warl

#task2
heid2=aggregate(heid$RT, list(heid$Word,heid$BaseFrequency), mean)
par(mfrow=c(1,2))
plot(heid2$x,exp(heid2$Group.2))
plot(heid2$x,heid2$Group.2)

#task3
par(mfrow=c(1,2))
moby.table=table(moby)
moby.table=sort(moby.table,decreasing = T)
ranks=1:length(moby.table)
plot(log(ranks), log(moby.table))
plot(ranks, moby.table)

#task4
xylowess.fnc(meanRT~Trial|Subject, data=lexdec)

#task5
truehist(english$RTnaming)
dens.eng=density(english$RTnaming)
lines(dens.eng$x,dens.eng$y)

bwplot(RTnaming~Voice|AgeSubject, data=english)
