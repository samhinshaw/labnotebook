#' Keyboard Shortcut for magrittr functions
#'
#'
#' @export
#' @importFrom rstudioapi insertText
#'
insertBackPipe <- function() {
	rstudioapi::insertText(" %<>% ")
}

insertTee <- function() {
	rstudioapi::insertText(" %T>% ")
}

insertInAddin <- function() {
	rstudioapi::insertText(" %in% ")
}

insertRunApp <- function() {
	rstudioapi::insertText(" library(shiny); runApp() ")
}
