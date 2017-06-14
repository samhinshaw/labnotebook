#' Spearman's Footrule Distance Calculation
#'
#' @importFrom magrittr %>%
#'
#' @export notNAs
#'
#' @param vector a vector from which you would like to remove NA values
#'
notNAs <- function(vector) {
	vector <- vector[!is.na(vector)]
	return(vector)
}
