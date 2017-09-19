#Import Behavior Data Folder

#Usage

DS <- Likelihood.to.Increase.Volume
DS <- aggregate(DS$Likelihood.to.increase.volume, list(ID = DS$Segment), mean)
DS$Rescale <- DS$x/7*100
DS$x <- NULL
Usage <- DS


DS <- Patient.Likelihood
DS <- aggregate(DS$Rating, list(ID = DS$Likelihood.to), mean)
DS$Rescale <- DS$x/7*100
DS$x <- NULL
Usage <- rbind(Usage, DS)


DS <- PSC.Survey.Data
names(DS)[1] <- "ID"
names(DS)[2] <- "Rescale"
DS$Rescale <- gsub("%", "",as.character(DS$Rescale))
DS <- DS[DS$ID=="Likely to Return",]
Usage <- rbind(Usage, DS)
Usage <- merge(Usage, UsageWeights, by= "ID")
Usage$Score <- as.numeric(Usage$Rescale)*as.numeric(Usage$Weights)


Category = "Behavior"
SubCategory = "Usage"
Score = sum(Usage$Score)
Total = 100
SubCategoryScores <- data.frame(Category, SubCategory, Score, Total)



#Recommendation


DS <- PSC.Survey.Data[PSC.Survey.Data$Metric=="Likely to Recommend",]
DS$Data <- gsub("%", "",as.character(DS$Data))
Category = "Behavior"
SubCategory = "Recommendation"
Score = DS$Data
Total = 100
DS <- data.frame(Category, SubCategory, Score, Total)
SubCategoryScores <- rbind(SubCategoryScores, DS)



#Big Deals

ID = "RevenueLargeDeal"
Rescale = 100
Weights = 0.40
Score = Rescale * Weights
BigDeals <- data.frame(ID, Rescale, Weights, Score)



ID = "NumberLargeDeals"
Weights = 0.40
Rescale = Business.Data$Win.Rate/Business.Data$Win.Rate.Goal*100
Score = Rescale * Weights
BigDeals <- rbind(BigDeals, data.frame(ID, Rescale, Weights, Score))



ID = "Attrition"
Weights = 0.20
Rescale = 75
Score = Rescale * Weights
BigDeals <- rbind(BigDeals, data.frame(ID, Rescale, Weights, Score))



Category = "Behavior"
SubCategory = "Big Deals"
Score = sum(BigDeals$Score)
Total = 100
DS <- data.frame(Category, SubCategory, Score, Total)
SubCategoryScores <- rbind(SubCategoryScores, DS)




##################################################################
#Internal
#################################################3

#Engagement

ID = "Velocity of Brand Communication"
Weights = 0.05
Rescale = mean(Q3.Q10$Velocity.of.brand.communications)/7*100
Score = Rescale * Weights
Engagement <- data.frame(ID, Rescale, Weights, Score)
rm(DS)


DS <- aggregate(Q4.CampaignAwareness$CampaignAwarenessRating, list(ID = Q4.CampaignAwareness$ParameterId), mean)
DS$Rescale <- DS$x/7*100
DS$Weights <- .10
DS$Score = DS$Rescale*DS$Weights
Engagement <- rbind(Engagement, DS)

summary(Q12.TourEffectiveness)

ID = "Brand tour performance"
Weights = 0.15
Rescale = mean(Q3.Q10$Brand.Tour.Performance)/7*100
Score = Rescale * Weights
DS <- data.frame(ID, Rescale, Weights, Score)
Engagement <- rbind(Engagement, DS)
rm(DS)

ID = "Effectiveness of Brand Tour"
Weights = 0.15
Rescale = mean(Q12.TourEffectiveness$TourEffectivenessRating)/7*100
Score = Rescale * Weights
DS <- data.frame(ID, Rescale, Weights, Score)
Engagement <- rbind(Engagement, DS)
rm(DS)

DS <- Employee.Engagement
names(DS)[1] <- "ID"
DS$Positive<-NULL
DS$Neutral<-NULL
DS$Negative<-NULL
Engagement <- rbind(Engagement, DS)
rm(DS)


