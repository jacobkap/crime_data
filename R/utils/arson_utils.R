arson_col_name_fix <- c("YEAR_TWO_DIGIT"     = "YEAR",
                        "REPRTD_KNWN"        = "REPORTED_KNOWN",
                        "MANUFACTURIN$"      = "MANUFACTURING",
                        "ORI_CODE"           = "ORI",
                        "NUMERIC_STATE_CODE" = "STATE",
                        "NUMBER_OF_MONTHS_REPORTED$" = "MONTHS_REPORTED",
                        "NUMBER_OF_MONTHS_REPORTED_see_codebook" = "MONTHS_REPORTED")
arson_year_fix <- c("^1$" = "2001",
                    "^2$" = "2002")


months_reported_fix <- c("dec last reported"  = "december last reported",
                         "oct last reported"  = "october last reported",
                         "feb last reported"  = "february last reported",
                         "sep last reported"  = "september last reported",
                         "nov last reported"  = "november last reported",
                         "jan last reported"  = "january last reported"
                         )

make_arson_yearly <- function(data, arson_monthly_columns) {
  for (arson_col in arson_monthly_columns) {
    monthly_col       <- grep(arson_col, names(data))
    arson_col         <- gsub("\\$", "", arson_col)
    data[, arson_col] <- rowSums(data[, monthly_col], na.rm = TRUE)
    data              <- data[, -monthly_col]
    if (length(monthly_col) != 12) message(arson_col)
  }
  return(data)
}
