## This file returns ConObjects in the German corpus for the capstone project 

setwd("F:/JohnHopkinsDataScienceCapstoneProject/")

library(readr)

source("srcFetch.R")
deBlogData <- file("./dataset/de_DE/de_DE.blogs.txt","r")
deNewData <- file("./dataset/de_DE/de_DE.news.txt","r")
deTwitterData <- file("./dataset/de_DE/de_DE.twitter.txt","r")