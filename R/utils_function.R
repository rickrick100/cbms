#' cbmsUtils Function
#'
#' This function allows you to generate/segregate: duplicate files, unfiltered files and distinct files.
#' @param main CBMS CORE HPQ VN05201701 main.csv from your .can file. Can be a path don't forget to quote it or store it in variable.
#' @keywords cbms
#' @export
#' @examples
#' cbmsUtils('main.csv')
#' 
#' cbmsUtils('"C:/Users/name/main.csv"')
#' @import dplyr readr
#'
cbmsUtils <- function(main) {
  
  mainFile <- read_csv(main)
  
  dupli <- mainFile %>%
    filter(hcn %in% unique(.[["hcn"]][duplicated(.[["hcn"]])]) &
           hhhead %in% unique(.[["hhhead"]][duplicated(.[["hhhead"]])]) &
           respondent %in% unique(.[["respondent"]][duplicated(.[["respondent"]])]) &
           totin %in% unique(.[["totin"]][duplicated(.[["totin"]])])) %>%
    arrange(hcn)
  
  unfil <- mainFile %>%
    filter(hcn %in% unique(.[["hcn"]][duplicated(.[["hcn"]])]) |
             hhhead %in% unique(.[["hhhead"]][duplicated(.[["hhhead"]])]))
  
  dist <- mainFile %>%
    distinct(hcn,hhhead, respondent, totin, .keep_all = T)
  
  write_csv(dupli, 'duplicated.csv')
  write_csv(unfil, 'unfiltered.csv')
  write_csv(dist, 'distinct.csv')
  
}
