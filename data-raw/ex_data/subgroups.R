## code to prepare `subgroups` dataset goes here

# x <- list(
#   location = provider::hospital(loc_type = "swing"),
#   subgroup = provider::hospital(subgroup = provider::subgroups(swing = TRUE))
# )
# pin_update(
#   x,
#   name = "subgroups",
#   title = "Subgroups (Swing Beds)",
#   description = "provider::hospital - Subgroups (Swing Beds)"
# )
#
# NEED TO ALLOW NA IN BOTH CCN AND CCNR!!!!

library(provider)
library(ccn)
library(vctrs)
library(collapse)

x <- ccn:::get_pin("subgroups")
x

xc <- vctrs::vec_unique(x$subgroup$ccn)
x <- as_ccn(xc)

xr <- as_ccnr(xc)
xr <- decode_ccnr(xr)
xr <- collapse::rsplit(xr, xr$form)

xr$care$parent <- NULL
xr$unit$parent[grep("!", xr$unit$parent, fixed = TRUE)] <- NA_character_
xr$unit$parent <- as_ccn(xr$unit$parent)
parents <- as_ccnr(xr$unit$parent)
parents <- decode_ccnr(parents)
collapse::rsplit(parents, parents$form)

collapse::qtab(xr$unit[.c(state, facility)], sort = TRUE, drop = TRUE)
vctrs::vec_size(xr$unit$parent)
i <- nchar(xr$unit$parent) != 5 & !is.na(xr$unit$parent)
index_ccn_types(as_ccn(xr$unit$parent[i]))
