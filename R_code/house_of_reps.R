# House of rep data
library(rvest)




# 1960
reps_1960 <- xml2::read_html(paste0("https://en.wikipedia.org/wiki/United_States_House",
                              "_of_Representatives_elections,_1960"))
district <- reps_1960 %>%
  html_nodes("h3+ .wikitable td:nth-child(1) a") %>%
  html_text()
district <- district[!duplicated(district)]
winner <- reps_1960 %>%
  html_nodes("h3+ .wikitable b:nth-child(1)") %>%
  html_text()
reps_data <- data.frame(cbind(district, winner), stringsAsFactors = FALSE)
reps_data$year <- 1960

for (i in seq(2008, 2014, 2)) {
  dataset <- house_scraper(i)
  reps_data <- rbind(reps_data, dataset)
  print(i)
}

test <- house_scraper(2014)

house_scraper <- function(year) {

  dataset <- xml2::read_html(paste0("https://en.wikipedia.org/wiki/",
                                      "United_States_House",
                                      "_of_Representatives_elections,_",
                                      year))
  district <- dataset %>%
    html_nodes("h3~ .wikitable td:nth-child(1)") %>%
    html_text()
  if (length(district) < 435) {
    district <- dataset %>%
      html_nodes(".hatnote+ .jquery-tablesorter th a") %>%
      html_text()
  }
  district <- district[grepl(paste(state.name, collapse = "|"),
                              district,
                              ignore.case = TRUE)]
  district <- district[!grepl("note|special",
                             district,
                             ignore.case = TRUE)]
  # h3~ .wikitable b:nth-child(1) , b b , b~ b

  winner <- dataset %>%
    html_nodes("b~ b , b b , h3~ .wikitable b:nth-child(1)") %>%
    html_text()
  winner <- winner[(grepl("[0-9]|unopposed", winner,
                          ignore.case = TRUE))]
  winner <- winner[!(grepl("gain|David Curson (D) 48.4%", winner))]
  winner <- winner[!duplicated(winner)]
  winner <- winner[1:435]
  dataset <- data.frame(cbind(district, winner),
                        stringsAsFactors = FALSE)
  dataset$year <- year
  return(dataset)
}

# 1986
reps_1986 <- xml2::read_html(paste0("https://en.wikipedia.org/wiki/United_States_House",
                              "_of_Representatives_elections,_1986"))
district <- reps_1986 %>%
  html_nodes(".wikitable td:nth-child(1) a") %>%
  html_text()
winner <- reps_1986 %>%
  html_nodes(".wikitable b:nth-child(1)") %>%
  html_text()
reps_1986 <- data.frame(cbind(district, winner), stringsAsFactors = FALSE)
reps_1986$year <- 1986

# 1988
reps_1988 <- xml2::read_html(paste0("https://en.wikipedia.org/wiki/United_States_House",
                        "_of_Representatives_elections,_1988"))
district <- reps_1988 %>%
  html_nodes("h3+ .wikitable td:nth-child(1) a") %>%
  html_text()
winner <- reps_1988 %>%
  html_nodes("h3+ .wikitable b:nth-child(1)") %>%
  html_text()
reps_1988 <- data.frame(cbind(district, winner), stringsAsFactors = FALSE)
reps_1988$year <- 1988


# 2014
reps_2014 <- xml2::read_html(paste0("https://en.wikipedia.org/wiki/United_States_House",
                              "_of_Representatives_elections,_2014"))
district <- reps_2014 %>%
  html_nodes(xpath = '//*[@id="mw-content-text"]/table[6]') %>%
  html_table()

winner <- reps_2014 %>%
  html_nodes(".jquery-tablesorter:nth-child(152) tr:nth-child(1) td:nth-child(7)") %>%
  html_text()
reps_2014 <- data.frame(cbind(district, winner), stringsAsFactors = FALSE)
reps_2014$year <- 2014
