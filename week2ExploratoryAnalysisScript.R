## This file is used for some exploratory data analysis for the John Hopkins Data Science Capstone Project

library(tidyverse)
library(tidytext)
library(stringr)
library(glue)
library(data.table)
library(scales)
library(gtable)

# This analysis uses the tidytext plugin to read in and parse the input text strings into word tokens
# This permits the relatively straight forward treatment of the sources
# for numerical analysis and review.

cleanFiles<-function(file,newfile){
  writeLines(iconv(readLines(file,skipNul = TRUE)),newfile)
}

setwd("F:/JohnHopkinsDataScienceCapstoneProject/")

# Find English language test data

source("readInEnDataTest.R")

# Import and tokenise each source file

fileTextTwitterEn<-paste(readLines(enTwitterData,skipNul=TRUE))
fileTextTwitterEn<-as_data_frame(fileTextTwitterEn)
wordTokensTwitterEn<-fileTextTwitterEn %>% unnest_tokens(word, value)
head(wordTokensTwitterEn)

fileTextNewEn<-paste(readLines(enNewData,skipNul=TRUE))
fileTextNewEn<-as_data_frame(fileTextNewEn)
wordTokensNewEn<-fileTextNewEn %>% unnest_tokens(word, value)
fileTextBlogEn<-paste(readLines(enBlogData,skipNul=TRUE))
fileTextBlogEn<-as_data_frame(fileTextBlogEn)
wordTokensBlogEn<-fileTextBlogEn %>% unnest_tokens(word, value)

# Summarise word tokens into straight word counts.

wordTokensTwitterEn %>% count(word,sort=T) %>% head
wordTokensNewEn %>% count(word,sort=T) %>% head
wordTokensBlogEn %>% count(word,sort=T) %>% head

# One issue is that connection, relationals and other so called stop words
# will saturate the word count as shown above. We'll filter these out
# to give a clearer description of the contextual words

wordTokensTwitterEn<-wordTokensTwitterEn %>% anti_join(stop_words)
wordTokensNewEn<-wordTokensNewEn %>% anti_join(stop_words)
wordTokensBlogEn<-wordTokensBlogEn %>% anti_join(stop_words)

# Trying the word counts again

wordTokensTwitterEn %>% count(word,sort=T) %>% head
wordTokensNewEn %>% count(word,sort=T) %>% head
wordTokensBlogEn %>% count(word,sort=T) %>% head

# Displaying this as a series of plots

ptTwitter <- wordTokensTwitterEn %>%
  count(word, sort = TRUE) %>%
  filter(n > 30000) %>%
  mutate(word = reorder(word, n)) %>%
  ggplot(aes(word, n)) +
  geom_col() +
  xlab(NULL) +
  coord_flip()

ptNew <- wordTokensNewEn %>%
  count(word, sort = TRUE) %>%
  filter(n > 30000) %>%
  mutate(word = reorder(word, n)) %>%
  ggplot(aes(word, n)) +
  geom_col() +
  xlab(NULL) +
  coord_flip()

ptBlog <- wordTokensBlogEn %>%
  count(word, sort = TRUE) %>%
  filter(n > 30000) %>%
  mutate(word = reorder(word, n)) %>%
  ggplot(aes(word, n)) +
  geom_col() +
  xlab(NULL) +
  coord_flip()

gTwitter<-ggplotGrob(ptTwitter)
gNew<-ggplotGrob(ptNew)
gBlog<-ggplotGrob(ptBlog)

library(grid)

g<-rbind(gTwitter,gNew,gBlog,size="first")
g$widths<-unit.pmax(gTwitter$widths,gNew$widths,gBlog$widths)
grid.newpage()
grid.draw(g)

## Repeat the above for 2 n-grams
twoNGramTokensTwitterEn<-fileTextTwitterEn %>% unnest_tokens(bigram, value, token = "ngrams", n = 2)
twoNGramTokensNewEn<-fileTextNewEn %>% unnest_tokens(bigram, value, token = "ngrams", n = 2)
twoNGramTokensBlogEn<-fileTextBlogEn %>% unnest_tokens(bigram, value, token = "ngrams", n = 2)


## Filter bigram lists for stop words

filterBigram <-function(listOfBigrams) {
  bigramsSeparated <- listOfBigrams %>%
    separate(bigram, c("word1", "word2"), sep = " ")
  
  bigramsFiltered <- bigramsSeparated %>%
    filter(!word1 %in% stop_words$word) %>%
    filter(!word2 %in% stop_words$word)
  
  return(bigramsFiltered)
}

biGramsTwitterEn<-filterBigram(twoNGramTokensTwitterEn)
biGramsNewEn<-filterBigram(twoNGramTokensNewEn)
biGramsBlogEn<-filterBigram(twoNGramTokensBlogEn)

bigramsTwitterEnCounts <- biGramsTwitterEn %>% 
    count(word1, word2, sort = TRUE)
bigramsNewEnCounts <- biGramsNewEn %>% 
  count(word1, word2, sort = TRUE)
bigramsBlogEnCounts <- biGramsBlogEn %>% 
  count(word1, word2, sort = TRUE)

library(scales)

# expect a warning about rows with missing values being removed
ggplot(frequency, aes(x = proportion, y = `Jane Austen`, color = abs(`Jane Austen` - proportion))) +
  geom_abline(color = "gray40", lty = 2) +
  geom_jitter(alpha = 0.1, size = 2.5, width = 0.3, height = 0.3) +
  geom_text(aes(label = word), check_overlap = TRUE, vjust = 1.5) +
  scale_x_log10(labels = percent_format()) +
  scale_y_log10(labels = percent_format()) +
  scale_color_gradient(limits = c(0, 0.001), low = "darkslategray4", high = "gray75") +
  facet_wrap(~author, ncol = 2) +
  theme(legend.position="none") +
  labs(y = "Jane Austen", x = NULL)