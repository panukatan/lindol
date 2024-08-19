#'
#' Retrieve earthquake information data from PHIVOLCS bulletins
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
#' @returns A tibble of processed earthquake data.
#'
#' @examples
#' eq_data_summary()
#'
#' @rdname eq_data
#' @export
#'

eq_data_summary <- function(.url = "https://earthquake.phivolcs.dost.gov.ph/",
                            .year = NULL, .month = NULL, latest = TRUE) {
  ## Retrieve data tables and process ----
  eq_get_table(.url = .url, .year = .year, .month = .month, latest = latest) |>
    eq_process_table(simplify = TRUE)
}

#'
#' @rdname eq_data
#' @export
#'

eq_data_bulletin <- function(.url = "https://earthquake.phivolcs.dost.gov.ph/",
                             .year = NULL, .month = NULL, latest = TRUE) {
  eq_get_bulletin_urls(
    .url = .url, .year = .year, .month = .month, latest = latest
  ) |>
    eq_get_bulletins() |>
    eq_process_bulletins()
}
