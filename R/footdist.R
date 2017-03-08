#' Spearman's Footrule Distance Calculation
#'
#' @importFrom magrittr %>%
#'
#' @export foot.dist
#'
#' @param list1 Ordered vector to compare
#' @param list2 Ordered vector to compare
#'
foot.dist <- function(list1, list2){
	sapply(seq_along(list1), function(i) abs(i - (which(list2 == list1[i])))) %>% unlist() %>% sum()
}
