library(rvest)
library(XML)
library(xlsx)
URL <- "https://www.cdc.gov/nceh/lead/data/state/aldata.htm"

pg <- read_html(URL)
links <- html_attr(html_nodes(pg, "a"), "href")
links <- links[grep("\\.xlsx|\\.csv|\\.xls", ignore.case = TRUE,
                   links)]

test <- read.xlsx(url(paste0("https://www.cdc.gov",
                                  links[1])),
                  1)

tmp = tempfile(fileext = ".xlsx")
download.file(url = paste0("https://www.cdc.gov",
                           links[1]),
              destfile = tmp,
              mode ="wb")
test <- read.xlsx2(tmp, 1, startRow = 3, header = TRUE)

for (i in 1:ncol(test)) {
  test[,i] <- as.character(test[,i])
  if (grepl("^X..[0-9]|X.$", names(test)[i])) {
    names(test)[i] <- test[1,i]
  }
  if (!grepl("^$", test[1, i])) {
    names(test)[i] <- test[1,i]
  }
}
names(test) <- tolower(names(test))
names(test) <- gsub("\\.+", "_", names(test))
names(test) <- gsub(" |\\.", "_", names(test))
test <- test[-1,]
