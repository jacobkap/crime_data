library(rvest)
library(tm)
library(XML)
library(RCurl)
library(readr)
setwd("C:/Users/user/Dropbox/R_project/crime/SOR")

# Grab Maryland data
download.file(url = paste0("http://www.dpscs.state.md.us/",
                           "onlineservs/sor/sor_listings/",
                           "pdf_name.pdf"),
                           "maryland_SOR.pdf")

Rpdf <- readPDF(control = list(text = "-layout"))

maryland <- Corpus(URISource("maryland_SOR.pdf"),
                   readerControl = list(reader = Rpdf))
dataset <- data.frame(maryland[[1]]$content)

# Arizona
arizona_data <- data.frame(name = "",
                           address = "",
                           city = "",
                           zipcode = "",
                           stringsAsFactors = FALSE)
stop_indicator <- 0
i <- 1
while (stop_indicator == 0) {
  arizona_site <- read_html(paste0("http://www.icrimewatch.net/results.",
                                   "php?AgencyID=55662&SubmitAllSearch=1",
                                   "&excludeIncarcerated=0&page=",
                                   i))
  name <- arizona_site %>%
    html_nodes("td td td a strong") %>%
    html_text()
  address <- arizona_site %>%
    html_nodes("tr+ tr td:nth-child(6)") %>%
    html_text()
  address <- address[address != "Address"]
  city <- arizona_site %>%
    html_nodes("tr+ tr td:nth-child(7)") %>%
    html_text()
  city <- city[city != "City "]
  zipcode <- arizona_site %>%
    html_nodes("tr+ tr td:nth-child(8)") %>%
    html_text()
  zipcode <- zipcode[zipcode != "Zip"]
  page_data <- cbind(name, address, city, zipcode)
  if (length(name) > 0) {
    arizona_data <- rbind(arizona_data, page_data)
    i <- i + 1
    if (i %% 4 == 0) {
      message (paste(nrow(arizona_data), "sex offenders recorded!"))
    }
  } else (stop_indicator <- 1)
}
save(arizona_data, file = "arizona_SOR.rda")


# New Mexico

set_checkbox <- function(form, values) {
    idx <- which(unlist(lapply(form$fields, function(x) { x$name %in% names(values) })))

      for (i in unname(idx)) {
          if (!is.null(form$fields[[i]]$value) && (form$fields[[i]]$value %in% values))
              form$fields[[i]]$checked <- "checked"
          }
    return(form)
  }

url <- paste0("http://www.icrimewatch.net/results.",
              "php?AgencyID=55290&SubmitAllSearch=1",
              "&excludeIncarcerated=0&page=1")
pgsession = html_session(url)
pgform <- html_form(pgsession)
RCurl::postForm(url, .params = c(agree = 1, continue = "Continue"))

new_mexico_data <- data.frame(name = "",
                           address = "",
                           city = "",
                           zipcode = "",
                           stringsAsFactors = FALSE)
stop_indicator <- 0
i <- 1
while (stop_indicator == 0 && i < 10) {
  new_mexico_site <- read_html(paste0("http://www.icrimewatch.net/results.",
                                   "php?AgencyID=55290&SubmitAllSearch=1",
                                   "&excludeIncarcerated=0&page=",
                                   i))
  name <- new_mexico_site %>%
    html_nodes("td td td a strong") %>%
    html_text()
  address <- new_mexico_site %>%
    html_nodes("tr+ tr td:nth-child(6)") %>%
    html_text()
  address <- address[address != "Address"]
  city <- new_mexico_site %>%
    html_nodes("tr+ tr td:nth-child(7)") %>%
    html_text()
  city <- city[city != "City "]
  zipcode <- new_mexico_site %>%
    html_nodes("tr+ tr td:nth-child(8)") %>%
    html_text()
  zipcode <- zipcode[zipcode != "Zip"]
  page_data <- cbind(name, address, city, zipcode)
  if (length(name) > 0) {
    new_mexico_data <- rbind(new_mexico_data, page_data)
    i <- i + 1
    if (i %% 4 == 0) {
      message(paste(nrow(new_mexico_data), "sex offenders recorded!"))
    }
  } else (stop_indicator <- 1)
}



# Idaho
idaho_data <- data.frame(name = "",
                              address = "",
                              city = "",
                              county = "",
                              zipcode = "",
                              stringsAsFactors = FALSE)

