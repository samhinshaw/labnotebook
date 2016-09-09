#' Import CEL files and Export Matches
#'
#' Import CEL files in the working directory and return the Quantile-Normalized
#' perfect matches!
#'
#' @param phenoData AnnotatedDataFrame from read.AnnotatedDataFrame
#' @param ... character vector of CEL file directory
#'
#' @return data.frame (tbl_df)
#' @export
#'
#' @importFrom magrittr %>%
#' @importFrom magrittr %<>%
#' @importFrom dplyr tbl_df
#'
importCEL <- function(phenoData, ...){

	affybatch <- affy::ReadAffy(phenoData = phenoData, celfile.path = ...) # read our Affy CEL files with the corresponding phenotype data
	pm <- as.data.frame(affy::probes(affybatch, which = "pm")) # pull out our perfect match probes
	mm <- as.data.frame(affy::probes(affybatch, which = "mm")) # pull out our mismatch probes

	## Log Transformation##
	pm  %<>% log(2)
	mm  %<>% log(2)

	## Clean Column Names ##
	colnames(pm) <- gsub(".CEL$", "", colnames(pm))
	colnames(mm) <- gsub(".CEL$", "", colnames(mm))

	## Quantile Normalization ##
	pmNormalized <- pm %>%
		as.matrix() %>%
		preprocessCore::normalize.quantiles() %>%
		as.data.frame() %>% tbl_df()
	mmNormalized <- mm %>%
		as.matrix() %>%
		preprocessCore::normalize.quantiles() %>%
		as.data.frame() %>% tbl_df()
	return(pmNormalized)
}
