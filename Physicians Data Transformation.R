install.packages("reshape2")
library(reshape2)
require(reshape2)


## Q3 AidedAwareness

Q3Data <- cbind(data.frame(PhyDat[1], subset(PhyDat, select = grep("Q3_", names(PhyDat)))))

AidedAwareness <- melt(Q3Data, id = "ResponseID")
AidedAwareness <- AidedAwareness[!is.na(AidedAwareness$value),]
AidedAwareness$variable <- as.character(AidedAwareness$variable)
AidedAwareness$ResponseID <- as.character(AidedAwareness$ResponseID)
AidedAwareness <- data.frame(AidedAwareness$ResponseID, AidedAwareness$value, do.call(rbind, strsplit(AidedAwareness$variable, split = "_", fixed = TRUE)))
AidedAwareness$X1 <- NULL
names(AidedAwareness)[1] <- "ResponseID"
names(AidedAwareness)[2] <- "AidedAwarenessRating"
names(AidedAwareness)[3] <- "LabId"

write.csv(AidedAwareness, file = "Q3 AidedAwareness.csv", row.names = FALSE, na = "")

rm(Q3Data, AidedAwareness)



## Q4 LabUsage

Q4Data <- cbind(data.frame(PhyDat[1], subset(PhyDat, select = grep("Q4_", names(PhyDat)))))

LabUsage <- melt(Q4Data, id = "ResponseID")
LabUsage <- LabUsage[!is.na(LabUsage$value),]
LabUsage$variable <- as.character(LabUsage$variable)
LabUsage <- data.frame(LabUsage$ResponseID, LabUsage$value, do.call(rbind, strsplit(LabUsage$variable, split = "_", fixed = TRUE)))
LabUsage$X1 <- NULL
names(LabUsage)[1] <- "ResponseID"
names(LabUsage)[2] <- "LabUsageRating"
names(LabUsage)[3] <- "LabId"

write.csv(LabUsage, file = "Q4 LabUsage.csv", row.names = FALSE, na = "")

rm(Q4Data, LabUsage)




#Q5 Services

Q5.1Data <- cbind(data.frame(PhyDat[1], subset(PhyDat, select = grep("q5comp1", names(PhyDat))), subset(PhyDat, select = grep("Q5_1", names(PhyDat)))))
Services1 <- melt(Q5.1Data, id.vars = c("ResponseID", "q5comp1"))
Services1 <- Services1[!is.na(Services1$value),]
Services1$variable <- as.character(Services1$variable)
Services1 <- data.frame(Services1$ResponseID, Services1$q5comp1, Services1$value, do.call(rbind, strsplit(Services1$variable, split = "_", fixed = TRUE)))
Services1$X1 <- NULL
Services1$X2 <- NULL

names(Services1)[1] <- "ResponseID"
names(Services1)[2] <- "Lab"
names(Services1)[3] <- "Selection"
names(Services1)[4] <- "ServicesId"


Q5.2Data <- cbind(data.frame(PhyDat[1], subset(PhyDat, select = grep("q5comp2", names(PhyDat))), subset(PhyDat, select = grep("Q5_2", names(PhyDat)))))
Services2 <- melt(Q5.2Data, id.vars = c("ResponseID", "q5comp2"))
Services2 <- Services2[!is.na(Services2$value),]
Services2$variable <- as.character(Services2$variable)
Services2 <- data.frame(Services2$ResponseID, Services2$q5comp2, Services2$value, do.call(rbind, strsplit(Services2$variable, split = "_", fixed = TRUE)))
Services2$X1 <- NULL
Services2$X2 <- NULL

names(Services2)[1] <- "ResponseID"
names(Services2)[2] <- "Lab"
names(Services2)[3] <- "Selection"
names(Services2)[4] <- "ServicesId"

Services <- rbind(Services1, Services2)
write.csv(Services, file = "Q5 Services.csv", row.names = FALSE, na = "")

rm(Q5.1Data, Q5.2Data, Services, Services1, Services2)





## Q8 ServicesShare

Q8Data <- cbind(data.frame(PhyDat[1], subset(PhyDat, select = grep("Q8_", names(PhyDat)))))

