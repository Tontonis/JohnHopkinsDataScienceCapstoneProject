## This file returnsConObjects to files the US English corpus for the capstone project 

setwd("F:/JohnHopkinsDataScienceCapstoneProject/")

library(readr)

source("srcFetch.R")
enBlogData <- file("./dataset/en_US/en_US.blogs.txt",open="r")
enNewData <- file("./dataset/en_US/en_US.news.txt",open="r")
enTwitterData <- file("./dataset/en_US/en_US.twitter.txt",open="r")