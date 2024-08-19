#'
#' Process earthquake information from PHIVOLCS bulletins
#'
#' @param eq_df A tibble of earthquake information from PHIVOLCS bulletins
#'  retrieved using `eq_get_bulletins()`.
#'
#' @returns A tibble of processed earthquake information from PHIVOLCS
#'   bulletins.
#'
#' @examples
#' urls <- eq_get_bulletin_urls()
#' eq_get_bulletins(urls[1:3]) |>
#'   eq_process_bulletins()
#'
#' @rdname eq_process_bulletin
#' @export
#'

eq_process_bulletins <- function(eq_df) {
  eq_df |>
    dplyr::mutate(
      date_time = strptime(
        .data$date_time, format = "%d %B %Y - %I:%M:%S %p", tz = "PST"
      ),
      bulletin_number = as.integer(.data$bulletin_number),
      longitude = get_longitude(.data$location),
      latitude = get_latitude(.data$location),
      depth = as.integer(.data$depth),
      magnitude = stringr::str_remove_all(
        string = .data$magnitude, pattern = "Ms "
      ) |>
        as.numeric(),
      location = get_location(.data$location),
      origin = tolower(.data$origin),
      reported_intensity = ifelse(
        .data$reported_intensity == "", NA_character_, .data$reported_intensity
      ),
      expect_damage = tolower(.data$expect_damage),
      expect_aftershocks = tolower(.data$expect_aftershocks),
      date_time_issued = strptime(
        .data$date_time_issued, format = "%d %B %Y - %I:%M %p", tz = "PST"
      )
    ) |>
    dplyr::select(
      .data$date_time, .data$bulletin_number, .data$longitude, .data$latitude,
      .data$depth, .data$magnitude, .data$reported_intensity, .data$location,
      .data$origin, .data$expect_damage, .data$expect_aftershocks,
      .data$date_time_issued, .data$prepared_by
    )
}
