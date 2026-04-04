examples <- cheapr::na_insert(ccn:::get_pin("ccn"), prop = 0.25)
as_ccn(ex) |> head(20)

ex <- ccn:::get_pin("ccn")

# x <- ccn(x)
# x <- vec_c(ccn(x[1:50]), ccn(x[600:1000]))

x <- ccn(ex[1:50])
y <- ccn(ex[600:1000])

x
attributes(x)
form(x)
vec_data(x)

y[1:2]
attributes(y[1:2])
form(y)

c(y, x) |> attributes()
c(x, y) |> attributes()

vec_ptype(ccn())
vec_ptype_show(ccn(), character(), ccn())
vec_cast("02S008", ccn()) |> form()
vec_cast(ccn("02S008"), character()) |> form()


indexthis::to_index(infer_form(ex))
attributes(xc)
attr(xc, "type") |> table()

examples <- vctrs::vec_assign(
  examples,
  vctrs::vec_match(form, "provider_ext"),
  substring(examples[prext], 1L, 6L),
  slice_value = TRUE)

examples <- vctrs::vec_assign(
  examples,
  vctrs::vec_in(infer_ccn_type(examples), "provider"),
  infer_provider_type(examples),
  slice_value = TRUE)


infer_ccn_type(examples)
examples[is.na(examples)]
