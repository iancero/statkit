#' Create a new file from an R Markdown template
#'
#' This function creates a new R Markdown file based on a specified template
#' in either the current directory or a specified path.
#'
#' @param template_name Character string. The name of the template to use.
#'   Should match the directory name in inst/rmarkdown/templates/.
#' @param output_file Character string. The name of the output file to create.
#' @param output_dir Character string. The directory where the file should be created.
#'   Defaults to the current working directory.
#'
#' @return The path to the created file.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' create_from_template("basic_stats_report", "my_analysis.Rmd")
#' create_from_template("advanced_analysis_report", "complex_analysis.Rmd", "path/to/project/")
#' }
create_from_template <- function(template_name, output_file, output_dir = getwd()) {
  # Get the path to the template
  template_path <- system.file("rmarkdown", "templates", template_name, "skeleton.Rmd",
                               package = "your_package_name")

  if (template_path == "") {
    stop("Template not found. Please check the template name.")
  }

  # Create the full output path
  output_path <- file.path(output_dir, output_file)

  # Check if the output file already exists
  if (file.exists(output_path)) {
    stop("Output file already exists. Please choose a different name or location.")
  }

  # Copy the template to the new location
  file.copy(template_path, output_path)

  if (!file.exists(output_path)) {
    stop("Failed to create the output file.")
  }

  # Return the path to the created file
  return(output_path)
}
