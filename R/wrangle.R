#' @title Prepare Microdata For Reporting
#' @description Merge microdata with hierarchy information and filter by a
#'    provided vector of unit codes.
#' @param microdata A data.frame. Your organisation's microdata file that
#'     contains the responses of each respondent. Received as the file
#'     \code{csps2019_flat.csv}.
#' @param hierarchy A data.frame. The lookup file that matches each
#'     respondent to their unit code. Received in the file
#'     \code{csps2019_hierarchy.csv}.
#' @param metadata A data.frame. The file that provides additional metadata
#'     about each unit, such as headcount and name. Received in the file
#'     \code{csps2019_hierarchy_metadata.csv}.
#' @param unit_codes A character vector of organisational unit codes in the
#'     form \code{"XX0000"}.
#' @return A data.frame.

wrangle_microdata <- function(microdata, hierarchy, metadata, unit_codes) {

  if (!any(class(microdata) == "data.frame") | !any(class(hierarchy) == "data.frame")) {
    stop("'microdata' and 'hierarchy' must be data.frame objects")
  }

  if (!class(unit_codes) == "character") {
    stop("'unit_codes' must be a character vector")
  }

  micro_with_ou <- merge(microdata, hierarchy, by = "ResponseID")
  micro_ou_filtered <- micro_with_ou[micro_with_ou$OUcode %in% unit_codes, ]
  micro_with_meta <- merge(micro_ou_filtered, metadata, by = "OUcode")

  return(micro_with_meta)

}
