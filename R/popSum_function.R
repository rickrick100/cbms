#' popSum Function
#'
#' This function allows you to generate a summary of Population and Household in cbms.
#' @param main CBMS CORE HPQ VN05201701 main.csv from your .can file. Can be a path don't forget to quote it or store it in variable.
#' @keywords cbms
#' @export
#' @examples
#' popSum('main.csv')
#' 
#' popSum('"C:/Users/name/main.csv"')

popSum <- function(main) {
  overall <- read_csv(main)
  a <- overall %>%
    select(brgy,phsize) %>%
    group_by(brgy) %>%
    summarise(total = sum(phsize),
              hh = length(brgy)) %>%
    arrange(total)
  write_csv(a,'overall.csv')
}