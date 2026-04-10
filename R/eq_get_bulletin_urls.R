#'
#' Get URLs for detailed PHIVOLCS earthquake information bulletins
#'
#' @param .url Base URL or monthly URL for PHIVOLCS earthquake bulletins. This
#'   is usually produced through a call to `eq_build_url()`.
#'
#' @returns A character vector of URLs for detailed PHIVOLCS earthquake
#'   information bulletins.
#'
#' @examples
#' .url <- eq_build_url(.year = 2020, .month = "January")
#' eq_get_bulletin_links(.url)
#'
#' @rdname eq_get_bulletin_link
#' @export
#'

# eq_get_bulletin_urls <- function(.url = "https://earthquake.phivolcs.dost.gov.ph/",
#                                  .year = NULL, .month = NULL, latest = TRUE) {
#   ## Build URLs ----
#   if (is.null(.year) & is.null(.month)) {
#     if (latest) {
#       urls <- .url
#     } else {
#       urls <- eq_build_url(.url = .url, .year = .year, .month = .month)
#     }
#   } else {
#     urls <- eq_build_url(.url = .url, .year = .year, .month = .month)
#   }

#   ## Get data summary ----
#   # eq_summary <- eq_data_summary(
#   #   .url = .url, .year = .year, .month = .month, latest = latest
#   # ) |>
#   #   dplyr::mutate(url = urls)

#   ## Retrieve URLs ----
#   lapply(
#     X = urls,
#     FUN = eq_get_bulletin_urls_
#   ) |>
#     unlist()
# }


# eq_get_bulletin_urls_ <- function(.url) {
#   ## Detect year and month from URL ----
#   .year <- stringr::str_extract(string = .url, pattern = "[0-9]{4}") |>
#     as.integer()
#   .month <- stringr::str_extract(
#     string = .url, pattern = paste(month.name, collapse = "|")
#   )

#   ## Quiet down error on SSL ----
#   httr::config(ssl_verifypeer = 0L) |>
#     httr::set_config()

#   ## Initiate HTML session ----
#   .session <- rvest::session(.url)

#   ## Retrieve links ----
#   if (.year == 2018 & .month %in% month.name[seq_len(5)]) {
#     eq_url <- .session |>
#       rvest::html_elements(css = "tr td a") |>
#       rvest::html_attr(name = "href") |>
#       (\(x)
#         {
#           x <- x[stringr::str_detect(string = x, pattern = "Earthquake_Information")]
#           file.path(
#             "https:/",
#             stringr::str_split_fixed(.url, pattern = "/", n = 4)[ , 3],
#             stringr::str_remove_all(
#               string = x, pattern = "^../../|^../../../../"
#             )
#           )
#         }
#       )()
#   } else {
#     eq_url <- .session |>
#       rvest::html_elements(css = ".auto-style91 a") |>
#       rvest::html_attr(name = "href") |>
#       (\(x)
#         {
#           file.path(
#             "https:/",
#             stringr::str_split_fixed(.url, pattern = "/", n = 4)[ , 3],
#             stringr::str_remove_all(
#               string = x, pattern = "\\.\\./|\\\\..\\\\..\\\\"
#             ) |>
#               stringr::str_replace_all(pattern = "\\\\", replacement = "/")
#           )
#         }
#       )()
#   }

#   eq_url <- lapply(
#     X = eq_url,
#     FUN = eq_get_bulletin_url_
#   ) |>
#     unlist()

#   eq_url
# }


# eq_get_bulletin_url_ <- function(.url) {
#   base_url <- "https://earthquake.phivolcs.dost.gov.ph"
  
#   ## Enforce standard base url ----
#   eq_url <- ifelse(
#     dirname(dirname(dirname(.url))) != base_url,
#     sub(
#       pattern = dirname(dirname(dirname(.url))),
#       x = .url,
#       replacement = base_url
#     ),
#     .url
#   )

#   ## Replace spaces with %20 ----
#   eq_url <- gsub(pattern = "\\s", replacement = "%20", x = eq_url)

#   eq_url
# }

eq_get_bulletin_link <- function(.url) {
  ## Detect year and month from URL ----
  .year <- stringr::str_extract(string = .url, pattern = "[0-9]{4}") |>
    as.integer()
  .month <- stringr::str_extract(
    string = .url, pattern = paste(month.name, collapse = "|")
  )

  ## Quiet down error on SSL ----
  httr::config(ssl_verifypeer = 0L) |>
    httr::set_config()

  session <- rvest::session(.url)

  if (.year == 2018 & .month %in% month.name[seq_len(5)]) {
    if (.month == "January") {
      urls <- session |>
        rvest::html_elements(css = ".MsoNormalTable .auto-style49 a") |>
        rvest::html_attr(name = "href")
    }

    if (.month == "February") {
      urls <- session |>
        rvest::html_elements(css = ".MsoNormalTable .auto-style21 a") |>
        rvest::html_attr(name = "href") |>
        grep(pattern = "2018_0201_1247_B1", x = _, value = TRUE, invert = TRUE)
    }

    if (.month == "March") {
      urls <- session |>
        rvest::html_elements(css = ".MsoNormalTable .auto-style21 a") |>
        rvest::html_attr(name = "href") |>
        grep(pattern = "2018_0228_1557_B1", x = _, value = TRUE, invert = TRUE) |>
        grep(pattern = "2018_0302_1428_B1", x = _, value = TRUE, invert = TRUE) |>
        grep(pattern = "2018_0309_1453_B1", x = _, value = TRUE, invert = TRUE) |>
        grep(pattern = "2018_0303_0007_B2", x = _, value = TRUE, invert = TRUE) |>
        grep(pattern = "2018_0319_1654_B1", x = _, value = TRUE, invert = TRUE) |>
        (\(x) x[c(1:245, 247:370)])()
    }

    if (.month %in% c("April", "May")) {
      urls <- session |>
        rvest::html_elements(css = ".MsoNormalTable .auto-style21 a") |>
        rvest::html_attr(name = "href")
    }
  } else {
    urls <- session |>
      rvest::html_elements(css = ".MsoNormalTable .auto-style70 a") |>
      rvest::html_attr(name = "href") 
  }

  urls <- sub(
    pattern = "../../|..\\\\..\\\\", 
    replacement = "",
    x = urls
  ) |>
    gsub(pattern = "\\\\", replacement = "/", x = _) |>
    (\(x) file.path("https://earthquake.phivolcs.dost.gov.ph", x))()

  if (!is.na(.year) & .year == 2019 & !is.na(.month) &.month == "June") {
    urls[248] <- "https://earthquake.phivolcs.dost.gov.ph/2019_Earthquake_Information/June/2019_0619_0222_B2.html"
  }

  urls
}


#'
#' @rdname eq_get_bulletin_link
#' @export
#'

eq_get_bulletin_links <- function(.url) {
  lapply(X = .url, FUN = eq_get_bulletin_link) |>
    unlist()
}