ID = "Everday Excellence Completion Rate"
Weights = 0.15
Rescale = as.numeric(gsub("%", "",as.character(EE.completion$Data)))
Score = Rescale * Weights
DS <- data.frame(ID, Rescale, Weights, Score)
Engagement <- rbind(Engagement, DS)
rm(DS)



Category = "Internal"
SubCategory = "Engagement"
Score = sum(Engagement$Score)
Total = 100
DS <- data.frame(Category, SubCategory, Score, Total)
SubCategoryScores <- DS
SubCategoryScores <- rbind(SubCategoryScores, DS)

rm(EE.completion,Employee.Engagement,Q12.TourEffectiveness,Q3.Q10,Q4.CampaignAwareness)



###############################
#Execution


DS <- `Brand.&.Logo`
DS <- aggregate(DS$Rating, list(ID = DS$Parameter), mean)
DS$Rescale <- DS$x/7*100
DS$x <- NULL
DS$Weights<-rep(NA, nrow(DS))
DS[DS$ID=="Effectiveness of internal brand communications",][,"Weights"] <- 0.10
DS[DS$ID=="Perceived degree of brand change",][,"Weights"] <- 0.05
DS[DS$ID=="Perceived degree of brand uniqueness",][,"Weights"] <- 0.10
DS[DS$ID=="Speed of Logo Transition",][,"Weights"] <- 0.05
DS$Score = DS$Rescale*DS$Weights
Execution <- DS


AttributeCount <- data.frame(table(Q14.QuestPerception$ParameterId))
AttributeCount$Percent <- prop.table(AttributeCount$Freq)
names(AttributeCount)[1] <- "ParameterId"
AttributeCount <- merge(AttributeCount, Q14.Attributes, by= "ParameterId")
DS <- aggregate(AttributeCount$Percent, list(ID = AttributeCount$WeightCalculation), sum)
names(DS)[2] <- "Rescale"
DS$Weights <- .10
DS$Limits <- .10
DS[DS$ID=="All other attributes",][,"Limits"] <- 0.70
DS$Score <- ifelse ((DS$Rescale <= DS$Limits), (DS$Rescale/DS$Weights*10), 10)
DS$Limits <- NULL
Execution <- rbind(Execution, DS)



ID = "Personality traits"
Weights = 0.10
Rescale = mean(Q15.Personality$PersonalityRating)/7*100
Score = Rescale * Weights
DS <- data.frame(ID, Rescale, Weights, Score)
Execution <- rbind(Execution, DS)
rm(DS)


DS <- Quest.Ability
names(DS)[1] <- "ID"
DS$Positive<-NULL
DS$Neutral<-NULL
DS$Negative<-NULL
Execution <- rbind(Execution, DS)
rm(DS)


ID = "Number of brand asset downloads"
Weights = 0.05
Rescale = 90+((sum(Brand.Intranet.Site.Downloads$Downloads)-15000)/500)
Score = Rescale * Weights
DS <- data.frame(ID, Rescale, Weights, Score)
Execution <- rbind(Execution, DS)
rm(DS)


sum(Execution$Weights)
sum(Execution$Score)


Category = "Internal"
SubCategory = "Execution"
Score = sum(Execution$Score)
Total = 100
DS <- data.frame(Category, SubCategory, Score, Total)
SubCategoryScores <- rbind(SubCategoryScores, DS)


rm(AttributeCount, `Brand.&.Logo`,Brand.Intranet.Site.Downloads,DS,Q14.Attributes,Q14.QuestPerception,Q15.Personality,
   Q15.Personality.Description,Quest.Ability)


########################################################
#External
####################################################


#Differentiation

