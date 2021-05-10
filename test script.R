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


# test state wise input values -----------------------------------------------

### S03

s03_values <- "34,ABHAYAPURI NORTH  ;35,ABHAYAPURI SOUTH  ;8,ALGAPUR   ;103,AMGURI   ;5,BADARPUR   ;45,BAGHBAR   ;20,BAITHALANGSO    ;62,BARAMA   ;72,BARCHALLA   ;87,BARHAMPUR   ;60,BARKHETRI   ;14,BARKHOLA   ;43,BARPETA   ;84,BATADROBA   ;77,BEHALI   ;41,BHABANIPUR   ;109,BIHPURIA   ;33,BIJNI   ;27,BILASIPARA EAST  ;26,BILASIPARA WEST ;76,BISWANATH   ;17,BOKAJAN   ;93,BOKAKHAT   ;48,BOKO   ;32,BONGAIGAON    ;121,CHABUA    ;63,CHAPAGURI   ;49,CHAYGAON   ;47,CHENGA   ;68,DALGAON   ;97,DERGAON   ;112,DHAKUAKHANA   ;61,DHARMAPUR   ;71,DHEKIAJULI   ;113,DHEMAJI   ;83,DHING   ;11,DHOLAI   ;23,DHUBRI   ;116,DIBRUGARH  ;123,DIGBOI   ;19,DIPHU   ;52,DISPUR   ;125,DOOM DOOMA   ;36,DUDHNAI  ;118,DULIAJAN   ;53,GAUHATI EAST    ;54,GAUHATI WEST    ;24,GAURIPUR   ;37,GOALPARA EAST    ;38,GOALPARA WEST   ;78,GOHPUR   ;95,GOLAGHAT   ;25,GOLAKGANJ ;28,GOSSAIGAON   ;16,HAFLONG;6,HAILAKANDI   ;55,HAJO   ;91,HOJAI   ;18,HOWRAGHAT   ;79,JAGIROAD   ;39,JALESWAR   ;51,JALUKBARI   ;90,JAMUNAMUKH   ;44,JANIA   ;114,JONAI   ;98,JORHAT    ;65,KALAIGAON   ;89,KALIABOR   ;56,KAMALPUR   ;3,KARIMGANJ NORTH;4,KARIMGANJ SOUTH;15,KATIGORA   ;7,KATLICHERRA ;96,KHUMTAI   ;30,KOKRAJHAR EAST;29,KOKRAJHAR WEST   ;81,LAHARIGHAT   ;117,LAHOWAL    ;111,LAKHIMPUR   ;13,LAKHIPUR   ;92,LUMDING   ;105,MAHMARA   ;70,MAJBAT   ;99,MAJULI   ;67,MANGALDOI   ;21,MANKACHAR   ;124,MARGHERITA   ;101,MARIANI   ;80,MARIGAON   ;115,MORAN   ;120,NAHARKATIA   ;59,NALBARI   ;110,NAOBOICHA   ;104,NAZIRA   ;86,NOWGONG  ;50,PALASBARI   ;64,PANERY  ;42,PATACHARKUCHI   ;2,PATHARKANDI   ;82,RAHA   ;74,RANGAPARA   ;57,RANGIA;1,RATABARI   ;85,RUPOHIHAT   ;126,SADIYA   ;22,SALMARA SOUTH;88,SAMAGURI   ;46,SARUKHETRI   ;94,SARUPATHAR   ;108,SIBSAGAR   ;31,SIDLI   ;9,SILCHAR;66,SIPAJHAR   ;10,SONAI   ;106,SONARI   ;75,SOOTEA   ;40,SORBHOG   ;58,TAMULPUR   ;102,TEOK   ;73,TEZPUR   ;107,THOWRA   ;119,TINGKHONG   ;122,TINSUKIA   ;100,TITABAR   ;69,UDALGURI   ;12,UDHARBOND  ;"

s03_values %>% 
  as.data.frame() %>% 
  tidyr::separate_rows(".",sep = ";") %>% 
  tidyr::separate(col = 1,
                  into = c("val","constituency"),
                  sep = ",") %>% 
  mutate(
    state = "S03"
  ) %>% view()
  
#### test complete

# the table can be scraped and 
# since the url changes every 
# time selection changes we can get the data.












