install.packages("reshape2")
library(reshape2)
require(reshape2)


## Q3 Lab awareness

Q3Data <- cbind(data.frame(PatDat[1], subset(PatDat, select = grep("Q3_", names(PatDat)))))
##DS2 <- data.frame(lapply(DS2, as.numeric), stringsAsFactors=FALSE)

BrandAwareness <- data.frame(Q3Data[1:1], stack(Q3Data[2:ncol(Q3Data)]))

BrandAwareness <- BrandAwareness[!is.na(BrandAwareness$values),]

BrandAwareness$ind <- as.character(BrandAwareness$ind)

BrandAwareness <- data.frame(BrandAwareness$ResponseID, BrandAwareness$values, do.call(rbind, strsplit(BrandAwareness$ind, split = "_", fixed = TRUE)))

BrandAwareness$X1 <- NULL

names(BrandAwareness)[1] <- "ResponseID"
names(BrandAwareness)[2] <- "BrandAwarenessRating"
names(BrandAwareness)[3] <- "LabId"


write.csv(BrandAwareness, file = "BrandAwareness.csv", row.names = FALSE, na = "")

Q3Data <- NULL
BrandAwareness <- NULL


## Q3A Category Usage

Q3AData <- cbind(data.frame(PatDat[1], subset(PatDat, select = grep("Q3A_", names(PatDat)))))

CategoryUsage <- data.frame(Q3AData[1:1], stack(Q3AData[2:ncol(Q3AData)]))

CategoryUsage <- CategoryUsage[!is.na(CategoryUsage$values),]

CategoryUsage$ind <- as.character(CategoryUsage$ind)

CategoryUsage <- data.frame(CategoryUsage$ResponseID, CategoryUsage$values, do.call(rbind, strsplit(CategoryUsage$ind, split = "_", fixed = TRUE)))

CategoryUsage$X1 <- NULL

names(CategoryUsage)[1] <- "ResponseID"
names(CategoryUsage)[2] <- "UsageSelection"
names(CategoryUsage)[3] <- "UsageId"


write.csv(CategoryUsage, file = "CategoryUsage.csv", row.names = FALSE, na = "")

Q3AData <- NULL
CategoryUsage <- NULL

## Q4 Lab Usage 1

Q4Data <- cbind(data.frame(PatDat[1], subset(PatDat, select = grep("Q4_", names(PatDat)))))

LabUsage <- data.frame(Q4Data[1:1], stack(Q4Data[2:ncol(Q4Data)]))

LabUsage <- LabUsage[!is.na(LabUsage$values),]

LabUsage$ind <- as.character(LabUsage$ind)

LabUsage <- data.frame(LabUsage$ResponseID, LabUsage$values, do.call(rbind, strsplit(LabUsage$ind, split = "_", fixed = TRUE)))

LabUsage$X1 <- NULL

names(LabUsage)[1] <- "ResponseID"
names(LabUsage)[2] <- "LabSelection"
names(LabUsage)[3] <- "LabId"


write.csv(LabUsage, file = "LabUsage.csv", row.names = FALSE, na = "")

Q4Data <- NULL
LabUsage <- NULL

## Q5A Requested / Expressed intent

Q5AData <- cbind(data.frame(PatDat[1], subset(PatDat, select = grep("Q5A_", names(PatDat)))))

ExpressRequest <- data.frame(Q5AData[1:1], stack(Q5AData[2:ncol(Q5AData)]))

ExpressRequest <- ExpressRequest[!is.na(ExpressRequest$values),]

ExpressRequest$ind <- as.character(ExpressRequest$ind)

ExpressRequest <- data.frame(ExpressRequest$ResponseID, ExpressRequest$values, do.call(rbind, strsplit(ExpressRequest$ind, split = "_", fixed = TRUE)))

ExpressRequest$X1 <- NULL

names(ExpressRequest)[1] <- "ResponseID"
names(ExpressRequest)[2] <- "Requested"
names(ExpressRequest)[3] <- "LabId"


write.csv(ExpressRequest, file = "ExpressRequest.csv", row.names = FALSE, na = "")


rm(Q5AData, ExpressRequest)





#Q9 AwarenessSource

Q9.1Data <- cbind(data.frame(PatDat[1], subset(PatDat, select = grep("q9comp1", names(PatDat))), subset(PatDat, select = grep("Q9_1", names(PatDat)))))
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


