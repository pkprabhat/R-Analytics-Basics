## Q4 Brand campaign

q4Data <- cbind(data.frame(EmpDat[1], subset(EmpDat, select = grep("q4_", names(EmpDat)))))

CampaignAwareness <- data.frame(q4Data[1:1], stack(q4Data[2:ncol(q4Data)]))

CampaignAwareness <- CampaignAwareness[!is.na(CampaignAwareness$values),]

CampaignAwareness$ind <- as.character(CampaignAwareness$ind)

CampaignAwareness <- data.frame(CampaignAwareness$ResponseID, CampaignAwareness$values, do.call(rbind, strsplit(CampaignAwareness$ind, split = "_", fixed = TRUE)))

CampaignAwareness$X1 <- NULL

names(CampaignAwareness)[1] <- "ResponseID"
names(CampaignAwareness)[2] <- "CampaignAwarenessRating"
names(CampaignAwareness)[3] <- "ParameterId"


write.csv(CampaignAwareness, file = "Q4 CampaignAwareness.csv", row.names = FALSE, na = "")

rm(q4Data, CampaignAwareness)


## q11 Brand Tour Performance

q11Data <- cbind(data.frame(EmpDat[1], subset(EmpDat, select = grep("q11_", names(EmpDat)))))

TourPerformance <- data.frame(q11Data[1:1], stack(q11Data[2:ncol(q11Data)]))

TourPerformance <- TourPerformance[!is.na(TourPerformance$values),]

TourPerformance$ind <- as.character(TourPerformance$ind)

TourPerformance <- data.frame(TourPerformance$ResponseID, TourPerformance$values, do.call(rbind, strsplit(TourPerformance$ind, split = "_", fixed = TRUE)))

TourPerformance$X1 <- NULL

names(TourPerformance)[1] <- "ResponseID"
names(TourPerformance)[2] <- "TourPerformanceRating"
names(TourPerformance)[3] <- "ParameterId"


write.csv(TourPerformance, file = "Q11 TourPerformance.csv", row.names = FALSE, na = "")

rm(q11Data, TourPerformance)


## q12 Brand Tour Effectiveness

q12Data <- cbind(data.frame(EmpDat[1], subset(EmpDat, select = grep("q12_", names(EmpDat)))))

TourEffectiveness <- data.frame(q12Data[1:1], stack(q12Data[2:ncol(q12Data)]))

TourEffectiveness <- TourEffectiveness[!is.na(TourEffectiveness$values),]

TourEffectiveness$ind <- as.character(TourEffectiveness$ind)

TourEffectiveness <- data.frame(TourEffectiveness$ResponseID, TourEffectiveness$values, do.call(rbind, strsplit(TourEffectiveness$ind, split = "_", fixed = TRUE)))

TourEffectiveness$X1 <- NULL

names(TourEffectiveness)[1] <- "ResponseID"
names(TourEffectiveness)[2] <- "TourEffectivenessRating"
names(TourEffectiveness)[3] <- "ParameterId"


write.csv(TourEffectiveness, file = "Q12 TourEffectiveness.csv", row.names = FALSE, na = "")

rm(q12Data, TourEffectiveness)




## Q14 Quest Perception

Q14Data <- cbind(data.frame(EmpDat[1], subset(EmpDat, select = grep("Q14_", names(EmpDat)))))

QuestPerception <- data.frame(Q14Data[1:1], stack(Q14Data[2:ncol(Q14Data)]))

QuestPerception <- QuestPerception[!is.na(QuestPerception$values),]

QuestPerception$ind <- as.character(QuestPerception$ind)

QuestPerception <- data.frame(QuestPerception$ResponseID, QuestPerception$values, do.call(rbind, strsplit(QuestPerception$ind, split = "_", fixed = TRUE)))

QuestPerception$X1 <- NULL

names(QuestPerception)[1] <- "ResponseID"
names(QuestPerception)[2] <- "Selection"
names(QuestPerception)[3] <- "ParameterId"


write.csv(QuestPerception, file = "Q14 QuestPerception.csv", row.names = FALSE, na = "")

rm(Q14Data, QuestPerception)




## Q15 Personality

Q15Data <- cbind(data.frame(EmpDat[1], subset(EmpDat, select = grep("Q15_", names(EmpDat)))))

Personality <- data.frame(Q15Data[1:1], stack(Q15Data[2:ncol(Q15Data)]))

Personality <- Personality[!is.na(Personality$values),]

Personality$ind <- as.character(Personality$ind)

Personality <- data.frame(Personality$ResponseID, Personality$values, do.call(rbind, strsplit(Personality$ind, split = "_", fixed = TRUE)))

Personality$X1 <- NULL

names(Personality)[1] <- "ResponseID"
names(Personality)[2] <- "PersonalityRating"
names(Personality)[3] <- "PersonalityId"


write.csv(Personality, file = "Q15 Personality.csv", row.names = FALSE, na = "")

rm(Q15Data, Personality)







