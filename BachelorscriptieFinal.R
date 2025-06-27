data <- read.csv("~/uu/Bachelorsscriptie/endfile.csv")
# Assuming your data has a column named 'year'

# Load necessary library
library(ggplot2)

# data <- endfile

# Create  bar chart
ggplot(data, aes(x = Year)) +
  geom_bar() +
  labs(title = "Number of Datapoints per Year",
       x = "Year",
       y = "Number of Datapoints") +
  theme_minimal()

# Load necessary library
library(ggplot2)

# Filter the data for only Harbour porpoise entries
harbour_data <- subset(data, Common_name == "Harbour porpoise")

# Create the bar chart
ggplot(harbour_data, aes(x = Year)) +
  geom_bar() +
  labs(title = "Number of Harbour Porpoise Datapoints per Year",
       x = "Year",
       y = "Number of Datapoints") +
  theme_minimal()

data <- read.csv("~/uu/Bachelorsscriptie/Scotlanddata_v3.csv")
# Create the bar chart
ggplot(data, aes(x = Year)) +
  geom_bar() +
  labs(title = "Number of Datapoints per Year",
       x = "Year",
       y = "Number of Datapoints") +
  theme_minimal()

data <- read.csv("~/uu/Bachelorsscriptie/Moderndatabasewithyear.csv")
# Create the bar chart
ggplot(data, aes(x = Year)) +
  geom_bar() +
  labs(title = "Number of Harbour Porpoise Datapoints per Year",
       x = "Year",
       y = "Number of Datapoints") +
  theme_minimal()

# Sample data frame
df <- data.frame(
  original_dates = c("28/04/2025", "15/08/2023", "01/01/2020"),
  stringsAsFactors = FALSE
)

# Convert string to Date object
df$original_dates <- as.Date(df$original_dates, format = "%d/%m/%Y")

# Extract year only
df$year_only <- format(df$original_dates, "%Y")

# View result
print(df)

# Load the CSV
df <- read.csv("~/uu/Bachelorsscriptie/OnlyPhocoenafromShirin210225.csv", stringsAsFactors = FALSE)

# Convert 'datefound' to Date format
df$datefound <- as.Date(df$datefound, format = "%d/%m/%Y")

# Extract the year
df$Year <- format(df$datefound, "%Y")

# Optionally remove the original column
# df$datefound <- NULL

# Save the modified data to a new CSV
write.csv(df, "yourfile_with_year.csv", row.names = FALSE)

#Bar chart modern database years
data <- read.csv("~/uu/Bachelorsscriptie/Moderndatabasewithyear.csv")
ggplot(data, aes(x = Year)) +
  geom_bar(fill = "orange") +
  labs(title = "Number of Harbour Porpoise Strandings per Year",
       x = "Year",
       y = "Number of Datapoints") +
  theme_minimal()

# Bar chart NMI phocoena years
data <- read.csv("~/uu/Bachelorsscriptie/NMIdataonlyphocoena.csv")
ggplot(data, aes(x = Year)) +
  geom_bar(fill = "dodgerblue2") +
  labs(title = "Number of Harbour Porpoise Strandings per Year",
       x = "Year",
       y = "Number of Datapoints") +
  theme_minimal()

# Bar chart NMS phocoena years
data <- read.csv("~/uu/Bachelorsscriptie/Scotlanddata_v3.csv")
ggplot(data, aes(x = Year)) +
  geom_bar(fill = "red2") +
  labs(title = "Number of Harbour Porpoise Strandings per Year",
       x = "Year",
       y = "Number of Datapoints") +
  theme_minimal()

# Read in the original file
df <- read.csv("~/uu/Bachelorsscriptie/endfile.csv")

# Filter for relevant common names
filtered_df <- subset(df, Common_name %in% c("Harbour porpoise", "Unidentified porpoise"))

# Save the filtered data to a new file
write.csv(filtered_df, "filtered_endfile.csv", row.names = FALSE)

library(ggplot2)
library(dplyr)

# Load each dataset and tag the source
modern <- read.csv("~/uu/Bachelorsscriptie/Moderndatabasewithyear.csv", stringsAsFactors = FALSE)
modern$Source <- "Modern"

nmi <- read.csv("~/uu/Bachelorsscriptie/NMIdataonlyphocoena.csv", stringsAsFactors = FALSE)
nmi$Source <- "NMI"

nms <- read.csv("~/uu/Bachelorsscriptie/Scotlanddata_v3.csv", stringsAsFactors = FALSE)
nms$Source <- "NMS"

# Combine the datasets
combined_data <- bind_rows(modern, nmi, nms)

