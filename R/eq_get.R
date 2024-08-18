#'
#' Get earthquake monitoring information from PHIVOLCS earthquake bulletin HTMLs
#'
#' @param .url Base URL for PHIVOLCS earthquake bulletins.
#' @param .year A vector for year (in YYYY format) for which earthquake
#'   bulletins are to be retrieved. The earliest year that can be specified is
#'   2018. If set to NULL (default), all years starting from 2018 to present
#'   year are used.
#' @param .month A vector for month for which earthquake bulletins are
#'   to be retrieved. This can be set as either an integer index (1 for January)
#'   or abbreviation (Jan for January) for full name. If set to NULL (default),
#'   all months are used.
#' @param latest Logical. Should the latest table of earthquake information be
#'   retrieved? Only evaluated if `.year = NULL` and `.month = NULL`. If TRUE
#'   (default), table of earthquake information for current year and current
#'   month is retrieved. Otherwise, all months for all possible years are
#'   retrieved.
#'
#' @returns A list of tibble/s of raw earthquake information from PHIVOLCS.
#'
#' @examples
#' eq_get_table()
#' eq_get_links()
#'
#' @rdname eq_get
#' @export
#'

eq_get_table <- function(.url = "https://earthquake.phivolcs.dost.gov.ph/",
                         .year = NULL, .month = NULL, latest = TRUE) {
  ## Build URLs ----
  if (is.null(.year) & is.null(.month)) {
    if (latest) {
      urls <- .url
    } else {
      urls <- eq_build_url(.url = .url, .year = .year, .month = .month)
    }
  } else {
    urls <- eq_build_url(.url = .url, .year = .year, .month = .month)
  }

  ## Quiet down error on SSL ----
  httr::config(ssl_verifypeer = 0L) |>
    httr::set_config()

  ## Retrieve and structure data ----
  lapply(
    X = urls,
    FUN = function(x) {
      rvest::session(x) |>
        rvest::html_table() |>
        (\(x)
          {
            df <- x[lapply(X = x, FUN = function(x) nrow(x) > 1) |> unlist()][[1]] |>
              dplyr::select(1:6)

            if ("X1" %in% names(df)) {
              df <- df |>
                dplyr::filter(
                  stringr::str_detect(string = .data$X1, pattern = "[0-9]{2}")
                )
            }

            df
          }
        )() |>
        dplyr::mutate(
          dplyr::across(.cols = dplyr::everything(), .fns = ~as.character(.x)),
          date_time_retrieved = Sys.time(), .before = 1
        )
    }
  )
}

#'
#' @rdname eq_get
#' @export
#'

eq_get_links_ <- function(.url) {
  ## Detect year and month from URL ----
  .year <- stringr::str_extract(string = .url, pattern = "[0-9]{4}") |>
    as.integer()
  .month <- stringr::str_extract(
    string = .url, pattern = paste(month.name, collapse = "|")
  )

  ## Quiet down error on SSL ----
  httr::config(ssl_verifypeer = 0L) |>
    httr::set_config()

  ## Retrieve links ----
  if (.year == 2018 & .month %in% month.name[seq_len(5)]) {
    rvest::session(.url) |>
      rvest::html_elements(css = "tr td .auto-style49 a") |>
      rvest::html_attr(name = "href") |>
      (\(x)
       {
         file.path(
           "https:/",
           stringr::str_split_fixed(.url, pattern = "/", n = 4)[ , 3],
           stringr::str_remove_all(string = x, pattern = "^../../")
         )
      }
      )()
  } else {
    rvest::session(.url) |>
      rvest::html_elements(css = ".auto-style91 a") |>
      rvest::html_attr(name = "href") |>
      (\(x)
       {
         file.path(
           "https:/",
           stringr::str_split_fixed(.url, pattern = "/", n = 4)[ , 3],
           stringr::str_remove_all(
             string = x, pattern = "^../../|\\\\..\\\\..\\\\"
            ) |>
             stringr::str_replace_all(pattern = "\\\\", replacement = "/")
         )
      }
      )()
  }
}

#'
#' @rdname eq_get
#' @export
#'

eq_get_links <- function(.url = "https://earthquake.phivolcs.dost.gov.ph/",
                         .year = NULL, .month = NULL, latest = TRUE) {
  ## Build URLs ----
  if (is.null(.year) & is.null(.month)) {
    if (latest) {
      urls <- .url
    } else {
      urls <- eq_build_url(.url = .url, .year = .year, .month = .month)
    }
  } else {
    urls <- eq_build_url(.url = .url, .year = .year, .month = .month)
  }

  ## Quiet down error on SSL ----
  httr::config(ssl_verifypeer = 0L) |>
    httr::set_config()

  ## Retrieve and structure data ----
  url_list <- lapply(
    X = urls,
    FUN = eq_get_links_
  )

  url_list_names <- urls |>
    (\(x)
      {
        paste(
          stringr::str_extract(
            string = x, pattern = paste(month.name, collapse = "|")
          ),
          stringr::str_extract(
            string = x, pattern = "[0-9]{4}"
          )
        )
      }
    )() |>
    (\(x)ifelse(x == "NA NA", format(Sys.Date(), format = "%B %Y"), x))()

  names(url_list) <- url_list_names

  url_list
}
