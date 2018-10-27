## This file returns ConObjects in the Finnish corpus for the capstone project 

setwd("F:/JohnHopkinsDataScienceCapstoneProject/")

library(readr)

source("srcFetch.R")
fiBlogData <- file("./dataset/fi_FI/fi_FI.blogs.txt","r")
fiNewData <- file("./dataset/fi_FI/fi_FI.news.txt","r")
fiTwitterData <- file("./dataset/fi_FI/fi_FI.twitter.txt","r")