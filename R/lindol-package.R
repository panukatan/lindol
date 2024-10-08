#'
#' An Interface to the PHIVOLCS Earthquake Bulletins
#'
#' The Philippine Institute of Volcanology and Seismology (PHIVOLCS)
#' maintains the National Earthquake Monitoring and Information which aims to
#' provide accurate and timely information on significant earthquakes and
#' tsunami events that may significantlly impact the Philippines and ensures the
#' accessibility and integrity of earthquake data. This package provides an
#' interface to this dataset through the frequent earthquake bulletins released
#' by PHIVOLCS.
#'
#' @docType package
#' @keywords internal
#' @name lindol
#' @importFrom httr config
#' @importFrom rlang .data
#' @importFrom dplyr mutate relocate rename_with bind_rows select everything
#'   across
#' @importFrom stringr str_to_title str_remove_all str_replace_all str_detect
#'   str_remove str_replace
#' @importFrom rvest session html_table
#' @importFrom tibble tibble
#'
"_PACKAGE"
