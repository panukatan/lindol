#'
#' Process tabular data extracted from bulletins
#'
#' @param eq_data_list A list of tibble/s of raw earthquake data extracted from
#'   PHIVOLCS earthquake information monitoring HTMLs using `eq_get_table`.
#'
#' @returns A tibble of processed earthquake data summaries.
#'
#' @examples
#' eq_tab <- eq_get_tables()
#' eq_process_tables(eq_tab)
#'
#' @rdname eq_process_table
#' @export
#'

eq_process_tables <- function(eq_data_list) {
  lapply(
    X = eq_data_list,
    FUN = eq_process_table
  ) |>
    dplyr::bind_rows()
}

#'
#' @rdname eq_process_table
#' @export
#'

eq_process_table <- function(eq_data_list) {
  if (is.null(eq_data_list)) {
    NULL
  } else {
    eq_data_list |>
      dplyr::rename_with(
        .fn = function(x) c(
          "date_time_retrieved", "date_time",
          "latitude", "longitude",
          "depth", "magnitude", "location"
        )
      ) |>
      dplyr::mutate(
        date_time = strptime(
          .data$date_time, format = "%d %B %Y - %I:%M %p", tz = "PST"
        ),
        dplyr::across(
          .cols = .data$latitude:.data$magnitude,
          .fns = ~suppressWarnings(as.numeric(.x))
        ),
        location = stringr::str_remove_all(
          string = .data$location, pattern = "\n\t\t\\s+|\r|\n\\s+"
        ) |>
          stringr::str_replace_all(pattern = "^0+", replacement = "") |>
          stringr::str_replace_all(pattern = "km| km", replacement = " km")
      )
  }
}
