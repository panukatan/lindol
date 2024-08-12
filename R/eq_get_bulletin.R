#'
#' Get earthquake information from PHIVOLCS earthquake bulletins
#'
#' @param .url Base URL for PHIVOLCS earthquake bulletins.
#'
#' @returns A tibble of latest earthquake information from PHIVOLCS.
#'
#' @examples
#' eq_get_current()
#'
#' @rdname eq_get
#' @export
#'

eq_get_current <- function(.url = "https://earthquake.phivolcs.dost.gov.ph/") {
  ## Quiet down error on SSL ----
  httr::config(ssl_verifypeer = 0L) |>
    httr::set_config()

  ## Retrieve and structure data ----
  rvest::session(.url) |>
    rvest::html_table() |>
    (\(x) x[[3]])() |>
    dplyr::rename_with(
      .fn = function(x) c(
        "date_time", "longitude", "latitude", "depth", "magnitude", "location"
      )
    ) |>
    dplyr::mutate(
      date_time = strptime(
        .data$date_time, format = "%d %B %Y - %I:%M %p", tz = "PST"
      ),
      location = stringr::str_remove_all(
        string = .data$location, pattern = "\n\t\t "
      ) |>
        stringr::str_replace_all(pattern = "^0+", replacement = ""),
      retrieval_date_time = Sys.time()
    ) |>
    dplyr::relocate(
      .data$retrieval_date_time, .before = .data$date_time
    )
}