# Create stacked bar chart of all three datasets
ggplot(combined_data, aes(x = Year, fill = Source)) +
  geom_bar(position = "stack") +
  labs(title = "Harbour Porpoise Strandings per Year by Source",
       x = "Year",
       y = "Number of Datapoints") +
  scale_fill_manual(values = c("Modern" = "orange", "NMI" = "dodgerblue2", "NMS" = "red2")) +
  theme_minimal()

## Creating new  datasets with all strandings before 2004 

# Ensure the Year column is numeric
modern$Year <- as.numeric(modern$Year)
nmi$Year <- as.numeric(nmi$Year)
nms$Year <- as.numeric(nms$Year)

# Filter each dataset
modern_pre2004 <- subset(modern, Year < 2004)
nmi_pre2004 <- subset(nmi, Year < 2004)
nms_pre2004 <- subset(nms, Year < 2004)

# Write each filtered dataset to a separate CSV
write.csv(modern_pre2004, "~/uu/Bachelorsscriptie/Modern_pre2004.csv", row.names = FALSE)
write.csv(nmi_pre2004, "~/uu/Bachelorsscriptie/NMI_pre2004.csv", row.names = FALSE)
write.csv(nms_pre2004, "~/uu/Bachelorsscriptie/NMS_pre2004.csv", row.names = FALSE)


## separating the datefound in modern database into year month and day column before 2004
# Load the data (adjust the path as needed)
data <- read.csv("~/uu/Bachelorsscriptie/Modern_pre2004.csv", stringsAsFactors = FALSE)

# Convert DateFound to Date format
data$DateFound <- as.Date(data$datefound)

# Extract year, month, and day
data$Year <- format(data$DateFound, "%Y")
data$Month <- format(data$DateFound, "%m")
data$Day <- format(data$DateFound, "%d")

# Optionally, write the updated data to a new CSV
write.csv(data, "moderndatabasebefore2004sepdaymonthyear.csv", row.names = FALSE)

## strandings per month of combined datasets NMS and modern before 2004

# data
# Load the data
data <- read.csv("~/uu/Bachelorsscriptie/Combineddatasetbefore2004.csv", stringsAsFactors = FALSE)

# Standardize Month column to two-digit format (e.g., "01", "02", ..., "12")
data$Month <- sprintf("%02d", as.numeric(data$Month))

# Convert to ordered factor with all 12 months
data$Month <- factor(data$Month, 
                     levels = sprintf("%02d", 1:12), 
                     labels = month.name, 
                     ordered = TRUE)

# Count datapoints per month
monthly_counts <- table(data$Month)

# View as data frame (optional)
monthly_df <- as.data.frame(monthly_counts)
colnames(monthly_df) <- c("Month", "Count")
print(monthly_df)

# Plot
barplot(monthly_counts, 
        main = "Strandings per Month before 2004", 
        xlab = "Month", 
        ylab = "Stranding count", 
        las = 2)

