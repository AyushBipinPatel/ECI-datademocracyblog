# This script is to create funcitons for getting 
# values feom webpage and generate all links from 
# where to get tables.


# libs --------------------------------------------------------------------

library(tidyverse)


# creating the fucntion to obtain table -----------------------------------

get_eci_table <- function(url){
  
  
  read_html(url) -> results_page
  
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
  
  return(table1_headerless)
  
}


# generating the vector of urls -------------------------------------------

# structure of the url is below

# https://results.eci.gov.in/Result2021/Constituencywise****.htm?ac=**

# stars show values to be programatically filled

# State codes from the webpage

# <option value="S03">Assam</opti ...
# [3] <option value="S11">Kerala</opt ...
# [4] <option value="U07">Puducherry< ...
# [5] <option value="S22">Tamil Nadu< ...
# [6] <option value="S25">West Bengal

url_p1 <- "https://results.eci.gov.in/Result2021/Constituencywise"
url_p2 <- ".htm?ac="
generate_url_eci <- function(vec_inputs, state_code){
  
  
  vec_inputs %>% 
    as.data.frame() %>% 
    tidyr::separate_rows(".",sep = ";") %>% 
    tidyr::separate(col = 1,
                    into = c("val","constituency"),
                    sep = ",") %>% 
    mutate(
      url = str_remove_all(paste(url_p1,str_c(state_code,val,sep = ""),
                                 url_p2,val),
                           " ")
    ) -> url_table
  
  return(url_table)
}