#'
#' Retrieve earthquake information data from PHIVOLCS bulletins
#'
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
#' @param simplify Logical. Should output be simplified into a data.frame or
#'   tibble? Default is TRUE. Otherwise, a list of processed tibbles of
#'   earthquake monitoring data.
#'
#' @returns A tibble of processed earthquake data.
#'
#' @examples
#' eq_data()
#'
#' @export
#'

eq_data <- function(.year = NULL, .month = NULL,
                    latest = TRUE, simplify = TRUE) {
  ## Retrieve data tables and process ----
  eq_get_table(.year = .year, .month = .month, latest = latest) |>
    eq_process_table(simplify = simplify)
}
