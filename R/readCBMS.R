#' readCBMS Function
#'
#' This function reads all file in a directory.
#' @param fread for faster data reading and larger data
#' @param read.csv for small data
#' @keywords cbms
#' @export
#' @examples
#' readCBMS('fread')
#' 
#' readCBMS('read.csv')

readCBMS <- function(x) {
  temp = list.files(pattern="*.csv")
  #read all csv
  list2env(
    lapply(setNames(temp, make.names(gsub("*.csv$", "", temp))), 
           x), envir = .GlobalEnv)
}
