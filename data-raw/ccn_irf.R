#-----Inpatient Rehabilitation Facility - Provider Data-----
irf <- readr::read_csv(
  file = fs::path("C:/Users/Andrew/Downloads/Inpatient_Rehabilitation_Facility-Provider_Data_Sep2025.csv"),
  num_threads = 4L
) |> readr::spec()

# pin_update(
#   hosp,
#   name = "hospital_enrollment",
#   title = "Hospital Enrollments",
#   description = "Hospital Enrollments 2025")
