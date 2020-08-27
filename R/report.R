#' @title Generate A CSPS Report
#' @description Provide microdata and unit codes to generate a report from a
#'     template. Designed for use by designated analysts who have access to
#'     Civil Service People Survey data for their organisation.
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
#' @param out_dir Character. An existing directory to which the output will be
#'     written.
#' @return A rendered PDF file in the provided location.
#' @export
#' @examples \dontrun{
#'     # Read files
#'     library(readr)
#'     micro_df <- read_csv("~/Documents/CO2019_flat.csv",)
#'     hier_df <- read_csv("~/Documents/CO2019_hierarchy.csv")
#'     meta_df <- read_csv("~/Documents/CO2019_hierarchy_metadata.csv")
#'
#'     # Create a report for the specified unit codes
#'     generate_report(
#'         microdata = micro_df,
#'         hierarchy = hier_df,
#'         metadata = meta_df,
#'         unit_codes = c("CO0027", "CO0205", "CO0384"),
#'         out_dir = "~/Documents/reports"
#'    )
#'    }

generate_report <- function(microdata, hierarchy, metadata, unit_codes, out_dir) {

  # Catch basic input failures
  if (!is.character(out_dir) | !isTRUE(dir.exists(out_dir))) {
    stop("'out_dir' must be a string that's a path to an existing directory")
  }

  # Prepare the microdata
  data <- wrangle_microdata(microdata, hierarchy, metadata, unit_codes)

  # Path to the Rmd template in the package inst/ folder
  rmd <- system.file(
    "rmarkdown", "templates", "cspsreports", "skeleton", "skeleton.Rmd",
    package = "cspsreports"
  )

  # Prepare file name with today's date
  file_name <- paste0(format(Sys.Date(), "%Y%m%d"), "_csps-report")

  # Render the template to HTML
  rmarkdown::render(
    input = rmd,                     # .Rmd file
    output_format = "pdf_document",  # knit to HTML and PDF
    output_dir = out_dir,            # folder to write out to
    output_file = file_name          # file name for output
  )

}
