#load the data
ebola_data <- read.csv("ebola_sierra_leone.csv")

#cases by district
cases_by_district <- janitor::tabyl(ebola_data, district)
cases_by_district  


#visualizing categorical variables
district_plot <- show_plot(inspect_cat(ebola_data))
district_plot

#visualizing numerical data
num_variable <- show_plot(inspect_num(ebola_data))
num_variable

#using here package to read file
ebola_data <- read.csv(here("ebola_sierra_leone.csv"))


#exporting data to output folder
write_csv(x = cases_by_district, file = here("outputs/numerical_graph.csv")

          
cases_by_district_arrage <- arrange(cases_by_district, -n)
cases_by_district_arrage

write_csv(x = cases_by_district_arrage, file = here("outputs/arrange_graph.csv"))


#visualise numerical variable

ggsave(plot = num_variable, filename = here("outputs/num_variable.png"))
          
       