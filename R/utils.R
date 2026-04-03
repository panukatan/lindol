# Utility functions ------------------------------------------------------------

## Retrieve geocoordinates from location values ----

get_longitude <- function(.location) {
  stringr::str_split(
    string = .location, pattern = ", | - ", simplify = TRUE
  ) |>
    (\(x) x[ , 1])() |>
    stringr::str_remove_all(pattern = "[^0-9.-]") |>
    as.numeric()
}

get_latitude <- function(.location) {
  stringr::str_split(
    string = .location, pattern = ", | - ", simplify = TRUE
  ) |>
    (\(x) x[ , 2])() |>
    stringr::str_remove_all(pattern = "[^0-9.-]") |>
    as.numeric()
}

get_location <- function(.location) {
  stringr::str_split(
    string = .location, pattern = ", | - ", simplify = TRUE
  ) |>
    (\(x) x[ , 3])() |>
    stringr::str_remove(pattern = "^0{1,}")
}

## Simplify vectors ----

simplify_vectors <- function(x) {
  c(x) |> unname() |> unlist()
}


## Get archive bulletins from base URL ----

eq_get_bulletin_urls_archive <- function(.url) {
  ## Quiet down error on SSL ----
  httr::config(ssl_verifypeer = 0L) |>
    httr::set_config()

  .session <- rvest::session(url = .url)

  url_list <- rvest::read_html(.session) |>
    rvest::html_elements(css = ".auto-style94 .MsoNormalTable .auto-style96 a") |>
    rvest::html_attr(name = "href")

  latest_archive_url <- url_list |>
    grep(pattern = "[0-9]{4}", value = TRUE) |>
    basename() |>
    sub(pattern = ".html", replacement = "") |>
    sub(pattern = "_", replacement = " ") |>
    paste("01") |>
    as.Date(format = "%Y %B %d") |>
    (\(x) which(x = x == max(x)))() |>
    (\(x) url_list[x])()

  .month <- basename(latest_archive_url) |>
    stringr::str_extract(pattern = month.name) |>
    (\(x) x[!is.na(x)])()

  .year <- basename(latest_archive_url) |>
    stringr::str_extract(pattern = "[0-9]{4}")

  urls <- eq_build_url(.url = .url, .year = .year, .month = .month)
}

## Retrieve HTML information from different CSS tags ----

# get_links <- function(.session) {
#   c(
#     .session |>
#       rvest::html_elements(css = "tr td .auto-style37 a") |>
#       rvest::html_attr(name = "href"),
#     .session |>
#       rvest::html_elements(css = "tr td .auto-style62 a") |>
#       rvest::html_attr(name = "href"),
#     .session |>
#       rvest::html_elements(css = "tr td .auto-style57 a") |>
#       rvest::html_attr(name = "href")
#     .session |>
#       rvest::html_elements(css = "tr td .auto-style37 a") |>
#       rvest::html_attr(name = "href")
#     .session |>
#       rvest::html_elements(css = "tr td .auto-style12 a") |>
#       rvest::html_attr(name = "href")
#     .session |>
#       rvest::html_elements(css = "tr td a") |>
#       rvest::html_attr(name = "href") |>
#       (\(x) x[stringr::str_detect(x, pattern = "Earthquake_Information")])()
#
#     .session |>
#       rvest::html_elements(css = "tr td .auto-style49 a") |>
#       rvest::html_attr(name = "href")
#   )
# }
