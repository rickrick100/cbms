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
  
  main <- fread(main)
  main1 <- main[,c('main.id', 'brgy', 'hcn', 'hhhead', 'phsize')] %>%
    group_by(brgy) %>%
    summarise(total = sum(phsize),
              hh = length(brgy))
  main1$brgy <- as.factor(main1$brgy)
  brgyL <- data.frame(brgys =c('Balite', 'Burgos', 'Geronimo', 'Macabud',
                               'Manggahan', 'Mascap', 'Puray', 'Rosario',
                               'San Isidro', 'San Jose', 'San Rafael'),
                      pop2015 = c(9983, 44100, 5554, 9707, 13913, 4699,
                                  3921, 7244, 117277, 124868, 27956))
  main1$brgy <- levels(brgyL$brgys)
  main1 <- main1 %>%
    mutate(pop2015 = brgyL$pop2015,
           needed = pop2015-total,
           progress = percent((total/pop2015))) %>%
    arrange(desc(total))
  fwrite(main1,'overall.csv')
  
}