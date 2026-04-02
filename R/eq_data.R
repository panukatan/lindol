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
#' @param parallel Logical. Should the function use parallelisation? Default to
#'   FALSE.
#' @param cores The number of computer cores to use or number of child processes
#'   to be run simultaneously. Default to one less than the available number of
#'   cores on current machine.
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
  eq_get_tables(.url = .url, .year = .year, .month = .month, latest = latest) |>
    eq_process_tables()
}

#'
#' @rdname eq_data
#' @export
#'

eq_data_bulletin <- function(.url = "https://earthquake.phivolcs.dost.gov.ph/",
                             .year = NULL, .month = NULL, latest = TRUE,
                             parallel = FALSE, cores = 2) {
  urls <- eq_get_bulletin_urls(
    .url = .url, .year = .year, .month = .month, latest = latest
  )
  
  if (parallel) {
    doParallel::registerDoParallel(cores = cores)

    eq_df <- foreach::foreach(i = urls, .combine = rbind) %dopar% 
      eq_get_bulletin(.url = i) |>
      eq_process_bulletins()
  } else {
    eq_df <- urls |>
      eq_get_bulletins() |>
      eq_process_bulletins()
  }

  eq_df
}