DS <- aggregate(Differentiation$Rating, list(ID1 = Differentiation$Segment, ID2 = Differentiation$QuestionId), mean)
DS$Rescale <- DS$x/7*100
DS$Weights = 0.15
DS[DS$ID1=="Physicians",][,"Weights"] <- 0.20
DS$Score = DS$Rescale * DS$Weights
DS$ID1 <- paste(DS$ID1, DS$ID2, sep = " - ")
DS$ID2<- NULL
DS$x<-NULL
names(DS)[1] <- "ID"


Category = "External"
SubCategory = "Differentiation"
Score = sum(DS$Score)
Total = 100
DS <- data.frame(Category, SubCategory, Score, Total)
SubCategoryScores <- rbind(SubCategoryScores, DS)

rm(Differentiation, DS)


#Satisfaction

DS <- data.frame(ID = CX.Index$CX.Index, Rescale = CX.Index$Rescale, Weights = CX.Index$Weights, Score = CX.Index$Score)
Satisfaction <- DS


ID = "Patient Satisfaction"
Weights = 0.30
Rescale = mean(PSC.Survey.Data$Data)*100
Score = Rescale * Weights
DS <- data.frame(ID, Rescale, Weights, Score)
Satisfaction <- rbind(Satisfaction, DS)
rm(DS, CX.Index, PSC.Survey.Data)


Category = "External"
SubCategory = "Satisfaction"
Score = sum(Satisfaction$Score)
Total = 100
DS <- data.frame(Category, SubCategory, Score, Total)
SubCategoryScores <- rbind(SubCategoryScores, DS)
rm(Satisfaction, DS)




#Execution

DS <- Q14.QuestPerception[Q14.QuestPerception$Lab=="Quest Diagnostics",]
DS <- data.frame(table(Segment = DS$Segment, ParameterId = DS$ParameterId))
DS <- merge(DS, Q14.Attributes, by= c("Segment", "ParameterId"))
DS <- DS[DS$Importance=="Higher impact",]
DS$Recale <- DS$Freq/DS$Respondents*100

Category = "External"
SubCategory = "Execution"
Score = sum(DS$Recale)
Total = 100
SubCategoryScores <- data.frame(Category, SubCategory, Score, Total)
DS <- rbind(SubCategoryScores, DS)
rm(Q14.Attributes,Q14.QuestPerception, DS)



#Reputation

DS <- Unaided.Awareness[Unaided.Awareness$Lab=="Quest Diagnostics",]
DS <- aggregate(DS$Choice.Weight, list(Segment = DS$Segment, Respondents = DS$Respondents, Weights = DS$Weights), sum)
DS$Rescale <- DS$x/(DS$Respondents*2)*100
names(DS)[1] <- "ID"
DS$ID <- paste("Unaided", DS$ID, sep = " - ")
DS$x<- NULL
DS$Score = DS$Rescale * DS$Weights
Reputation <- data.frame(ID = DS$ID, Rescale = DS$Rescale, Weights = DS$Weights, Score = DS$Score)
rm(DS)


DS <- Aided.Awareness[Aided.Awareness$Lab=="Quest Diagnostics",]
DS <- aggregate(DS$Familiarity, list(Segment = DS$Segment, Weights = DS$Weights), mean)
DS$Rescale <- (DS$x/7)*100
DS$Score = DS$Rescale*DS$Weights
DS$x<- NULL
DS <- data.frame(ID = DS$Segment, Rescale = DS$Rescale, Weights = DS$Weights, Score = DS$Score)
DS$ID <- paste("Aided", DS$ID, sep = " - ")
Reputation <- rbind(Reputation, DS)
rm(DS)


DS <- Likeability[Likeability$Lab=="Quest Diagnostics",]
DS <- DS[DS$QuestionId=="Overall",]
DS <- aggregate(DS$Rating, list(Segment = DS$Segment), mean)
DS$Weights <- 0.1
DS$Rescale <- (DS$x/7)*100
DS$Score = DS$Rescale*DS$Weights
DS$x<- NULL
DS <- data.frame(ID = DS$Segment, Rescale = DS$Rescale, Weights = DS$Weights, Score = DS$Score)
DS$ID <- paste("Likeability", DS$ID, sep = " - ")
Reputation <- rbind(Reputation, DS)
rm(DS)



