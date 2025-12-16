eipps_ranges <- tibble::tribble(
  ~start , ~end  , ~range      , ~abbr        , ~desc                             ,
  1200L  , 1224L , "1200-1224" , "ADH (Ret.)" , "Alcohol-Drug Hospital (Retired)" ,
  2000L  , 2299L , "2000-2299" , "LTC"        , "Long-Term Care Hospital"         ,
  3025L  , 3099L , "3025-3099" , "IRF"        , "Rehabilitation Hospital"         ,
  3300L  , 3399L , "3300-3399" , "CH"         , "Children's Hospital"             ,
  4000L  , 4499L , "4000-4499" , "PH"         , "Psychiatric Hospital"
)

usethis::use_data(eipps_ranges, overwrite = TRUE)

eipps_types <- tibble::tribble(
  ~code , ~abbr , ~desc                         ,
  "S"   , "PSY" , "Psychiatric Unit"            ,
  "T"   , "IRF" , "Rehabilitation Unit"         ,
  "V"   , "ADU" , "Alcohol-Drug Unit (Retired)"
)

usethis::use_data(eipps_types, overwrite = TRUE)
