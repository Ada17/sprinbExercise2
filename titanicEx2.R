
#save data into a dataframe
titanic_orig <- read.csv("C:/users/aalutu/Desktop/work/pers/data science/titanic_original.csv")

#Question 1, replace missing values

for(i in 1:length(titanic_orig$embarked)){
  
  if(titanic_orig$embarked[i] == ""){
    #print(paste("missing at position ", i, "replaced as ", titanic_orig$embarked[i], " as S"))
    titanic_orig$embarked[i] <- "S"
    print(paste("missing at position ", i, "replaced as ", titanic_orig$embarked[i], " as S"))
    }
}
#titanic_orig$embarked #print embarked column
#replace blank age value with the mean of the age column
titanageavg <- mean(titanic_orig$age,na.rm = TRUE)

titanageavg

  
for(j in 1:length(titanic_orig$age)){
  
  #if(titanic_orig$age[j] == NA){
  if(is.na(titanic_orig$age[j])){ #use is.na()instead since the blanks have NA values
    
    #print(paste("Age column with NA value ", j)) #print to verify empty
    titanic_orig$age[j] <- titanageavg
  }
    

 }#end mean forloop
#titanic_orig$age #print the age column to verify no NA elements.

#3 lifeboat
  #titanic_orig$boat #print to see original column.
  
  #gsub(pattern = "", replacement = "None", titanic_orig$boat) #bad idea, replaces everything
  
  for(k in 1:length(titanic_orig$boat)){
    
    if(titanic_orig$boat[k] == ""){
      
      titanic_orig$boat[k] <- "Mpty" #still prints NA instead of Mpty
    }#end if
  }#end boat for loop
  ##titanic_orig$boat #print to see updated boat column

#4

hascabinnum <- 0 #vector to store values for new has_cabin_numbercolumn

for(m in 1:length(titanic_orig$cabin)){
  
  hascabinnum[m] <- 1
                                        
  if(titanic_orig$cabin[m] == ""){
    
    hascabinnum[m] <- 0 #takes 0 value if no cabin number
  }#end if
}
 hascabinnum #print vector

 titanic_origupd <-mutate(titanic_orig, has_cabin_number = hascabinnum)
  
 #write.csv(titanic_origupd, file = "C:/titan_clean.csv")
  