ServicesShare <- melt(Q8Data, id = "ResponseID")
ServicesShare <- ServicesShare[!is.na(ServicesShare$value),]
ServicesShare$variable <- as.character(ServicesShare$variable)
ServicesShare <- data.frame(ServicesShare$ResponseID, ServicesShare$value, do.call(rbind, strsplit(ServicesShare$variable, split = "_", fixed = TRUE)))
ServicesShare$X1 <- NULL
names(ServicesShare)[1] <- "ResponseID"
names(ServicesShare)[2] <- "SharePercentage"
names(ServicesShare)[3] <- "LabId"

write.csv(ServicesShare, file = "Q8 ServicesShare.csv", row.names = FALSE, na = "")

rm(Q8Data, ServicesShare)







#Q9 AwarenessSource

Q9.1Data <- cbind(data.frame(PhyDat[1], subset(PhyDat, select = grep("q9comp1", names(PhyDat))), subset(PhyDat, select = grep("Q9_1", names(PhyDat)))))
AwarenessSource1 <- melt(Q9.1Data, id.vars = c("ResponseID", "q9comp1"))
AwarenessSource1 <- AwarenessSource1[!is.na(AwarenessSource1$value),]
AwarenessSource1$variable <- as.character(AwarenessSource1$variable)
AwarenessSource1 <- data.frame(AwarenessSource1$ResponseID, AwarenessSource1$q9comp1, AwarenessSource1$value, do.call(rbind, strsplit(AwarenessSource1$variable, split = "_", fixed = TRUE)))
AwarenessSource1$X1 <- NULL
AwarenessSource1$X2 <- NULL

names(AwarenessSource1)[1] <- "ResponseID"
names(AwarenessSource1)[2] <- "Lab"
names(AwarenessSource1)[3] <- "Selection"
names(AwarenessSource1)[4] <- "AwarenessSourceId"


Q9.2Data <- cbind(data.frame(PhyDat[1], subset(PhyDat, select = grep("q9comp2", names(PhyDat))), subset(PhyDat, select = grep("Q9_2", names(PhyDat)))))
AwarenessSource2 <- melt(Q9.2Data, id.vars = c("ResponseID", "q9comp2"))
AwarenessSource2 <- AwarenessSource2[!is.na(AwarenessSource2$value),]
AwarenessSource2$variable <- as.character(AwarenessSource2$variable)
AwarenessSource2 <- data.frame(AwarenessSource2$ResponseID, AwarenessSource2$q9comp2, AwarenessSource2$value, do.call(rbind, strsplit(AwarenessSource2$variable, split = "_", fixed = TRUE)))
AwarenessSource2$X1 <- NULL
AwarenessSource2$X2 <- NULL

names(AwarenessSource2)[1] <- "ResponseID"
names(AwarenessSource2)[2] <- "Lab"
names(AwarenessSource2)[3] <- "Selection"
names(AwarenessSource2)[4] <- "AwarenessSourceId"

AwarenessSource <- rbind(AwarenessSource1, AwarenessSource2)
write.csv(AwarenessSource, file = "Q9 AwarenessSource.csv", row.names = FALSE, na = "")

rm(Q9.1Data, Q9.2Data, AwarenessSource, AwarenessSource1, AwarenessSource2)







#Q10 SpecificSource

Q10.1Data <- cbind(data.frame(PhyDat[1], subset(PhyDat, select = grep("q9comp1", names(PhyDat))), subset(PhyDat, select = grep("Q10_1", names(PhyDat)))))
SpecificSource1 <- melt(Q10.1Data, id.vars = c("ResponseID", "q9comp1"))
SpecificSource1 <- SpecificSource1[!is.na(SpecificSource1$value),]
SpecificSource1$variable <- as.character(SpecificSource1$variable)
SpecificSource1 <- data.frame(SpecificSource1$ResponseID, SpecificSource1$q9comp1, SpecificSource1$value, do.call(rbind, strsplit(SpecificSource1$variable, split = "_", fixed = TRUE)))
SpecificSource1$X1 <- NULL
SpecificSource1$X2 <- NULL

