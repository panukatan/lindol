#'
#' Retrieve raw information from PHIVOLCS earthquake information bulletins
#'
#' @param .url A character value or vector of values for PHIVOLCS earthquake
#'   information bulletins
#'
#' @returns A tibble of earthquake information from PHIVOLCS bulletins
#'
#' @examples
#' .url <- eq_build_url(.year = 2023, .month = "January")
#' urls <- eq_get_bulletin_links(.url)
#' eq_get_bulletins(urls[1:3])
#'
#' @rdname eq_get_bulletin
#' @export
#'

eq_get_bulletin <- function(.url) {
  ## Quiet down error on SSL ----
  httr::config(ssl_verifypeer = 0L) |>
    httr::set_config()

  ## Check URL ----
  if (is.null(.url)) {
    url_error <- TRUE
  } else {
    url_error <- httr::http_error(.url)
  }

  ## Check if .url is html ----
  if (grepl(pattern = ".html", x = .url)) {
    html_error <- FALSE
  } else {
    html_error <- TRUE  
  }
  
  if (url_error | html_error) {
    ## Detect year and month from URL ----
    .year <- stringr::str_extract(string = .url, pattern = "[0-9]{4}") |>
      as.integer()
    .month <- stringr::str_extract(
      string = .url, pattern = paste(month.name, collapse = "|")
    )

    eq_df <- eq_data_summary(.year = .year, .month = .month) |>
      dplyr::filter(.data$bulletin_url == .url)

    tibble::tibble(
      date_time = as.character(eq_df$date_time),
      bulletin_number = NA_character_,
      depth = as.character(eq_df$depth),
      magnitude = as.character(eq_df$magnitude),
      location = paste0(
        eq_df$latitude, ", ", eq_df$longitude, " - ", eq_df$location
      ),
      origin = NA_character_,
      reported_intensity = NA_character_,
      expect_damage = NA_character_,
      expect_aftershocks = NA_character_,
      date_time_issued = NA_character_,
      prepared_by = NA_character_
    )
  } else {
    rvest::session(url = .url) |>
      rvest::html_table() |>
      (\(x) x[[1]])() |>
      (\(x)
        {
          tibble::tibble(
            date_time = x[2, 4],
            bulletin_number = stringr::str_extract(
              string = x[1, 1], pattern = "[0-9]{1,}"
            ),
            depth = x[2, 8],
            magnitude = x[2, 12],
            location = x[2, 6],
            origin = x[2, 10],
            reported_intensity = x[9, 3],
            expect_damage = x[11, 4],
            expect_aftershocks = x[11, 6],
            date_time_issued = x[11, 8],
            prepared_by = x[11, 10]
          ) |>
            dplyr::mutate(
              dplyr::across(
                .cols = dplyr::everything(),
                .fns = ~simplify_vectors(.x)
              )
            )
        }
      )()
  }
}

#'
#' @rdname eq_get_bulletin
#' @export
#'

eq_get_bulletins <- function(.url) {
  lapply(
    X = .url,
    FUN = eq_get_bulletin
  ) |>
    dplyr::bind_rows()
}