Q9.2Data <- cbind(data.frame(PatDat[1], subset(PatDat, select = grep("q9comp2", names(PatDat))), subset(PatDat, select = grep("Q9_2", names(PatDat)))))
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




## Q10 Quest Awareness

Q10Data <- cbind(data.frame(PatDat[1], subset(PatDat, select = grep("Q10_", names(PatDat)))))

QuestSource <- data.frame(Q10Data[1:1], stack(Q10Data[2:ncol(Q10Data)]))

QuestSource <- QuestSource[!is.na(QuestSource$values),]

QuestSource$ind <- as.character(QuestSource$ind)

QuestSource <- data.frame(QuestSource$ResponseID, QuestSource$values, do.call(rbind, strsplit(QuestSource$ind, split = "_", fixed = TRUE)))

QuestSource$X1 <- NULL
QuestSource$X2 <- NULL

names(QuestSource)[1] <- "ResponseID"
names(QuestSource)[2] <- "QuestSourceSelection"
names(QuestSource)[3] <- "QuestSourceId"


write.csv(QuestSource, file = "QuestSource.csv", row.names = FALSE, na = "")


rm(Q10Data, QuestSource)




#Q14 BrandPerception

Q14.1Data <- cbind(data.frame(PatDat[1], subset(PatDat, select = grep("q14comp1", names(PatDat))), subset(PatDat, select = grep("Q14_1", names(PatDat)))))
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


Q14.2Data <- cbind(data.frame(PatDat[1], subset(PatDat, select = grep("q14comp2", names(PatDat))), subset(PatDat, select = grep("Q14_2", names(PatDat)))))
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

Q16.1Data <- cbind(data.frame(PatDat[1], subset(PatDat, select = grep("q14comp1", names(PatDat))), subset(PatDat, select = grep("Q16_1", names(PatDat)))))
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


Q16.2Data <- cbind(data.frame(PatDat[1], subset(PatDat, select = grep("q14comp2", names(PatDat))), subset(PatDat, select = grep("Q16_2", names(PatDat)))))
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



#Personality


Q17.1Data <- cbind(data.frame(PatDat[1], subset(PatDat, select = grep("q14comp1", names(PatDat))), subset(PatDat, select = grep("Q17_1", names(PatDat)))))

Personality1 <- data.frame(Q17.1Data[1:2], stack(Q17.1Data[3:ncol(Q17.1Data)]))

Personality1 <- Personality1[!is.na(Personality1$values),]

Personality1$ind <- as.character(Personality1$ind)

Personality1 <- data.frame(Personality1$ResponseID, Personality1$q14comp1, Personality1$values, do.call(rbind, strsplit(Personality1$ind, split = "_", fixed = TRUE)))

Personality1$X1 <- NULL
Personality1$X2 <- NULL

names(Personality1)[1] <- "ResponseID"
names(Personality1)[2] <- "LabId"
names(Personality1)[3] <- "Rating"
names(Personality1)[4] <- "PersonalityId"



Q17.2Data <- cbind(data.frame(PatDat[1], subset(PatDat, select = grep("q14comp2", names(PatDat))), subset(PatDat, select = grep("Q17_2", names(PatDat)))))

Personality2 <- data.frame(Q17.2Data[1:2], stack(Q17.2Data[3:ncol(Q17.2Data)]))

Personality2 <- Personality2[!is.na(Personality2$values),]

Personality2$ind <- as.character(Personality2$ind)

Personality2 <- data.frame(Personality2$ResponseID, Personality2$q14comp2, Personality2$values, do.call(rbind, strsplit(Personality2$ind, split = "_", fixed = TRUE)))

Personality2$X1 <- NULL
Personality2$X2 <- NULL

names(Personality2)[1] <- "ResponseID"
names(Personality2)[2] <- "LabId"
names(Personality2)[3] <- "Rating"
names(Personality2)[4] <- "PersonalityId"

Personality <- rbind(Personality1, Personality2)

write.csv(Personality, file = "Personality.csv", row.names = FALSE, na = "")

rm(Q17.1Data, Q17.2Data, Personality, Personality1, Personality2)



## Labels

PatDataSet = read.spss("C:\\Users\\pshanker\\Dropbox\\Shared Drive\\Quest\\Source Data\\Brand Tracking Study FinalData_L1_Patients.sav", to.data.frame=TRUE)

StateCode <- data.frame(levels(PatDataSet$CS3))