names(SpecificSource1)[1] <- "ResponseID"
names(SpecificSource1)[2] <- "Lab"
names(SpecificSource1)[3] <- "Selection"
names(SpecificSource1)[4] <- "SpecificSourceId"


Q10.2Data <- cbind(data.frame(PhyDat[1], subset(PhyDat, select = grep("q9comp2", names(PhyDat))), subset(PhyDat, select = grep("Q10_2", names(PhyDat)))))
SpecificSource2 <- melt(Q10.2Data, id.vars = c("ResponseID", "q9comp2"))
SpecificSource2 <- SpecificSource2[!is.na(SpecificSource2$value),]
SpecificSource2$variable <- as.character(SpecificSource2$variable)
SpecificSource2 <- data.frame(SpecificSource2$ResponseID, SpecificSource2$q9comp2, SpecificSource2$value, do.call(rbind, strsplit(SpecificSource2$variable, split = "_", fixed = TRUE)))
SpecificSource2$X1 <- NULL
SpecificSource2$X2 <- NULL

names(SpecificSource2)[1] <- "ResponseID"
names(SpecificSource2)[2] <- "Lab"
names(SpecificSource2)[3] <- "Selection"
names(SpecificSource2)[4] <- "SpecificSourceId"

SpecificSource <- rbind(SpecificSource1, SpecificSource2)
write.csv(SpecificSource, file = "Q10 SpecificSource.csv", row.names = FALSE, na = "")

rm(Q10.1Data, Q10.2Data, SpecificSource, SpecificSource1, SpecificSource2)






#Q14 BrandPerception

Q14.1Data <- cbind(data.frame(PhyDat[1], subset(PhyDat, select = grep("q14comp1", names(PhyDat))), subset(PhyDat, select = grep("Q14_1", names(PhyDat)))))
BrandPerception1 <- melt(Q14.1Data, id.vars = c("ResponseID", "q14comp1"))
BrandPerception1 <- BrandPerception1[!is.na(BrandPerception1$value),]
BrandPerception1$variable <- as.character(BrandPerception1$variable)
BrandPerception1 <- data.frame(BrandPerception1$ResponseID, BrandPerception1$q14comp1, BrandPerception1$value, do.call(rbind, strsplit(BrandPerception1$variable, split = "_", fixed = TRUE)))
BrandPerception1$X1 <- NULL
BrandPerception1$X2 <- NULL

names(BrandPerception1)[1] <- "ResponseID"
names(BrandPerception1)[2] <- "Lab"
names(BrandPerception1)[3] <- "Selection"
names(BrandPerception1)[4] <- "AttributeId"


Q14.2Data <- cbind(data.frame(PhyDat[1], subset(PhyDat, select = grep("q14comp2", names(PhyDat))), subset(PhyDat, select = grep("Q14_2", names(PhyDat)))))
BrandPerception2 <- melt(Q14.2Data, id.vars = c("ResponseID", "q14comp2"))
BrandPerception2 <- BrandPerception2[!is.na(BrandPerception2$value),]
BrandPerception2$variable <- as.character(BrandPerception2$variable)
BrandPerception2 <- data.frame(BrandPerception2$ResponseID, BrandPerception2$q14comp2, BrandPerception2$value, do.call(rbind, strsplit(BrandPerception2$variable, split = "_", fixed = TRUE)))
BrandPerception2$X1 <- NULL
BrandPerception2$X2 <- NULL

names(BrandPerception2)[1] <- "ResponseID"
names(BrandPerception2)[2] <- "Lab"
names(BrandPerception2)[3] <- "Selection"
names(BrandPerception2)[4] <- "AttributeId"

BrandPerception <- rbind(BrandPerception1, BrandPerception2)
write.csv(BrandPerception, file = "Q14 BrandPerception.csv", row.names = FALSE, na = "")

rm(Q14.1Data, Q14.2Data, BrandPerception, BrandPerception1, BrandPerception2)






#Q16 LabPerformance

