# TODO: Add comment
# 
# Author: igor
###############################################################################


library("languageR")
library("MASS")

ver
qqnorm(log(ver$Frequency))

?ratings
#task1
dat_xtabs=xtabs(~AnimacyOfRec+RealizationOfRec, data=verbs[verbs$AnimacyOfTheme!="animate",])
chisq.test(dat_xtabs)

#task2
dist_het=havelaar$Frequency
ks.test(dist_het, "ppois",mean(dist_het))
ks.test(jitter(dist_het), "ppois",mean(dist_het))

#task3
ge_dens=density(durationsGe$DurationOfPrefix)
plot(ge_dens)
ge_dur=durationsGe$DurationOfPrefix
ge_freq=log(durationsGe$Frequency+1)
ge_lm=lm(ge_dur~ge_freq)
plot(ge_freq,ge_dur)
abline(ge_lm)
summary(ge_lm)

#task4
ratings_lm=lm(meanSizeRating~meanFamiliarity*Class+I(meanFamiliarity^2)*Class,data=ratings)
summary(ratings_lm)

#task5
ks.test(alice_count,ppois,mean(alice_count))
ks.test(very_count,ppois,mean(very_count))
ks.test(hare_count,ppois,mean(hare_count))

#task6
sub_age=english$AgeSubject
word_rt=english$RTnaming
eng_lm=lm(word_rt~sub_age)
summary(eng_lm)
names(eng_lm)
mean_young=eng_lm$coefficients[1]+eng_lm$coefficients[2]
mean_young

#task7
durationsOnt$DurationPrefixNasal

with_nasal=durationsOnt[durationsOnt$DurationPrefixNasal!=0,]
dur_pref=with_nasal$DurationPrefixNasal
word_freq=with_nasal$Frequency
plos_pres=with_nasal$PlosivePresent
ont_aov=lm(dur_pref~word_freq+plos_pres)
summary(ont_aov)

