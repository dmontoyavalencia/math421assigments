# Run from the dashboard_q10 folder only if you want to refresh the data.
# The dashboard already includes a prepared CSV.
library(tidyverse)

# The public source contains all model years and fuel technologies.
raw <- read_csv("https://www.fueleconomy.gov/feg/epadata/vehicles.csv", show_col_types = FALSE)
vehicles <- raw %>%
  filter(between(year, 2015, 2025),
         fuelType %in% c("Regular", "Premium", "Midgrade", "Diesel"),
         is.na(fuelType2), is.na(atvType) | atvType != "Plug-in Hybrid") %>%
  transmute(id, year, make, model, epa_class = VClass,
            fuel = if_else(fuelType == "Diesel", "Diesel", "Gasoline"),
            fuel_grade = fuelType,
            technology = if_else(atvType == "Hybrid" & !is.na(atvType),
                                 "Hybrid", "Conventional"),
            engine_l = displ, cylinders, transmission = trany, drive,
            city_mpg = city08, highway_mpg = highway08, combined_mpg = comb08,
            vehicle_group = case_when(
              str_detect(VClass, "Sport Utility") ~ "SUVs",
              str_detect(VClass, "Pickup") ~ "Pickups",
              str_detect(VClass, "[Vv]an") ~ "Vans",
              str_detect(VClass, "Cars|Seaters|Wagons") ~ "Cars",
              TRUE ~ "Other")) %>%
  filter(!is.na(engine_l), engine_l > 0, city_mpg > 0,
         highway_mpg > 0, combined_mpg > 0) %>%
  arrange(year, make, model, id)
write_csv(vehicles, "fuel_economy.csv")
print(vehicles %>% summarise(records = n(), mean_mpg = mean(combined_mpg),
                           median_mpg = median(combined_mpg),
                           mean_highway_city_gap = mean(highway_mpg - city_mpg)))
print(vehicles %>% group_by(vehicle_group) %>%
        summarise(records = n(), median_mpg = median(combined_mpg)))
print(vehicles %>% group_by(year) %>% summarise(records = n(), mean_mpg = mean(combined_mpg)))

