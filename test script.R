## Test script


# liibs -------------------------------------------------------------------

library(here)
library(tidyverse)
library(rvest)


# url to eci --------------------------------------------------------------



url_eci <- "https://results.eci.gov.in/Result2021/ConstituencywiseS2512.htm?ac=12"


# attempt to scrape -------------------------------------------------------

read_html(url_eci) -> results_page

results_page %>% 
  html_element(xpath = '//*[@id="div1"]/table[1]') %>% 
  html_table(header = F,trim = T) %>% 
  select(-c(X9,X8)) %>% 
  slice(5:length(.data$X1)-1) -> table1_headerless


colnames(table1_headerless) <- c("O.S.N","Candidate","Party",
                                 "EVM Votes","Postal Votes",
                                 "Total Votes","% of Votes")

results_page %>% 
  html_element(xpath = '//*[@id="div1"]/table[1]/tbody/tr[1]/td') %>% 
  html_text(trim = T) -> state_contstituency

table1_headerless$state_constituency <- state_contstituency

write_csv(table1_headerless,"output_test.csv")
