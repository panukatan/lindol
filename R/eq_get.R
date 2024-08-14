#'
#' Get earthquake information tables from PHIVOLCS earthquake bulletins
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
