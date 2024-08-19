#'
#' Retrieve raw information from PHIVOLCS earthquake information bulletins
#'
#' @param .url A character value or vector of values for PHIVOLCS earthquake
#'   information bulletins
#'
#' @returns A tibble of earthquake information from PHIVOLCS bulletins
#'
#' @examples
#' urls <- eq_get_bulletin_urls()
#' eq_get_bulletins(urls[1:3])
#'
#' @rdname eq_get_bulletin
#' @export
#'

eq_get_bulletin <- function(.url) {
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
