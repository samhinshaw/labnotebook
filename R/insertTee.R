#' Insert \%T>\%.
#'
#' Call this function as an addin to insert \code{ \%T>\% } at the cursor position.
#' @importFrom rstudioapi insertText
#'
#' @export
insertTee <- function() {
	rstudioapi::insertText(" %T>% ")
}
