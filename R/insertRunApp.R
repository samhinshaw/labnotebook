#' Run App.
#'
#' Call this function as an addin to paste in the code to run your shiny app.
#' @importFrom rstudioapi insertText
#'
#' @export
insertRunApp <- function() {
	rstudioapi::insertText("library(shiny); runApp()")
}
