## This file reads in the German corpus for the capstone project 

setwd("F:/JohnHopkinsDataScienceCapstoneProject/")

library(readr)

source("srcFetch.R")
deBlogData <- read.table("./dataset/de_DE/de_DE.blogs.txt")
deNewData <- ("./dataset/de_DE/de_DE.news.txt")
deTwitterData <- ("./dataset/de_DE/de_DE.twitter.txt")