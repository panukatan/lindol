#'
#' Process tabular data extracted from bulletins
#'
#' @param eq_data_list A list of tibble/s of raw earthquake data extracted from
#'   PHIVOLCS earthquake information monitoring HTMLs using `eq_get_table`.
#' @param simplify Logical. Should output be simplified into a data.frame or
#'   tibble? Default is TRUE. Otherwise, a list of processed tibbles of
#'   earthquake monitoring data.
#'
#' @returns A tibble of processed earthquake data.
#'
#' @examples
#' eq_tab <- eq_get_table()
#' eq_process_table(eq_tab)
#'
#' @export
#'

eq_process_table <- function(eq_data_list, simplify = TRUE) {
  df <- lapply(
    X = eq_data_list,
    FUN = function(x) {
      x |>
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
            .fns = ~as.numeric(.x)
          ),
          location = stringr::str_remove_all(
            string = .data$location, pattern = "\n\t\t "
          ) |>
            stringr::str_replace_all(pattern = "^0+", replacement = "")
        )
    }
  )

  if (simplify) {
    df <- dplyr::bind_rows(df)
  }

  df
}