Q16.1Data <- cbind(data.frame(PhyDat[1], subset(PhyDat, select = grep("q14comp1", names(PhyDat))), subset(PhyDat, select = grep("Q16_1", names(PhyDat)))))
LabPerformance1 <- melt(Q16.1Data, id.vars = c("ResponseID", "q14comp1"))
LabPerformance1 <- LabPerformance1[!is.na(LabPerformance1$value),]
LabPerformance1$variable <- as.character(LabPerformance1$variable)
LabPerformance1 <- data.frame(LabPerformance1$ResponseID, LabPerformance1$q14comp1, LabPerformance1$value, do.call(rbind, strsplit(LabPerformance1$variable, split = "_", fixed = TRUE)))
LabPerformance1$X1 <- NULL
LabPerformance1$X2 <- NULL

names(LabPerformance1)[1] <- "ResponseID"
names(LabPerformance1)[2] <- "Lab"
names(LabPerformance1)[3] <- "Rating"
names(LabPerformance1)[4] <- "QuestionId"


Q16.2Data <- cbind(data.frame(PhyDat[1], subset(PhyDat, select = grep("q14comp2", names(PhyDat))), subset(PhyDat, select = grep("Q16_2", names(PhyDat)))))
LabPerformance2 <- melt(Q16.2Data, id.vars = c("ResponseID", "q14comp2"))
LabPerformance2 <- LabPerformance2[!is.na(LabPerformance2$value),]
LabPerformance2$variable <- as.character(LabPerformance2$variable)
LabPerformance2 <- data.frame(LabPerformance2$ResponseID, LabPerformance2$q14comp2, LabPerformance2$value, do.call(rbind, strsplit(LabPerformance2$variable, split = "_", fixed = TRUE)))
LabPerformance2$X1 <- NULL
LabPerformance2$X2 <- NULL

names(LabPerformance2)[1] <- "ResponseID"
names(LabPerformance2)[2] <- "Lab"
names(LabPerformance2)[3] <- "Rating"
names(LabPerformance2)[4] <- "QuestionId"

LabPerformance <- rbind(LabPerformance1, LabPerformance2)
write.csv(LabPerformance, file = "Q16 LabPerformance.csv", row.names = FALSE, na = "")

rm(Q16.1Data, Q16.2Data, LabPerformance, LabPerformance1, LabPerformance2)







#Q17 Personality

Q17.1Data <- cbind(data.frame(PhyDat[1], subset(PhyDat, select = grep("q14comp1", names(PhyDat))), subset(PhyDat, select = grep("Q17_1", names(PhyDat)))))
Personality1 <- melt(Q17.1Data, id.vars = c("ResponseID", "q14comp1"))
Personality1 <- Personality1[!is.na(Personality1$value),]
Personality1$variable <- as.character(Personality1$variable)
Personality1 <- data.frame(Personality1$ResponseID, Personality1$q14comp1, Personality1$value, do.call(rbind, strsplit(Personality1$variable, split = "_", fixed = TRUE)))
Personality1$X1 <- NULL
Personality1$X2 <- NULL

names(Personality1)[1] <- "ResponseID"
names(Personality1)[2] <- "Lab"
names(Personality1)[3] <- "Rating"
names(Personality1)[4] <- "PersonalityId"


Q17.2Data <- cbind(data.frame(PhyDat[1], subset(PhyDat, select = grep("q14comp2", names(PhyDat))), subset(PhyDat, select = grep("Q17_2", names(PhyDat)))))
Personality2 <- melt(Q17.2Data, id.vars = c("ResponseID", "q14comp2"))
Personality2 <- Personality2[!is.na(Personality2$value),]
Personality2$variable <- as.character(Personality2$variable)
Personality2 <- data.frame(Personality2$ResponseID, Personality2$q14comp2, Personality2$value, do.call(rbind, strsplit(Personality2$variable, split = "_", fixed = TRUE)))
Personality2$X1 <- NULL
Personality2$X2 <- NULL

names(Personality2)[1] <- "ResponseID"
names(Personality2)[2] <- "Lab"
names(Personality2)[3] <- "Rating"
names(Personality2)[4] <- "PersonalityId"

Personality <- rbind(Personality1, Personality2)
write.csv(Personality, file = "Q17 Personality.csv", row.names = FALSE, na = "")

rm(Q17.1Data, Q17.2Data, Personality, Personality1, Personality2)





