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
