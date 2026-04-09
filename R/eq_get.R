#'
#' Get earthquake monitoring information from PHIVOLCS earthquake bulletin HTMLs
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
#' @returns A list of tibble/s of raw earthquake information from PHIVOLCS.
#'
#' @examples
#' eq_get_tables()
#'
#' @rdname eq_get_table
#' @export
#'

eq_get_tables <- function(.url = "https://earthquake.phivolcs.dost.gov.ph/",
                          .year = NULL, .month = NULL, latest = TRUE) {
  ## Build URLs ----
  if (is.null(.year) & is.null(.month)) {
    if (latest) {
      urls <- .url
    } else {
      urls <- eq_build_url(.url = .url, .year = .year, .month = .month)
    }
  } else {
    urls <- eq_build_url(.url = .url, .year = .year, .month = .month)
  }

  ## Quiet down error on SSL ----
  httr::config(ssl_verifypeer = 0L) |>
    httr::set_config()

  ## Retrieve and structure data ----
  lapply(
    X = urls,
    FUN = eq_get_table
  )
}

#'
#' @rdname eq_get_table
#' @export
#'

eq_get_table <- function(.url) {
  ## Detect year and month from URL ----
  .year <- stringr::str_extract(string = .url, pattern = "[0-9]{4}") |>
    as.integer()
  .month <- stringr::str_extract(
    string = .url, pattern = paste(month.name, collapse = "|")
  )

  ## Quiet down error on SSL ----
  httr::config(ssl_verifypeer = 0L) |>
    httr::set_config()

  ## Check URL ----
  url_error <- httr::http_error(.url)

  if (url_error) {
    tab <- NULL
  } else {
    session <- rvest::session(.url)

    tab <- session |>
      rvest::html_table() |>
      (\(x)
        {
          df <- x[lapply(X = x, FUN = function(x) nrow(x) > 1) |> unlist()][[1]] |>
            dplyr::select(1:6)

          if ("X1" %in% names(df)) {
            df <- df |>
              dplyr::filter(
                stringr::str_detect(string = .data$X1, pattern = "AM|PM")
              )
          }
        
          if ("Date - Time(Philippine Time)" %in% names(df)) {
            df <- df |>
              dplyr::filter(
                stringr::str_detect(
                  string = .data$`Date - Time(Philippine Time)`, 
                  pattern = "AM|PM"
                )
              )
          }

          df
        }
      )() 
    
    if (!is.na(.year) & .year == 2019 & !is.na(.month) &.month == "March") {
      tab <- rbind(
        tab[1:133, ],
        data.frame(
          X1 = "26 March 2019 - 05:25 PM",
          X2 = "09.55",
          X3 = "126.14",
          X4 = "024",
          X5 = "2.4",
          X6 = "026 km S 03 W of General Luna (Surigao Del Norte)"
        ),
        tab[134:883, ]
      )
    }

    if (!is.na(.year) & .year == 2019 & !is.na(.month) &.month == "April") {
      tab <- rbind(
        tab[1:372, ],
        data.frame(
          X1 = c("26 April 2019 - 02:23 PM", "26 April 2019 - 02:21 PM"),
          X2 = c("09.62", "09.74"),
          X3 = c("126.37", "126.57"),
          X4 = c("019", "011"),
          X5 = c("2.1", "3.8"),
          X6 = c(
            "030 km S 52 E of General Luna (Surigao Del Norte)",
            "046 km S 85 E of General Luna (Surigao Del Norte)"
          )
        ) |>
          setNames(nm = names(tab)),
        tab[373:517, ],
        data.frame(
          X1 = "23 April 2019 - 07:11 PM",
          X2 = "15.06",
          X3 = "120.32",
          X4 = "033",
          X5 = "1.6",
          X6 = "019 km N 41 E of Castillejos (Zambales)"
        ) |>
          setNames(nm = names(tab)),
        tab[518:622, ],
        data.frame(
          X1 = "22 April 2019 - 04:31 PM",
          X2 = "09.72",
          X3 = "126.77",
          X4 = "004",
          X5 = "3.0",
          X6 = "068 km S 84 E of General Luna (Surigao Del Norte)"
        ) |>
          setNames(nm = names(tab)),
        tab[623:736, ],
        data.frame(
          X1 = "19 April 2019 - 09:15 AM",
          X2 = "05.28",
          X3 = "123.91",
          X4 = "032",
          X5 = "2.6",
          X6 = "111 km S 45 W of Kiamba (Sarangani)"
        ) |>
          setNames(nm = names(tab)),
        tab[737:1254, ]
      )
    }

    if (!is.na(.year) & .year == 2019 & !is.na(.month) & .month == "May") {
      tab <- rbind(
        tab[1:293, ],
        data.frame(
          X1 = "19 May 2019 - 11:14 AM",
          X2 = "10.81",
          X3 = "122.07",
          X4 = "021",
          X5 = "2.6",
          X6 = "004 km S 47 W of San Remigio (Antique)" 
        ) |>
          setNames(nm = names(tab)),
        tab[294:371, ],
        data.frame(
          X1 = "17 May 2019 - 01:31 AM",
          X2 = "03.61",
          X3 = "125.29",
          X4 = "091",
          X5 = "3.1",
          X6 = "203 km S 06 W of Sarangani (Davao Occidental)"
        ) |>
          setNames(nm = names(tab)),
        tab[372:796, ],
        data.frame(
          X1 = "05 May 2019 - 08:05 AM",
          X2 = "03.98",
          X3 = "126.30",
          X4 = "014",
          X5 = "4.2",
          X6 = "185 km S 30 E of Sarangani (Davao Occidental)"
        ) |>
          setNames(nm = names(tab)),
        tab[797:829, ],
        data.frame(
          X1 = "04 May 2019 - 03:53 PM",
          X2 = "10.53",
          X3 = "125.93",
          X4 = "031",
          X5 = "3.3",
          X6 = "043 km N 64 E of Loreto (Dinagat)"
        ) |>
          setNames(nm = names(tab)),
        tab[830:853, ],
        data.frame(
          X1 = "04 May 2019 - 06:22 AM",
          X2 = "03.76",
          X3 = "126.60",
          X4 = "021",
          X5 = "4.9",
          X6 = "223 km S 34 E of Sarangani (Davao Occidental)"
        ) |>
          setNames(nm = names(tab)),
        tab[854:976, ]
      )
    }

    if (!is.na(.year) & .year == 2019 & !is.na(.month) & .month == "June") {
      tab <- rbind(
        tab[1:637, ],
        data.frame(
          X1 = "06 June 2019 - 01:36 PM",
          X2 = "03.80",
          X3 = "125.85",
          X4 = "118",
          X5 = "3.5",
          X6 = "186 km S 13 E of Sarangani (Davao Occidental)" 
        ) |>
          setNames(nm = names(tab)),
        tab[638:784, ]
      )
    }

    if (!is.na(.year) & .year == 2019 & !is.na(.month) & .month == "July") {
      tab <- rbind(
        tab[1:195, ],
        data.frame(
          X1 = "25 July 2019 - 01:01 AM",
          X2 = "05.72",
          X3 = "126.21",
          X4 = "079",
          X5 = "3.1",
          X6 = "068 km S 75 E of Jose Abad Santos (Davao Occidental)" 
        ) |>
          setNames(nm = names(tab)),
        tab[196:287, ],
        data.frame(
          X1 = c("21 July 2019 - 06:54 PM", "21 July 2019 - 06:37 PM"),
          X2 = c("16.32", "11.60"),
          X3 = c("122.25", "124.26"),
          X4 = c("037", "028"),
          X5 = c("2.0", "1.8"),
          X6 = c(
            "015 km N 72 E of Casiguran (Aurora)",
            "014 km S 78 W of Almeria (Biliran)"
          ) 
        ) |>
          setNames(nm = names(tab)),
        tab[288:417, ],
        data.frame(
          X1 = "17 July 2019 - 08:44 AM",
          X2 = "18.60",
          X3 = "121.44",
          X4 = "021",
          X5 = "2.4",
          X6 = "031 km N 75 E of Sanchez-mira (Cagayan)"
        ) |>
          setNames(nm = names(tab)),
        tab[418:573, ],
        data.frame(
          X1 = "11 July 2019 - 12:28 AM",
          X2 = "12.01",
          X3 = "124.48",
          X4 = "016",
          X5 = "2.3",
          X6 = "010 km N 23 E of Santo Niño (Western Samar)"
        ) |>
          setNames(nm = names(tab)),
        tab[574:799, ],
        data.frame(
          X1 = "03 July 2019 - 10:57 AM",
          X2 = "09.96",
          X3 = "125.45",
          X4 = "028",
          X5 = "3.3",
          X6 = "020 km N 16 W of Surigao City (Surigao Del Norte)"
        ) |>
          setNames(nm = names(tab)),
        tab[800:863, ]  
      )
    }

    if (!is.na(.year) & .year == 2019 & !is.na(.month) & .month == "August") {
      tab <- rbind(
        tab[1:541, ],
        data.frame(
          X1 = "01 August 2019 - 09:48 AM",
          X2 = "06.26",
          X3 = "126.44",
          X4 = "029",
          X5 = "2.7",
          X6 = "059 km S 43 E of Governor Generoso (Davao Oriental)" 
        ) |>
          setNames(nm = names(tab)),
        tab[542:553, ]
      )
    }

    if (!is.na(.year) & .year == 2019 & !is.na(.month) & .month == "September") {
      tab <- rbind(
        tab[1:426, ],
        data.frame(
          X1 = "19 September 2019 - 01:03 AM",
          X2 = "12.27",
          X3 = "120.81",
          X4 = "023",
          X5 = "2.0",
          X6 = "029 km S 73 W of San Jose (Occidental Mindoro)" 
        ) |>
          setNames(nm = names(tab)),
        tab[427:599, ],
        data.frame(
          X1 = "12 September 2019 - 03:57 AM",
          X2 = "03.77",
          X3 = "126.03",
          X4 = "085",
          X5 = "2.9",
          X6 = "194 km S 19 E of Sarangani (Davao Occidental)" 
        ) |>
          setNames(nm = names(tab)),
        tab[600:631, ],
        data.frame(
          X1 = "11 September 2019 - 01:43 AM",
          X2 = "10.11",
          X3 = "124.83",
          X4 = "033",
          X5 = "1.5",
          X6 = "002 km S 36 W of Maasin (Southern Leyte)" 
        ) |>
          setNames(nm = names(tab)),
        tab[632:897, ]
      )
    }

    if (!is.na(.year) & .year == 2019 & !is.na(.month) & .month == "October") {
      tab <- rbind(
        tab[1:84, ],
        data.frame(
          X1 = "31 October 2019 - 04:42 PM",
          X2 = "06.76",
          X3 = "124.70",
          X4 = "055",
          X5 = "2.5",
          X6 = "018 km S 54 W of Tulunan (Cotabato)" 
        ) |>
          setNames(nm = names(tab)),
        tab[85:164, ],
        data.frame(
          X1 = "31 October 2019 - 10:46 AM",
          X2 = "06.75",
          X3 = "124.89",
          X4 = "025",
          X5 = "1.8",
          X6 = "013 km S 30 E of Tulunan (Cotabato)" 
        ) |>
          setNames(nm = names(tab)),
        tab[165:1013, ],
        data.frame(
          X1 = "19 October 2019 - 07:15 AM",
          X2 = "06.72",
          X3 = "124.98",
          X4 = "025",
          X5 = "3.0",
          X6 = "022 km S 48 E of Tulunan (Cotabato)" 
        ) |>
          setNames(nm = names(tab)),
        tab[1014:1041, ],
        data.frame(
          X1 = "18 October 2019 - 11:42 PM",
          X2 = "06.76",
          X3 = "124.94",
          X4 = "012",
          X5 = "2.1",
          X6 = "016 km S 49 E of Tulunan (Cotabato)" 
        ) |>
          setNames(nm = names(tab)),
        tab[1042:1043, ],
        data.frame(
          X1 = c(
            "18 October 2019 - 10:36 PM", "18 October 2019 - 10:21 PM",
            "18 October 2019 - 10:19 PM", "18 October 2019 - 10:15 PM",
            "18 October 2019 - 10:10 PM", "18 October 2019 - 09:58 PM",
            "18 October 2019 - 09:56 PM"
          ),
          X2 = c("06.78", "06.79", "06.87", "06.72", "09.82", "06.79", "06.76"),
          X3 = c(
            "125.02", "124.96", "124.97", "124.96", 
            "125.95", "124.80", "124.75"
          ),
          X4 = c("008", "013", "004", "005", "002", "028", "022"),
          X5 = c("2.6", "2.5", "2.4", "2.8", "2.4", "2.6", "2.7"),
          X6 = c(
            "022 km S 70 E of Tulunan (Cotabato)", 
            "016 km S 65 E of Tulunan (Cotabato)",
            "016 km N 83 E of Tulunan (Cotabato)",
            "021 km S 45 E of Tulunan (Cotabato)",
            "006 km S 21 W of Del Carmen (Surigao Del Norte)",
            "008 km S 28 W of Tulunan (Cotabato)",
            "013 km S 40 W of Tulunan (Cotabato)"
          ) 
        ) |>
          setNames(nm = names(tab)),
        tab[1044:1269, ],
        data.frame(
          X1 = "17 October 2019 - 01:49 AM",
          X2 = "06.97",
          X3 = "125.03",
          X4 = "027",
          X5 = "1.8",
          X6 = "026 km N 59 E of Tulunan (Cotabato)" 
        ) |>
          setNames(nm = names(tab)),
        tab[1270:1808, ]
      )
    }

    if (!is.na(.year) & .year == 2019 & !is.na(.month) & .month == "December") {
      tab <- rbind(
        tab[1:359, ],
        data.frame(
          X1 = "23 December 2019 - 01:38 PM",
          X2 = "06.45",
          X3 = "125.11",
          X4 = "031",
          X5 = "3.2",
          X6 = "022 km N 55 E of Tupi (South Cotabato)" 
        ) |>
          setNames(nm = names(tab)),
        tab[360:1101, ],
        data.frame(
          X1 = "16 December 2019 - 04:32 AM",
          X2 = "06.80",
          X3 = "124.79",
          X4 = "023",
          X5 = "2.6",
          X6 = "007 km S 39 W of Tulunan (Cotabato)" 
        ) |>
          setNames(nm = names(tab)),
        tab[1102:1643, ]
      )
    }

    if (!is.na(.year) & .year == 2020 & !is.na(.month) & .month == "January") {
      tab <- rbind(
        tab[1:732, ],
        data.frame(
          X1 = c("16 January 2020 - 08:38 AM", "16 January 2020 - 08:28 AM"),
          X2 = c("06.34", "13.98"),
          X3 = c("124.95", "120.91"),
          X4 = c("033", "017"),
          X5 = c("2.6", "2.3"),
          X6 = c(
            "024 km South of Lutayan (Sultan Kudarat)",
            "004 km N 29 W of Agoncillo (Batangas)"
          ) 
        ) |>
          setNames(nm = names(tab)),
        tab[733, ],
        data.frame(
          X1 = "16 January 2020 - 07:09 AM",
          X2 = "13.92",
          X3 = "120.93",
          X4 = "021",
          X5 = "1.7",
          X6 = "001 km S 09 W of Agoncillo (Batangas)" 
        ) |>
          setNames(nm = names(tab)),
        tab[734:735, ],
        data.frame(
          X1 = "16 January 2020 - 06:06 AM",
          X2 = "14.11",
          X3 = "120.88",
          X4 = "031",
          X5 = "1.6",
          X6 = "008 km N 41 W of Laurel (Batangas)" 
        ) |>
          setNames(nm = names(tab)),
        tab[736, ],
        data.frame(
          X1 = "16 January 2020 - 05:36 AM",
          X2 = "14.00",
          X3 = "120.90",
          X4 = "018",
          X5 = "1.7",
          X6 = "007 km S 28 W of Laurel (Batangas)" 
        ) |>
          setNames(nm = names(tab)),
        tab[737, ],
        data.frame(
          X1 = "16 January 2020 - 05:05 AM",
          X2 = "09.52",
          X3 = "126.38",
          X4 = "021",
          X5 = "2.6",
          X6 = "034 km N 37 E of Cortes (Surigao Del Sur)" 
        ) |>
          setNames(nm = names(tab)),
        tab[738:740, ],
        data.frame(
          X1 = "16 January 2020 - 04:24 AM",
          X2 = "13.75",
          X3 = "120.89",
          X4 = "005",
          X5 = "1.9",
          X6 = "006 km S 89 W of Mabini (Batangas)" 
        ) |>
          setNames(nm = names(tab)),
        tab[741:751, ],
        data.frame(
          X1 = "16 January 2020 - 02:09 AM",
          X2 = "06.47",
          X3 = "125.21",
          X4 = "011",
          X5 = "2.7",
          X6 = "020 km S 01 W of Kiblawan (Davao Del Sur)" 
        ) |>
          setNames(nm = names(tab)),
        tab[752, ],
        data.frame(
          X1 = "16 January 2020 - 01:50 AM",
          X2 = "14.17",
          X3 = "121.19",
          X4 = "035",
          X5 = "1.8",
          X6 = "004 km S 65 E of Los Banos (Laguna)" 
        ) |>
          setNames(nm = names(tab)),
        tab[753:756, ],
        data.frame(
          X1 = "16 January 2020 - 01:13 AM",
          X2 = "14.01",
          X3 = "120.91",
          X4 = "012",
          X5 = "2.1",
          X6 = "006 km S 27 W of Laurel (Batangas)" 
        ) |>
          setNames(nm = names(tab)),
        tab[757:761, ],
        data.frame(
          X1 = c("15 January 2020 - 11:50 PM", "15 January 2020 - 11:48 PM"),
          X2 = c("13.79", "13.85"),
          X3 = c("120.98", "120.92"),
          X4 = c("010", "024"),
          X5 = c("2.3", "1.6"),
          X6 = c(
            "003 km N 86 W of Bauan (Batangas)",
            "003 km S 07 E of Lemery (Batangas)"
          ) 
        ) |>
          setNames(nm = names(tab)),
        tab[762:763, ],
        data.frame(
          X1 = "15 January 2020 - 11:23 PM",
          X2 = "14.03",
          X3 = "120.90",
          X4 = "013",
          X5 = "1.5",
          X6 = "005 km S 49 W of Laurel (Batangas)" 
        ) |>
          setNames(nm = names(tab)),
        tab[764:765, ],
        data.frame(
          X1 = c("15 January 2020 - 11:06 PM", "15 January 2020 - 11:02 PM"),
          X2 = c("19.18", "14.00"),
          X3 = c("119.91", "120.91"),
          X4 = c("016", "012"),
          X5 = c("2.9", "1.7"),
          X6 = c(
            "107 km N 47 W of Burgos (Ilocos Norte)",
            "006 km S 21 W of Laurel (Batangas)"
          ) 
        ) |>
          setNames(nm = names(tab)),
        tab[766:767, ],
        data.frame(
          X1 = "15 January 2020 - 10:21 PM",
          X2 = "13.99",
          X3 = "120.92",
          X4 = "004",
          X5 = "2.7",
          X6 = "007 km N 10 W of Agoncillo (Batangas)" 
        ) |>
          setNames(nm = names(tab)),
        tab[768:774, ],
        data.frame(
          X1 = "15 January 2020 - 08:59 PM",
          X2 = "13.94",
          X3 = "120.92",
          X4 = "021",
          X5 = "1.5",
          X6 = "002 km N 64 W of Agoncillo (Batangas)" 
        ) |>
          setNames(nm = names(tab)),
        tab[775, ],
        data.frame(
          X1 = "15 January 2020 - 08:31 PM",
          X2 = "13.91",
          X3 = "120.93",
          X4 = "018",
          X5 = "1.5",
          X6 = "002 km S 03 W of Agoncillo (Batangas)" 
        ) |>
          setNames(nm = names(tab)),
        tab[776:777, ],
        data.frame(
          X1 = "15 January 2020 - 07:48 PM",
          X2 = "13.97",
          X3 = "120.92",
          X4 = "009",
          X5 = "1.7",
          X6 = "004 km N 17 W of Agoncillo (Batangas)" 
        ) |>
          setNames(nm = names(tab)),
        tab[778, ],
        data.frame(
          X1 = "15 January 2020 - 07:34 PM",
          X2 = "14.12",
          X3 = "121.07",
          X4 = "012",
          X5 = "4.0",
          X6 = "004 km N 48 W of Tanauan City (Batangas)" 
        ) |>
          setNames(nm = names(tab)),
        tab[779:783, ],
        data.frame(
          X1 = "15 January 2020 - 07:12 PM",
          X2 = "06.43",
          X3 = "123.93",
          X4 = "026",
          X5 = "4.1",
          X6 = "021 km S 42 W of Kalamansig (Sultan Kudarat)" 
        ) |>
          setNames(nm = names(tab)),
        tab[784:788, ],
        data.frame(
          X1 = "15 January 2020 - 05:26 PM",
          X2 = "13.87",
          X3 = "121.05",
          X4 = "026",
          X5 = "2.1",
          X6 = "003 km South 00 of Cuenca (Batangas)" 
        ) |>
          setNames(nm = names(tab)),
        tab[789:805, ],
        data.frame(
          X1 = "15 January 2020 - 01:25 PM",
          X2 = "13.87",
          X3 = "120.97",
          X4 = "032",
          X5 = "2.0",
          X6 = "001 km N 78 E of Santa Teresita (Batangas)" 
        ) |>
          setNames(nm = names(tab)),
        tab[806:807, ],
        data.frame(
          X1 = "15 January 2020 - 01:01 PM",
          X2 = "14.02",
          X3 = "121.02",
          X4 = "016",
          X5 = "1.9",
          X6 = "008 km S 04 W of Talisay (Batangas)" 
        ) |>
          setNames(nm = names(tab)),
        tab[808:809, ],
        data.frame(
          X1 = "15 January 2020 - 12:22 PM",
          X2 = "13.81",
          X3 = "120.87",
          X4 = "034",
          X5 = "1.6",
          X6 = "007 km S 50 W of San Luis (Batangas)" 
        ) |>
          setNames(nm = names(tab)),
        tab[810:1397, ],
        data.frame(
          X1 = "12 January 2020 - 03:13 PM",
          X2 = "11.19",
          X3 = "126.13",
          X4 = "014",
          X5 = "3.7",
          X6 = "047 km N 69 E of Guiuan (Eastern Samar)" 
        ) |>
          setNames(nm = names(tab)),
        tab[1398:1415, ],
        data.frame(
          X1 = "12 January 2020 - 03:06 AM",
          X2 = "12.33",
          X3 = "121.74",
          X4 = "036",
          X5 = "2.0",
          X6 = "022 km S 88 W of Looc (Romblon)" 
        ) |>
          setNames(nm = names(tab)),
        tab[1416, ],
        data.frame(
          X1 = "12 January 2020 - 02:33 AM",
          X2 = "06.43",
          X3 = "125.27",
          X4 = "027",
          X5 = "2.6",
          X6 = "021 km S 25 W of Sulop (Davao Del Sur)" 
        ) |>
          setNames(nm = names(tab)),
        tab[1417:1418, ],
        data.frame(
          X1 = "12 January 2020 - 01:25 AM",
          X2 = "06.56",
          X3 = "124.80",
          X4 = "033",
          X5 = "2.7",
          X6 = "014 km N 48 W of Tampakan (South Cotabato)" 
        ) |>
          setNames(nm = names(tab)),
        tab[1419:1423, ],
        data.frame(
          X1 = c(
            "11 January 2020 - 08:26 PM", 
            "11 January 2020 - 08:04 PM",
            "11 January 2020 - 06:25 PM"
          ),
          X2 = c("10.00", "10.04", "08.16"),
          X3 = c("122.39", "125.25", "124.24"),
          X4 = c("020", "004", "001"),
          X5 = c("2.7", "3.2", "1.9"),
          X6 = c(
            "026 km N 84 W of Cauayan (Negros Occidental)",
            "010 km S 78 E of San Francisco (Southern Leyte)",
            "008 km S 01 W of Iligan City (Lanao Del Norte)"
          ) 
        ) |>
          setNames(nm = names(tab)),
        tab[1424:1470, ],
        data.frame(
          X1 = "10 January 2020 - 10:19 PM",
          X2 = "14.93",
          X3 = "120.04",
          X4 = "063",
          X5 = "2.0",
          X6 = "005 km S 70 W of San Antonio (Zambales)" 
        ) |>
          setNames(nm = names(tab)),
        tab[1471:1700, ],
        data.frame(
          X1 = "01 January 2020 - 03:41 PM",
          X2 = "16.15",
          X3 = "120.89",
          X4 = "028",
          X5 = "1.7",
          X6 = "005 km S 82 W of Santa Fe (Nueva Vizcaya)" 
        ) |>
          setNames(nm = names(tab)),
        tab[1701:1712, ]
      )
    }

    if (!is.na(.year) & .year == 2020 & !is.na(.month) & .month == "February") {
      tab <- rbind(
        tab[1:440, ],
        data.frame(
          X1 = "13 February 2020 - 11:56 PM",
          X2 = "06.19",
          X3 = "126.19",
          X4 = "067",
          X5 = "2.5",
          X6 = "055 km S 89 E of Don Marcelino (Davao Occidental)" 
        ) |>
          setNames(nm = names(tab)),
        tab[441:862, ]
      )
    }

    if (!is.na(.year) & .year == 2020 & !is.na(.month) & .month == "March") {
      tab <- rbind(
        tab[1:442, ],
        data.frame(
          X1 = "22 March 2020 - 03:42 AM",
          X2 = "02.98",
          X3 = "126.00",
          X4 = "133",
          X5 = "3.5",
          X6 = "277 km S 12 E of Sarangani (Davao Occidental)" 
        ) |>
          setNames(nm = names(tab)),
        tab[443:960, ],
        data.frame(
          X1 = "05 March 2020 - 09:39 PM",
          X2 = "10.00",
          X3 = "126.10",
          X4 = "032",
          X5 = "1.8",
          X6 = "004 km S 57 E of Burgos (Surigao Del Norte)" 
        ) |>
          setNames(nm = names(tab)),
        tab[961:1113, ]
      )
    }
					
		if (!is.na(.year) & .year == 2020 & !is.na(.month) & .month == "April") {
      tab <- rbind(
        tab[1:407, ],
        data.frame(
          X1 = "22 April 2020 - 12:04 PM",
          X2 = "08.45",
          X3 = "126.52",
          X4 = "012",
          X5 = "2.1",
          X6 = "023 km N 66 E of Hinatuan (Surigao Del Sur)" 
        ) |>
          setNames(nm = names(tab)),
        tab[408:1345, ]
      )
    }
    
    if (!is.na(.year) & .year == 2020 & !is.na(.month) & .month == "July") {
      tab <- rbind(
        tab[1:257, ],
        data.frame(
          X1 = "25 July 2020 - 12:46 AM",
          X2 = "08.79",
          X3 = "125.74",
          X4 = "017",
          X5 = "2.6",
          X6 = "008 km N 06 W of Bayugan City (Agusan Del Sur)" 
        ) |>
          setNames(nm = names(tab)),
        tab[258, ],
        data.frame(
          X1 = "25 July 2020 - 12:44 AM",
          X2 = "15.47",
          X3 = "122.47",
          X4 = "026",
          X5 = "1.5",
          X6 = "083 km N 19 E of Patnanungan (Quezon)" 
        ) |>
          setNames(nm = names(tab)),
        tab[259:449, ],
        data.frame(
          X1 = "19 July 2020 - 12:32 AM",
          X2 = "14.22",
          X3 = "121.22",
          X4 = "016",
          X5 = "2.4",
          X6 = "004 km N 13 W of Los Baños (Laguna)" 
        ) |>
          setNames(nm = names(tab)),
        tab[450:457, ],
        data.frame(
          X1 = "18 July 2020 - 08:43 PM",
          X2 = "10.45",
          X3 = "123.15",
          X4 = "001",
          X5 = "2.2",
          X6 = "011 km N 49 W of Canlaon City (Negros Oriental)" 
        ) |>
          setNames(nm = names(tab)),
        tab[458:483, ],
        data.frame(
          X1 = "18 July 2020 - 02:20 AM",
          X2 = "11.31",
          X3 = "125.46",
          X4 = "018",
          X5 = "2.6",
          X6 = "012 km N 51 W of General Macarthur (Eastern Samar)" 
        ) |>
          setNames(nm = names(tab)),
        tab[484:1088, ]
      )
    }
										
    if (!is.na(.year) & .year == 2020 & !is.na(.month) & .month == "September") {
      tab <- rbind(
        tab[1:313, ],
        data.frame(
          X1 = "23 September 2020 - 07:26 PM",
          X2 = "13.97",
          X3 = "120.87",
          X4 = "011",
          X5 = "2.1",
          X6 = "008 km N 54 E of Calaca (Batangas)" 
        ) |>
          setNames(nm = names(tab)),
        tab[314:1062, ]
      )
    }

    if (!is.na(.year) & .year == 2020 & !is.na(.month) & .month == "October") {
      tab <- rbind(
        tab[1:807, ],
        data.frame(
          X1 = "07 October 2020 - 06:28 AM",
          X2 = "09.38",
          X3 = "126.14",
          X4 = "012",
          X5 = "1.9",
          X6 = "013 km N 25 W of Cortes (Surigao Del Sur)" 
        ) |>
          setNames(nm = names(tab)),
        tab[808:811, ],
        data.frame(
          X1 = "07 October 2020 - 06:02 AM",
          X2 = "14.95",
          X3 = "121.34",
          X4 = "022",
          X5 = "1.7",
          X6 = "028 km S 87 E of Doña Remedios Trinidad (Bulacan)" 
        ) |>
          setNames(nm = names(tab)),
        tab[812:1137, ]
      )
    }

    if (!is.na(.year) & .year == 2020 & !is.na(.month) & .month == "November") {
      tab <- rbind(
        tab[1:173, ],
        data.frame(
          X1 = "25 November 2020 - 03:38 AM",
          X2 = "07.53",
          X3 = "125.64",
          X4 = "031",
          X5 = "2.3",
          X6 = "002 km S 75 E of Santo Tomas (Davao Del Norte)" 
        ) |>
          setNames(nm = names(tab)),
        tab[174:880, ]
      )
    }

    if (!is.na(.year) & .year == 2020 & !is.na(.month) & .month == "December") {
      tab <- rbind(
        tab[1:25, ],
        data.frame(
          X1 = "31 December 2020 - 04:42 AM",
          X2 = "05.52",
          X3 = "125.42",
          X4 = "002",
          X5 = "3.2",
          X6 = "012 km N 02 W of Sarangani (Davao Occidental)" 
        ) |>
          setNames(nm = names(tab)),
        tab[26:998, ]
      )
    }

    if (!is.na(.year) & .year == 2021 & !is.na(.month) & .month == "January") {
      tab <- rbind(
        tab[1:59, ],
        data.frame(
          X1 = "28 January 2021 - 09:44 PM",
          X2 = "14.14",
          X3 = "121.23",
          X4 = "035",
          X5 = "1.7",
          X6 = "004 km S 11 E of Los Baños (Laguna)" 
        ) |>
          setNames(nm = names(tab)),
        tab[60:80, ],
        data.frame(
          X1 = "28 January 2021 - 02:49 AM",
          X2 = "14.25",
          X3 = "121.20",
          X4 = "011",
          X5 = "3.0",
          X6 = "008 km N 18 W of Los Baños (Laguna)" 
        ) |>
          setNames(nm = names(tab)),
        tab[81 :781, ]
      )
    }

    if (!is.na(.year) & .year == 2021 & !is.na(.month) & .month == "February") {
      tab <- rbind(
        tab[1:612, ],
        data.frame(
          X1 = c("08 February 2021 - 09:09 AM", "08 February 2021 - 08:25 AM"),
          X2 = c("08.89", "09.47"),
          X3 = c("126.62", "126.45"),
          X4 = c("010", "016"),
          X5 = c("2.0", "1.9"),
          X6 = c(
            "037 km N 75 E of Marihatag (Surigao Del Sur)",
            "036 km N 54 E of Cortes (Surigao Del Sur)"
          ) 
        ) |>
          setNames(nm = names(tab)),
        tab[613:824, ]
      )
    }

    if (!is.na(.year) & .year == 2021 & !is.na(.month) & .month == "April") {
      tab <- rbind(
        tab[1:606, ],
        data.frame(
          X1 = c("07 April 2021 - 12:57 PM", "07 April 2021 - 10:22 AM"),
          X2 = c("05.86", "19.62"),
          X3 = c("124.60", "120.96"),
          X4 = c("010", "001"),
          X5 = c("2.8", "2.1"),
          X6 = c(
            "015 km S 09 W of Kiamba (Sarangani)",
            "067 km N 54 W of Calayan (Cagayan)"
          ) 
        ) |>
          setNames(nm = names(tab)),
        tab[607:838, ]
      )
    }

    if (!is.na(.year) & .year == 2021 & !is.na(.month) & .month == "May") {
      tab <- rbind(
        tab[1:159, ],
        data.frame(
          X1 = "27 May 2021 - 03:53 AM",
          X2 = "06.43",
          X3 = "126.98",
          X4 = "056",
          X5 = "3.2",
          X6 = "090 km S 41 E of Tarragona (Davao Oriental)" 
        ) |>
          setNames(nm = names(tab)),
        tab[160:460, ],
        data.frame(
          X1 = "16 May 2021 - 03:15 AM",
          X2 = "06.00",
          X3 = "124.86",
          X4 = "022",
          X5 = "2.1",
          X6 = "022 km N 43 W of Maasim (Sarangani)" 
        ) |>
          setNames(nm = names(tab)),
        tab[461:931, ]
      )
    }

    if (!is.na(.year) & .year == 2021 & !is.na(.month) & .month == "June") {
      tab <- rbind(
        tab[1:322, ],
        data.frame(
          X1 = "21 June 2021 - 08:33 PM",
          X2 = "09.40",
          X3 = "126.20",
          X4 = "017",
          X5 = "2.6",
          X6 = "014 km N 03 E of Cortes (Surigao Del Sur)" 
        ) |>
          setNames(nm = names(tab)),
        tab[323:501, ],
        data.frame(
          X1 = c("18 June 2021 - 06:22 AM", "18 June 2021 - 05:57 AM"),
          X2 = c("08.91", "16.42"),
          X3 = c("126.07", "120.83"),
          X4 = c("124", "034"),
          X5 = c("2.3", "1.6"),
          X6 = c(
            "028 km N 64 W of Marihatag (Surigao Del Sur)",
            "008 km S 02 E of Bokod (Benguet)"
          ) 
        ) |>
          setNames(nm = names(tab)),
        tab[502:1377, ],
        data.frame(
          X1 = "06 June 2021 - 10:00 AM",
          X2 = "13.34",
          X3 = "120.15",
          X4 = "011",
          X5 = "2.1",
          X6 = "043 km S 15 W of Looc (Occidental Mindoro)" 
        ) |>
          setNames(nm = names(tab)),
        tab[1378:1464, ],
        data.frame(
          X1 = c("04 June 2021 - 12:15 AM", "03 June 2021 - 10:44 PM"),
          X2 = c("13.41", "10.16"),
          X3 = c("120.02", "124.58"),
          X4 = c("015", "014"),
          X5 = c("2.4", "2.2"),
          X6 = c(
            "043 km S 36 W of Looc (Occidental Mindoro)",
            "028 km N 87 E of Talibon (Bohol)"
          ) 
        ) |>
          setNames(nm = names(tab)),
        tab[1465:1574, ]
      )
    }
    
    if (!is.na(.year) & .year == 2021 & !is.na(.month) & .month == "August") {
      tab <- rbind(
        tab[1:948, ],
        data.frame(
          X1 = "12 August 2021 - 09:21 AM",
          X2 = "05.89",
          X3 = "127.57",
          X4 = "030",
          X5 = "3.3",
          X6 = "178 km S 44 E of Tarragona (Davao Oriental)" 
        ) |>
          setNames(nm = names(tab)),
        tab[949:1339, ]
      )
    }

    if (!is.na(.year) & .year == 2021 & !is.na(.month) & .month == "November") {
      tab <- rbind(
        tab[1:499, ],
        data.frame(
          X1 = "16 November 2021 - 10:26 AM",
          X2 = NA_character_,
          X3 = NA_character_,
          X4 = NA_character_,
          X5 = "1.9",
          X6 = "011 km from Masbate City" 
        ) |>
          setNames(nm = names(tab)),
        tab[500:624, ],
        data.frame(
          X1 = "12 November 2021 - 02:50 AM",
          X2 = "08.64",
          X3 = "127.40",
          X4 = "022",
          X5 = "2.6",
          X6 = "121 km N 76 E of Hinatuan (Surigao Del Sur)" 
        ) |>
          setNames(nm = names(tab)),
        tab[625:959, ]
      )
    }

    if (!is.na(.year) & .year == 2022 & !is.na(.month) & .month == "October") {
      tab <- rbind(
        tab[1:162, ],
        data.frame(
          X1 = "28 October 2022 - 01:30 AM",
          X2 = "17.85",
          X3 = "120.77",
          X4 = "002",
          X5 = "4.0",
          X6 = "013 km S 57 E of Nueva Era (Ilocos Norte)" 
        ) |>
          setNames(nm = names(tab)),
        tab[163:1354, ]
      )
    }

    if (!is.na(.year) & .year == 2023 & !is.na(.month) & .month == "April") {
      tab <- rbind(
        tab[1:62, ],
        data.frame(
          X1 = "29 April 2023 - 02:48 AM",
          X2 = "06.33",
          X3 = "126.51",
          X4 = "029",
          X5 = "2.4",
          X6 = "060 km S 54 E of Governor Generoso (Davao Oriental)" 
        ) |>
          setNames(nm = names(tab)),
        tab[63:1242, ]
      )
    }

    tab <- tab |>
      dplyr::mutate(
        dplyr::across(.cols = dplyr::everything(), .fns = ~as.character(.x)),
        bulletin_url = eq_get_bulletin_links(.url)
        #date_time_retrieved = Sys.time(), .before = 1
      )
  }

  tab
}
