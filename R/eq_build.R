#'
#' Build URLs for specific earthquake bulletins
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
#'
#' @returns A vector of URLs based on given `.year` and `.month`
#'
#' @examples
#' eq_build_url()
#'
#' @export
#'

eq_build_url <- function(.url = "https://earthquake.phivolcs.dost.gov.ph/",
                         .year = NULL, .month = NULL) {
  ## Get current year and month ----
  current_year <- format(Sys.Date(), format = "%Y") |>
    as.integer()

  current_month <- format(Sys.Date(), format = "%B")

  ## Check if .year is NULL ----
  if (is.null(.year))
    .year <- seq(from = 2018, to = current_year, by = 1)

  ## Check that .year is not earlier than 2018 and not beyond current year ----
  if (all(as.integer(.year) < 2018)) {
    stop(
      "Specified year/s cannot be earlier than 2018. Please try again."
    )
  }

  if (length(.year) > 1 & any(as.integer(.year) < 2018)) {
    warning(
      "Some of the specified years are earlier than 2018. ",
      "Using only years 2018 and later."
    )
  }

  ## Check that .month values are appropriate ----
  if (is.numeric(.month) & any(.month > 12)) {
    stop(
      "Specified month/s cannot be recognised. Please check and try again."
    )
  }

  if (is.character(.month) & all(!.month %in% c(month.abb, month.name))) {
    stop(
      "Specified month/s cannot be recognised. Please check and try again."
    )
  }

  if (
    is.character(.month) & length(.month) > 1 &
    any(!.month %in% c(month.abb, month.name))
  ) {
    stop(
      "Some of the specified months cannot be recognised. ",
      "Using only months that can be recognised."
    )
  }

  ## Check if .month is null ----
  if (is.null(.month)) .month <- month.name

  if (is.numeric(.month)) {
    .month <- month.name[.month]
  } else {
    .month <- stringr::str_to_title(.month)
    .month <- month.name[month.abb == .month | month.name == .month]
  }

  ## Get urls ----
  urls <- lapply(
    X = .year,
    FUN = function(x, y) {
      file.path(
        paste0(.url, "EQLatest-Monthly"), x, paste0(x, "_", y, ".html"))
    },
    y = .month
  ) |>
    unlist()

  ## Check if current month and year are included ----
  if (current_year %in% .year & current_month %in% .month) {
    ### Remove current month and later from urls ----
    urls <- urls |>
      (\(x)
        {
          y <- file.path(
            paste0(
              file.path(
                paste0(.url, "EQLatest-Monthly"),
                current_year
              )
            ),
            paste0(
              current_year, "_",
              month.name[((1:12)[month.name == current_month] + 1):12],
              ".html"
            )
          )
          x[!x %in% y]
        }
      )()

    urls <- c(urls, .url)
  }

  ## Return urls ----
  urls
}