idaho_counties <- c("Ada", "Adams", "Bannock", "Bear Lake", "Benewah",
                    "Bingham", "Blaine", "Boise", "Bonner", "Bonneville",
                    "Boundary", "Butte", "Camas", "Canyon", "Caribou",
                    "Cassia", "Clark", "Clearwater", "Custer", "Elmore",
                    "Franklin", "Fremont", "Gem", "Gooding", "Idaho",
                    "Jefferson", "Jerome", "Kootenai", "Latah", "Lemhi",
                    "Lewis", "Lincoln", "Madison", "Mindoka", "Nez Percce",
                    "Oneida", "Owyhee", "Payette", "Power", "Shoshone",
                    "Teton", "Twin Falls", "Valley", "Washington")
for (n in idaho_counties) {
  stop_indicator <- 0
  i <- 1
  while (stop_indicator == 0) {
    url <- paste0("https://www.isp.idaho.gov/sor_id/SOR?",
                  "form=4&cnt=",
                  n,
                  "&rad=A&srt=1&sz=1366&page=",
                  i)
    idaho_site <- try(read_html(url))
    name <- idaho_site %>%
      html_nodes("#nam_field a") %>%
      html_text()
    address <- idaho_site %>%
      html_nodes("#adr_field") %>%
      html_text()
    address <- address[address != "Address"]
    city <- idaho_site %>%
      html_nodes("#data_tbl tr :nth-child(6)") %>%
      html_text()
    city <- city[city != "City"]
    county <- idaho_site %>%
      html_nodes("#data_tbl tr :nth-child(7)") %>%
      html_text()
    county <- county[county != "County"]
    zipcode <- idaho_site %>%
      html_nodes("#zip_field") %>%
      html_text()
    zipcode <- zipcode[zipcode != "Zip"]
    page_data <- data.frame(cbind(name, address, city, county,  zipcode),
                            stringsAsFactors = FALSE)
    if (length(name) > 0) {
      idaho_data <- try(plyr::rbind.fill(idaho_data, page_data))
      print(i)
      if (i %% 4 == 0) {
        message(paste(nrow(idaho_data), "sex offenders recorded!"))
      }
      i <- i + 1
    } else (stop_indicator <- 1)
  }
}


# Michigan
michigan_data <- data.frame(name = "",
                           address = "",
                           city = "",
                           zipcode = "",
                           stringsAsFactors = FALSE)
stop_indicator <- 0
i <- 1
while (stop_indicator == 0) {
  michigan_site <- read_html(paste0("http://www.icrimewatch.net/results.",
                                   "php?AgencyID=55242&SubmitAllSearch=1",
                                   "&excludeIncarcerated=0&page=",
                                   i))
  name <- michigan_site %>%
    html_nodes("td td td a strong") %>%
    html_text()
  address <- michigan_site %>%
    html_nodes("tr+ tr td:nth-child(6)") %>%
    html_text()
  address <- address[address != "Address"]
  city <- michigan_site %>%
    html_nodes("tr+ tr td:nth-child(7)") %>%
    html_text()
  city <- city[city != "City "]
  zipcode <- michigan_site %>%
    html_nodes("tr+ tr td:nth-child(8)") %>%
    html_text()
  zipcode <- zipcode[zipcode != "Zip"]
  page_data <- cbind(name, address, city, zipcode)
  if (length(name) > 0) {
    michigan_data <- rbind(michigan_data, page_data)
    i <- i + 1
    if (i %% 4 == 0) {
      message (paste(nrow(michigan_data), "sex offenders recorded!"))
    }
  } else (stop_indicator <- 1)
}
save(michigan_data, file = "michigan_SOR.rda")



# Ohio
ohio_data <- data.frame(name = "",
                            address = "",
                            city = "",
                            zipcode = "",
                            stringsAsFactors = FALSE)
stop_indicator <- 0
i <- 1
while (stop_indicator == 0) {
  ohio_site <- read_html(paste0("http://www.icrimewatch.net/results.",
                                    "php?AgencyID=55149&SubmitAllSearch=1",
                                    "&excludeIncarcerated=0&page=",
                                    i))
  name <- ohio_site %>%
    html_nodes("td td td a strong") %>%
    html_text()
  address <- ohio_site %>%
    html_nodes("tr+ tr td:nth-child(6)") %>%
    html_text()
  address <- address[address != "Address"]
  city <- ohio_site %>%
    html_nodes("tr+ tr td:nth-child(7)") %>%
    html_text()
  city <- city[city != "City "]
  zipcode <- ohio_site %>%
    html_nodes("tr+ tr td:nth-child(8)") %>%
    html_text()
  zipcode <- zipcode[zipcode != "Zip"]
  page_data <- cbind(name, address, city, zipcode)
  if (length(name) > 0) {
    ohio_data <- rbind(ohio_data, page_data)
    i <- i + 1
    if (i %% 4 == 0) {
      message (paste(nrow(ohio_data), "sex offenders recorded!"))
    }
  } else (stop_indicator <- 1)
}
save(ohio_data, file = "ohio_SOR.rda")


