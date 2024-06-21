# Load necessary libraries
library(tidyverse)

# Install ggplot2 only if not already installed
if (!require(ggplot2)) {
  install.packages("ggplot2", dependencies = TRUE)
  library(ggplot2)
}

# Read the CSV file, make sure the file path is provided as a string
workfile <- read.csv("Scotlanddata_v3.csv")

# Check the structure of the data
head(workfile)
str(workfile)

# Ensure the necessary columns exist and are correctly formatted
if (!("Month" %in% names(workfile)) | !("Phase" %in% names(workfile))) {
  stop("The data frame must contain 'Month' and 'Phase' columns.")
}

# Handle any missing values
workfile <- workfile %>%
  filter(!is.na(Month) & !is.na(Phase))

# List of species to include in the histograms
selected_species <- c("Adult", "Subadult", "Juvenile")  # Replace with your species names

# Filter the dataset to include only the selected species
filtered_data <- workfile %>%
  filter(Phase %in% Phase)

# Create histograms for the selected species, faceted by Common_name
p <- ggplot(data = filtered_data, mapping = aes(x = Month)) +
  geom_histogram(binwidth = 1, fill = "blue", color = "black") + # Adjust binwidth as needed
  facet_wrap(~ Phase, ncol = 1, scales = "free_y") + # ncol = 1 for vertical stacking
  labs(title = "Occurrences per year of Phocoena phocoena",
       x = "Month",
       y = "Occurrence") +
  theme_minimal() +
  scale_x_continuous(breaks = seq(min(filtered_data$Month), max(filtered_data$Month), by = 1)) # Steps of 1


# Save the plot as a PDF file
ggsave(filename = "histogramScotlandmonthphase.pdf", plot = p, height = 24, width = 12, units = "cm")



## Histogram for sex


# Ensure the necessary columns exist and are correctly formatted
if (!("Month" %in% names(workfile)) | !("Sex" %in% names(workfile))) {
  stop("The data frame must contain 'Month' and 'Sex' columns.")
}

# Handle any missing values
workfile <- workfile %>%
  filter(!is.na(Month) & !is.na(Phase))

# List of species to include in the histograms
selected_species <- c("Adult", "Subadult", "Juvenile")  # Replace with your species names

# Filter the dataset to include only the selected species
filtered_data <- workfile %>%
  filter(Phase %in% Phase)

# Create histograms for the selected species, faceted by Common_name
p <- ggplot(data = filtered_data, mapping = aes(x = Month)) +
  geom_histogram(binwidth = 1, fill = "blue", color = "black") + # Adjust binwidth as needed
  facet_wrap(~ Phase, ncol = 1, scales = "free_y") + # ncol = 1 for vertical stacking
  labs(title = "Occurrences per year of Phocoena phocoena",
       x = "Month",
       y = "Occurrence") +
  theme_minimal() +
  scale_x_continuous(breaks = seq(min(filtered_data$Month), max(filtered_data$Month), by = 1)) # Steps of 1


# Save the plot as a PDF file
ggsave(filename = "histogramScotlandmonthphase.pdf", plot = p, height = 24, width = 12, units = "cm")

