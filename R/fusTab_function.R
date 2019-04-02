#' fusTab Function
#'
#' This function you to create a geopoint and lite version of main.csv for gps tracking
#' @param main CBMS CORE HPQ VN05201701 main.csv from your .can file. Can be a path don't forget to quote it or store it in variable.
#' @keywords cbms
#' @export
#' @examples
#' fusTab('main.csv')
#' 
#' fusTab('"C:/Users/name/main.csv"')

fusTab <- function(main) {
  
  overall <- read_csv(main)
  a <- overall %>%
    mutate(geo = paste(geopoint_hh.latitude,',',geopoint_hh.longitude)) %>%
    select(brgy,main.creator, main.uploader, hcn, geo, geopoint_hh.accuracy, street,
         hnum, phsize,supervisor,interviewer, int_date_fedtd)
  a$int_date_fedtd <- as.Date(a$int_date_fedtd, "%m/%d/%Y")
  
  write_csv(a,'overall.csv')
  
}