# Oklahoma
# https://sors.doc.state.ok.us/svor/f?p=119:241:3617393419671:FLOW_EXCEL
# _OUTPUT_R163628136148368850_en

# Washington
washington_data <- data.frame(name = "",
                        address = "",
                        city = "",
                        zipcode = "",
                        stringsAsFactors = FALSE)
stop_indicator <- 0
i <- 1
while (stop_indicator == 0) {
  washington_site <- read_html(paste0("http://www.icrimewatch.net/results.",
                                "php?AgencyID=54528&SubmitAllSearch=1",
                                "&excludeIncarcerated=0&page=",
                                i))
  name <- washington_site %>%
    html_nodes("td td td a strong") %>%
    html_text()
  address <- washington_site %>%
    html_nodes("tr+ tr td:nth-child(6)") %>%
    html_text()
  address <- address[address != "Address"]
  city <- washington_site %>%
    html_nodes("tr+ tr td:nth-child(7)") %>%
    html_text()
  city <- city[city != "City "]
  zipcode <- washington_site %>%
    html_nodes("tr+ tr td:nth-child(8)") %>%
    html_text()
  zipcode <- zipcode[zipcode != "Zip"]
  page_data <- cbind(name, address, city, zipcode)
  if (length(name) > 0) {
    washington_data <- rbind(washington_data, page_data)
    i <- i + 1
    if (i %% 4 == 0) {
      message(paste(nrow(washington_data), "sex offenders recorded!"))
    }
  } else (stop_indicator <- 1)
}
save(washington_data, file = "washington_SOR.rda")


# Georgia
georgia_SOR <- read_csv(url("http://state.sor.gbi.ga.gov/SORT_PUBLIC/sor.csv"))


# Rhode Island
rhode_island_level2 <- read_html(paste0("http://www.paroleboard.ri.gov/",
                                        "sexoffender/olist/levelii.php"))
level2 <- rhode_island_level2 %>%
  html_nodes(".lightblueContent a") %>%
  html_text()

rhode_island_level3 <- read_html(paste0("http://www.paroleboard.ri.gov/",
                                        "sexoffender/olist/leveliii.php"))
level3 <- rhode_island_level3 %>%
  html_nodes(".lightblueContent a") %>%
  html_text()

rhode_island_SOR <- rbind(rhode_island_level2,
                          rhode_island_level3)



# Louisiana
louisiana_data <- data.frame(name = "",
                              address = "",
                              city = "",
                              zipcode = "",
                              stringsAsFactors = FALSE)
stop_indicator <- 0
i <- 1
while (stop_indicator == 0) {
  louisiana_site <- read_html(paste0("http://www.icrimewatch.net/results.",
                                      "php?AgencyID=54450&SubmitAllSearch=1",
                                      "&excludeIncarcerated=0&page=",
                                      i))
  name <- louisiana_site %>%
    html_nodes("td td td a strong") %>%
    html_text()
  address <- louisiana_site %>%
    html_nodes("tr+ tr td:nth-child(6)") %>%
    html_text()
  address <- address[address != "Address"]
  city <- louisiana_site %>%
    html_nodes("tr+ tr td:nth-child(7)") %>%
    html_text()
  city <- city[city != "City "]
  zipcode <- louisiana_site %>%
    html_nodes("tr+ tr td:nth-child(8)") %>%
    html_text()
  zipcode <- zipcode[zipcode != "Zip"]
  page_data <- cbind(name, address, city, zipcode)
  if (length(name) > 0) {
    louisiana_data <- rbind(louisiana_data, page_data)
    i <- i + 1
    if (i %% 4 == 0) {
      message(paste(nrow(louisiana_data), "sex offenders recorded!"))
    }
  } else (stop_indicator <- 1)
}
save(louisiana_data, file = "louisiana_SOR.rda")
