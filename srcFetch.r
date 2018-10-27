### File to check existence of text data set or if not present, download to directory.
### Dataset sourced from https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip

setwd("F:/JohnHopkinsDataScienceCapstoneProject/")

if(!file.exists("./dataset/Coursera-SwiftKey.zip")) {
  dir.create("./dataset/")
  download.file("https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip","./dataset/Coursera-SwiftKey.zip")
  zip.unpack("./dataset/Coursera-SwiftKey.zip")
}