DS <- Personality[Personality$Lab=="Quest Diagnostics",]
ID = "Personality"
Weights = 0.10
Rescale = mean(Personality$Rating)/7*100
Score = Rescale * Weights
DS <- data.frame(ID, Rescale, Weights, Score)
Reputation <- rbind(Reputation, DS)
rm(DS)


Category = "External"
SubCategory = "Reputation"
Score = sum(Reputation$Score)
Total = 100
DS <- data.frame(Category, SubCategory, Score, Total)
SubCategoryScores <- rbind(SubCategoryScores, DS)

rm(Reputation, DS, Aided.Awareness,Likeability,Personality,Personality.Description,Unaided.Awareness)


#Relevance


DS <- Awareness[Awareness$First.choice.provider=="Quest Diagnostics",]
DS <- data.frame(table(Segment = DS$Segment, Weights = DS$Choice.Weights, Respondents = DS$Respondents))
DS <- DS[DS$Freq>0,]
DS$Weights <- as.numeric(as.character(DS$Weights))
DS$Respondents <- (as.numeric(as.character(DS$Respondents)))
DS$Rescale <- DS$Freq/DS$Respondents*100
DS$Score = DS$Rescale*DS$Weights
DS <- data.frame(ID = DS$Segment, Rescale = DS$Rescale, Weights = DS$Weights, Score = DS$Score)
DS$ID <- paste("First Choice", DS$ID, sep = " - ")
Relevance <- DS

rm(DS)




DS <- Market.Share[Market.Share$Lab=="Quest Diagnostics",]
DS <- aggregate(DS$Share.of.Volume, list(Segment = DS$Segment), mean)
DS$Weights <- 0.1
DS[DS$Segment=="Physicians",][,"Weights"] <- 0.15
names(DS)[1] <- "ID"
names(DS)[2] <- "Rescale"
DS$Score = DS$Rescale*DS$Weights
DS$ID <- paste("Share Volume", DS$ID, sep = " - ")
Relevance <- rbind(Relevance, DS)



DS <- Is.a.brand.for.me[Is.a.brand.for.me$Lab=="Quest Diagnostics",]
DS <- aggregate(DS$Is.a.brand.for.me, list(Segment = DS$Segment, Weights = DS$Weights), mean)
DS$Rescale <- (DS$x/7)*100
DS$Score = DS$Rescale*DS$Weights
DS$x<- NULL
DS <- data.frame(ID = DS$Segment, Rescale = DS$Rescale, Weights = DS$Weights, Score = DS$Score)
DS$ID <- paste("Brand for me", DS$ID, sep = " - ")
Relevance <- rbind(Relevance, DS)
rm(DS)




DS <- Awareness[Awareness$Awareness.of.new.logo=="Yes",]
DS <- data.frame(table(Segment = DS$Segment, Respondents = DS$Respondents))
DS <- DS[DS$Freq>0,]
DS$Respondents <- (as.numeric(as.character(DS$Respondents)))
DS$Rescale <- DS$Freq/DS$Respondents*100
DS$Weights <- 0.3
DS[DS$Segment=="Physicians",][,"Weights"] <- 0.4
DS$Score = DS$Rescale*DS$Weights
ID = "Logo Awareness"
Rescale = mean(DS$Rescale)
Weights = 0.05
Score = sum(DS$Score)*Weights
DS <- data.frame(ID, Rescale, Weights, Score)
Relevance <- rbind(Relevance, DS)

rm(DS)



DS <- MyQuestStat[MyQuestStat$Index!=1,]
DS$Index<-NULL
DS$Data<-NULL
DS$Benchmark<-NULL
names(DS)[1] <- "ID"
Relevance <- rbind(Relevance, DS)



Category = "External"
SubCategory = "Relevance"
Score = sum(Relevance$Score)
Total = 100
DS <- data.frame(Category, SubCategory, Score, Total)
SubCategoryScores <- rbind(SubCategoryScores, DS)