# Create bar plot with angled x-axis labels
ggplot(monthly_df, aes(x = Month, y = Count)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(title = "Strandings per Month", subtitle = "1945-2003", x = "Month", y = "Stranding count") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


## Creating new dataset with all strandings after 2004 

# Ensure the Year column is numeric
modern$Year <- as.numeric(modern$Year)

# Filter the dataset
modern_post2004 <- subset(modern, Year > 2003)

# Write each filtered dataset to a separate CSV
write.csv(modern_post2004, "~/uu/Bachelorsscriptie/Modern_post2004.csv", row.names = FALSE)



## separating the datefound post2004 in modern database into year month and day column before 2004
# Load the data (adjust the path as needed)
data <- read.csv("~/uu/Bachelorsscriptie/Modern_post2004.csv", stringsAsFactors = FALSE)

# Convert DateFound to Date format
data$DateFound <- as.Date(data$datefound)

# Extract year, month, and day
data$Year <- format(data$DateFound, "%Y")
data$Month <- format(data$DateFound, "%m")
data$Day <- format(data$DateFound, "%d")

# Optionally, write the updated data to a new CSV
write.csv(data, "moderndatabaseafter2004sepdaymonthyear.csv", row.names = FALSE)


## strandings per month of dataset modern after 2004

# Load the data
data <- read.csv("~/uu/Bachelorsscriptie/moderndatabaseafter2004sepdaymonthyear.csv", stringsAsFactors = FALSE)

# Standardize Month column to two-digit format (e.g., "01", "02", ..., "12")
data$Month <- sprintf("%02d", as.numeric(data$Month))

# Convert to ordered factor with all 12 months
data$Month <- factor(data$Month, 
                     levels = sprintf("%02d", 1:12), 
                     labels = month.name, 
                     ordered = TRUE)

# Count datapoints per month
monthly_counts <- table(data$Month)

# View as data frame (optional)
monthly_df <- as.data.frame(monthly_counts)
colnames(monthly_df) <- c("Month", "Count")
print(monthly_df)

# Plot
barplot(monthly_counts, 
        main = "Strandings per Month before 2004", 
        xlab = "Month", 
        ylab = "Stranding count", 
        las = 2)

# Create bar plot with angled x-axis labels
ggplot(monthly_df, aes(x = Month, y = Count)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(title = "Strandings per Month", subtitle = "2004-2024", x = "Month", y = "Stranding count") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

## trying to plot windfarms and strandings

# Load required libraries
library(dplyr)
library(ggplot2)
library(tidyr)

# Load the raw data
strandings <- read.csv("~/uu/Bachelorsscriptie/Moderndatabasewithyear.csv")
wind_turbines <- read.csv("~/uu/Bachelorsscriptie/Windmills_withoutdenmark.csv")

# Filter raw data to only include years up to 2025
strandings <- strandings %>% filter(Year <= 2025)
wind_turbines <- wind_turbines %>% filter(Year <= 2025)

# Count strandings per year
strandings_per_year <- strandings %>%
  count(Year) %>%
  rename(occurrences = n) %>%
  mutate(type = "Strandings per year")

# Count wind turbines per year and make it cumulative
wind_turbines_per_year <- wind_turbines %>%
  count(Year) %>%
  arrange(Year) %>%
  mutate(occurrences = cumsum(n)) %>%
  select(Year, occurrences) %>%
  mutate(type = "Total n of wind farms")

# Combine both datasets
combined_data <- bind_rows(strandings_per_year, wind_turbines_per_year)

# Plot with trend line for strandings only
ggplot(combined_data, aes(x = Year, y = occurrences, color = type)) +
  geom_line(size = 1) +
  geom_point() +
  geom_smooth(
    data = combined_data %>% filter(type == "Strandings per year"),
    method = "loess",  
    se = FALSE,
    color = "darkgray",
    linetype = "dashed"
  ) +
  labs(title = "Strandings vs. Total Number of Wind Farms per Year",
       x = "Year",
       y = "Number of Occurrences",
       color = "Legend") +
theme_minimal()


## plot of english windfarms and strandings

# Load required libraries
library(dplyr)
library(ggplot2)
library(tidyr)

# Load the raw data
strandings <- read.csv("~/uu/Bachelorsscriptie/Moderndatabasewithyear.csv")
wind_turbines <- read.csv("~/uu/Bachelorsscriptie/Windmills_onlyengland.csv")

# Filter raw data to only include years up to 2025
strandings <- strandings %>% filter(Year <= 2025)
wind_turbines <- wind_turbines %>% filter(Year <= 2025)

# Count strandings per year
strandings_per_year <- strandings %>%
  count(Year) %>%
  rename(occurrences = n) %>%
  mutate(type = "Strandings per year")

# Count wind turbines per year and make it cumulative
wind_turbines_per_year <- wind_turbines %>%
  count(Year) %>%
  arrange(Year) %>%
  mutate(occurrences = cumsum(n)) %>%
  select(Year, occurrences) %>%
  mutate(type = "Total n of wind farms")

# Combine both datasets
combined_data <- bind_rows(strandings_per_year, wind_turbines_per_year)

# Plot with trend line for strandings only
ggplot(combined_data, aes(x = Year, y = occurrences, color = type)) +
  geom_line(size = 1) +
  geom_point() +
  geom_smooth(
    data = combined_data %>% filter(type == "Strandings per year"),
    method = "loess",  
    se = FALSE,
    color = "darkgray",
    linetype = "dashed"
  ) +
  labs(title = "Strandings vs. Total Number of Wind Farms per Year",
       x = "Year",
       y = "Number of Occurrences",
       color = "Legend") +
  theme_minimal()

##graph of all species with year

library(tidyverse)

# Read your CSV
data <- read.csv("~/uu/Bachelorsscriptie/endfile.csv")

head(data)
str(data)

data$Year <- as.numeric(as.character(data$Year))
data$Common_name <- as.factor(data$Common_name)

ggplot(data, aes(x = Year, fill = Common_name)) +
  geom_bar() +
  labs(title = "Strandings per Year by Species",
       x = "Year",
       y = "Number of Strandings",
       fill = "Species") +
  theme_minimal()

## heatmap of all species

# Count number of strandings per year/species
count_data <- as.data.frame(table(data$Year, data$Common_name))
colnames(count_data) <- c("Year", "Common_name", "Count")

ggplot(count_data, aes(x = Year, y = Common_name, fill = Count)) +
  geom_tile() +
  scale_fill_viridis_c() +
  labs(title = "Strandings Heatmap",
       x = "Year",
       y = "Species",
       fill = "Count") +
  theme_minimal() +
  theme(
    text = element_text(size = 12),
    axis.text.x = element_text(angle = 45, hjust = 1)  # Rotate x-axis labels
  )


## Heatmap of all species excluding Harbour Porpoise

# Load necessary package
library(dplyr)

# Read the CSV file
data <- read.csv("~/uu/Bachelorsscriptie/endfile.csv")

# Remove rows where Common_name is 'Harbour porpoise'
filtered_data <- data %>%
  filter(Common_name != "Harbour porpoise")

# Optionally, save the filtered data back to a CSV
write.csv(filtered_data, "endfile_filtered.csv", row.names = FALSE)

# Read the CSV file
data <- read.csv("~/uu/Bachelorsscriptie/endfile_filtered.csv")

# Count number of strandings per year/species
count_data <- as.data.frame(table(data$Year, data$Common_name))
colnames(count_data) <- c("Year", "Common_name", "Count")

ggplot(count_data, aes(x = Year, y = Common_name, fill = Count)) +
  geom_tile() +
  scale_fill_viridis_c() +
  labs(title = "Odontocete strandings in NMI",
       x = "Year",
       y = "Species",
       fill = "Occurrence") +
  theme_minimal() +
  theme(
    text = element_text(size = 12),
    axis.text.x = element_text(angle = 60, hjust = 1)  # Rotate x-axis labels
  )

## histogram of all species
# Load necessary libraries
library(dplyr)
library(ggplot2)
library(readr)

# Read the CSV file
data <- read.csv("~/uu/Bachelorsscriptie/endfile_filtered.csv")

# Make sure Year is numeric
data$Year <- as.numeric(data$Year)

# Group data: count the number of records per year
yearly_counts <- data %>%
  group_by(Year) %>%
  summarise(Sightings = n()) %>%
  arrange(Year)

# Determine maximum y value for scaling
max_y <- max(yearly_counts$Sightings, na.rm = TRUE)

# Create background stripes data (every other y-level)
stripes <- data.frame(
  ymin = seq(0, max_y, by = 2),
  ymax = seq(1, max_y + 1, by = 2)
)

# Plot with background stripes
ggplot() +
  # Background stripes
  geom_rect(data = stripes,
            aes(xmin = -Inf, xmax = Inf, ymin = ymin, ymax = ymax),
            fill = "grey90") +
  # Actual bars
  geom_col(data = yearly_counts, aes(x = Year, y = Sightings), fill = "darkblue") +
  scale_x_continuous(breaks = seq(min(yearly_counts$Year, na.rm = TRUE), 
                                  max(yearly_counts$Year, na.rm = TRUE), 
                                  by = 5)) +
  scale_y_continuous(breaks = seq(0, max_y, by = 1)) +
  labs(title = "Odontocete Strandings in NMI",
       x = "Year",
       y = "Number of Strandings") +
  theme_minimal() +
  theme(
    text = element_text(size = 12),
    axis.text.x = element_text(angle = 60, hjust = 1)  # Rotate x-axis labels
  )



## histogram for females before 2004

library(dplyr)
library(ggplot2)

female_counts <- data %>%
  filter(tolower(sex) %in% c("f", "female")) %>%
  mutate(Month = factor(
    month.name[as.numeric(Month)],
    levels = month.name
  )) %>%
  group_by(Month) %>%
  summarise(Count = n())

ggplot(female_counts, aes(x = Month, y = Count)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(
    title = "Female strandings per Month",
    subtitle = "1945-2003",
    x = "Month",
    y = "Count"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))



## histogram for females after 2004
data <- read.csv("~/uu/Bachelorsscriptie/moderndatabaseafter2004sepdaymonthyear.csv")

library(dplyr)
library(ggplot2)

female_counts <- data %>%
  filter(tolower(sex) %in% c("f", "female")) %>%
  mutate(Month = factor(
    month.name[as.numeric(Month)],
    levels = month.name
  )) %>%
  group_by(Month) %>%
  summarise(Count = n())

ggplot(female_counts, aes(x = Month, y = Count)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(
    title = "Female strandings per Month",
    subtitle = "2004-2024",
    x = "Month",
    y = "Count"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))




