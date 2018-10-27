## This file returns ConObjects in the Russian corpus for the capstone project 

setwd("F:/JohnHopkinsDataScienceCapstoneProject/")

library(readr)

source("srcFetch.R")
ruBlogData <- file("./dataset/ru_RU/ru_RU.blogs.txt","r")
ruNewData <- file("./dataset/ru_RU/ru_RU.news.txt","r")
ruTwitterData <- file("./dataset/ru_RU/ru_RU.twitter.txt","r")