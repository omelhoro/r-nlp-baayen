# TODO: Add comment
# 
# Author: igor
###############################################################################

install.packages("languageR")

library("languageR")
#task1
spanishMeta
colnames(spanishMeta)

#task2
xtabs(~FullName,data=spanishMeta)
tapply(spanishMeta$PubDate,spanishMeta$Author, mean)

#task3
spanishMeta[order(spanishMeta$YearOfBirth),]
spanishMeta[order(spanishMeta$Nwords),]

#task4
sort(spanishMeta$PubDate,decreasing = T)

#task5
spanishMeta[spanishMeta$PubDate<1980,]

#task6
mean(spanishMeta$PubDate)
sum(spanishMeta$PubDate)/length(spanishMeta$PubDate)

#task7
composer=data.frame(
                    FullName=levels(spanishMeta$FullName),
                    Favorite=c("IgorF","FischerI","BlaBla"))
merge(spanishMeta, composer, by="FullName" )
