library(csodata)
library(purrr)
library(readr)
library(data.table)
library(stringr)

setwd('L:\\GitHub\\econ_dash')


pxstat_codes <- c('NAQ04', 'NQI01', 'GFQ10', 'GFQ12', 'ISQ04', 'BPQ15', 'CPM16', 'TSM01', 'WPM24', 'RSM05', 'NDQ07', 'MSI02', 'TFQ01', 'GFQ01', 'GFQ02', 'TSM09', 'HPM09', 'QLF03',
                  'MUM01', 'LRM13', 'EHQ03', 'NDQ06', 'MSI02', 'TFQ02', 'TEM01', 'NAQ05')


cso_tables <- cso_get_toc()

todays_date <- format(now(), '%Y-%m-%d')

econ_dash_tables <- cso_tables %>%
  filter(id %in% pxstat_codes) %>%
  mutate(TimePeriod = format(LastModified, '%Y-%m-%d'))


if (todays_date %in% econ_dash_tables$TimePeriod){
  
  data <- map(pxstat_codes, cso_get_data, wide_format = FALSE, cache = FALSE)
  names(data) <- map_chr(pxstat_codes, str_to_lower)
  
  
  data %>% names(.) %>%
    walk(~ write_csv(data[[.]], paste0(., ".csv")))
  
  
}





