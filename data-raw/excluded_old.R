#' @noRd
MedicaidOnlyProvider <- S7::new_class(
  name             = "MedicaidOnlyProvider",
  parent           = Provider,
  properties       = list(
    type_code      = S7::class_character,
    type_abbr      = S7::new_property(S7::class_character, getter = \(self) get_caid_abbr(self@type_code)),
    type_name      = S7::new_property(S7::class_character, getter = \(self) get_caid_name(self@type_abbr)),
    facility_range = S7::new_property(S7::class_character, getter = \(self) get_caid_range(self@sequence)),
    facility_abbr  = S7::new_property(S7::class_character, getter = \(self) get_caid_range_abbr(self@facility_range)),
    facility_name  = S7::new_property(S7::class_character, getter = \(self) get_caid_range_name(self@facility_abbr))
    )
  )

#' @noRd
IPPSExcludedProvider <- S7::new_class(
  name             = "IPPSExcludedProvider",
  parent           = Provider,
  properties       = list(
    type_code      = S7::class_character,
    type_abbr      = S7::new_property(S7::class_character, getter = \(self) get_ipps_abbr(self@type_code)),
    type_name      = S7::new_property(S7::class_character, getter = \(self) get_ipps_name(self@type_abbr)),
    facility_range = S7::new_property(S7::class_character, getter = \(self) get_caid_range(self@sequence)),
    facility_abbr  = S7::new_property(S7::class_character, getter = \(self) get_caid_range_abbr(self@facility_range)),
    facility_name  = S7::new_property(S7::class_character, getter = \(self) get_caid_range_name(self@facility_abbr))
    )
  )

#' @noRd
IPPSExcludedUnit <- S7::new_class(
  name             = "IPPSExcludedUnit",
  parent           = Provider,
  properties       = list(
    type_code      = S7::class_character,
    type_abbr      = S7::new_property(S7::class_character, getter = \(self) get_ipps_abbr(self@type_code)),
    type_name      = S7::new_property(S7::class_character, getter = \(self) get_ipps_name(self@type_abbr)),
    parent_code    = S7::class_character,
    parent_abbr    = S7::new_property(S7::class_character, getter = \(self) get_parent_abbr(self@parent_code)),
    parent_range   = S7::new_property(S7::class_character, getter = \(self) get_care_range(self@sequence)),
    parent_name    = S7::new_property(S7::class_character, getter = \(self) get_care_range_name(self@parent_abbr))
    )
  )

#' @rdname parent
#' @export
get_parent_prefix <- function(x) {
  unlist_(EXCLUDED$PARENT)[seq_along(EXCLUDED$PARENT) %% 2L == 0L][
    collapse::fmatch(substr_(x, 4L), rlang::names2(EXCLUDED$PARENT))]
}

#' @rdname parent
#' @export
get_parent_abbr <- function(x) {
  unlist_(EXCLUDED$PARENT)[seq_along(EXCLUDED$PARENT) %% 2L == 1L][
    collapse::fmatch(substr_(x, 4L), rlang::names2(EXCLUDED$PARENT))]
}

#' @rdname parent
#' @export
get_unit_sequence <- function(x) {
  if (length(x) == 1L) {
    return(to_string(c(
      get_parent_prefix(substr_(x, 4L)), substr_(x, c(5L, 6L))
    )))
  }
  purrr::map_chr(x, \(x) to_string(c(
    get_parent_prefix(substr_(x, 4L)), substr_(x, c(5L, 6L))
  )))
}

#' @rdname parent
#' @export
get_parent_ccn <- function(x) {
  if (length(x) == 1L) {
    return(to_string(c(substr_(x, c(
      1L, 2L
    )), get_unit_sequence(x))))
  }
  purrr::map_chr(x, \(x) to_string(c(substr_(x, c(
    1L, 2L
  )), get_unit_sequence(x))))
}

#' @noRd
as_data_frame_impl <- function(x,
                               category = c(
                                 "Medicare Provider",
                                 "Medicaid-Only Provider",
                                 "IPPS Excluded Provider",
                                 "Emergency Hospital",
                                 "Medicare Supplier",
                                 "IPPS Excluded Unit"
                               ),
                               sequence  = S7::prop(x, "sequence"),
                               state     = S7::prop(x, "state"),
                               extension = S7::prop(x, "extension") %||% NA_character_,
                               type      = if (S7::prop_exists(x, "type"))
                                 S7::prop(x, "type")
                               else
                                 NA_character_,
                               parent    = if (S7::prop_exists(x, "parent"))
                                 S7::prop(x, "parent")
                               else
                                 NA_character_) {
  cheapr::fast_df(
    category    = match.arg(category),
    number      = S7::prop(x, "number"),
    seq_number  = S7::prop(sequence, "number"),
    seq_range   = S7::prop(sequence, "range"),
    seq_abbr    = if (S7::prop_exists(sequence, "abbr"))
      S7::prop(sequence, "abbr")
    else
      NA_character_,
    seq_desc    = if (S7::prop_exists(sequence, "desc"))
      S7::prop(sequence, "desc")
    else
      NA_character_,
    state_code  = S7::prop(state, "code"),
    state_abbr  = S7::prop(state, "abbr"),
    state_name  = S7::prop(state, "name"),
    extension   = extension,
    type_code   = if (!is.na(type))
      S7::prop(type, "code")
    else
      type,
    type_abbr   = if (!is.na(type))
      S7::prop(type, "abbr")
    else
      type,
    type_desc   = if (!is.na(type))
      S7::prop(type, "desc")
    else
      type,
    parent_code = if (!is.na(parent))
      S7::prop(parent, "code")
    else
      parent,
    parent_number = if (!is.na(parent))
      S7::prop(parent, "number")
    else
      parent
  )
}
