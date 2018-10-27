## This file is used for the week 1 quiz for the John Hopkins Data Science Capstone Project

library(tidyverse)
library(tidytext)
library(glue)
library(data.table)

cleanFiles<-function(file,newfile){
  writeLines(iconv(readLines(file,skipNul = TRUE)),newfile)
}

setwd("F:/JohnHopkinsDataScienceCapstoneProject/")

source("readInEnDataTest.R")
lineCount=0;
longestVal=0;
linesOfLove=0;
linesOfHate=0;
testLine<-"A computer once beat me at chess, but it was no match for me at kickboxing"
lineMatchCount=0;
while(TRUE) {
  line=readLines(enTwitterData,n=1,skipNul = TRUE)
  if(length(line)>longestVal) {
    longestVal=length(line)
  }
  else if(length(line)==0) {
    break
  }
  loveTest<-str_detect(line," love "); 
  if(loveTest==TRUE) {
    linesOfLove<-linesOfLove+1
  }
  hateTest<-str_detect(line," hate "); 
  if(hateTest==TRUE) {
    linesOfHate<-linesOfHate+1
  }
  if(str_detect(line,"biostats")==TRUE) {
    print(line)
  }
  if(str_detect(line,testLine)==TRUE) {
    lineMatchCount<-lineMatchCount+1
  }
  lineCount<-lineCount+1
}
print(linesOfLove)
print(linesOfHate)
print(longestVal)
print(lineCount)
print(lineMatchCount)
lineCount=0;
longestVal=0;
while(TRUE) {
  line=readLines(enBlogData,n=1,skipNul = TRUE)
  if(length(line)>longestVal) {
    longestVal=length(line)
  }
  else if(length(line)==0) {
    break
  }
  lineCount<-lineCount+1
}
print(longestVal)
print(lineCount)
lineCount=0;
longestVal=0;
while(TRUE) {
  line=readLines(enNewData,n=1,skipNul = TRUE)
  if(length(line)>longestVal) {
    longestVal=length(line)
  }
  else if(length(line)==0) {
    break
  }
  lineCount<-lineCount+1
}
print(longestVal)
print(lineCount)

close(enBlogData)
close(enTwitterData)
close(enNewData)