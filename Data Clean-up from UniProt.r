# Install and load required packages if not already installed
if (!requireNamespace("readxl", quietly = TRUE)) {
  install.packages("readxl")
}
if (!requireNamespace("writexl", quietly = TRUE)) {
  install.packages("writexl")
}
library(writexl)
library(readxl)
library(dplyr)

#Working Directory
#Find your working directory first
getwd()
setwd("#add your working directory") #Change working directory to yours

# Read Excel file
file_path <- "uniprotkb_pept_1_AND_reviewed_true_AND_2024_02_02.xlsx"  # Replace with your actual file path
data <- readxl::read_excel(file_path)


# Delete everything after the first space in rows of column 2
data$`Gene Names` <- sub("^(\\S+\\s).*", "\\1", data$`Gene Names`)

# Remove the first column
data <- data[-1]

# Print the modified data
print(data)

# If you want to save the modified data back to an Excel file
#write_xlsx(data, "output_file.xlsx", row.names = FALSE)

# Save the modified data as a text file (txt) without quotation marks
write.table(data, "PEPT-1.txt", sep = "\t", row.names = FALSE, quote = FALSE) #Change the file name according to your data

# If you want to save the modified data back to a CSV file
write.csv(data, "output_file.csv", row.names = FALSE) #Change the file name according to your data
