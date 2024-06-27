setwd("#add your working directory")


Vsn_normalized <- read.csv("your working directory/Vsn_normalized.csv", sep="")
df <- Vsn_normalized
# Extracting the first protein name before the semicolon
df$Majority.protein.IDs <- sub(";.*", "", df$Majority.protein.IDs)
df$average_intensity <- NA #Adding a new column for the average intensity
# Creating a new dataframe with the modified column and the rest of the columns
new_df <- df[, c("Majority.protein.IDs", "Intensity.._A_01", "Intensity.._A_02", "Intensity.._A_03" ,
                 "Intensity.._B_01","Intensity.._B_02", "Intensity.._B_03", "Intensity.._C_01", "Intensity.._C_02", "Intensity.._C_03" , "Intensity.._D_01", "Intensity.._D_02","Intensity.._D_03", "Intensity.._E_01", "Intensity.._E_02", 
                 "Intensity.._E_03" ,  "Intensity.._F_01" ,"Intensity.._F_02" , "Intensity.._F_03" , "Intensity.._G_01" ,
                 "Intensity.._G_03","Intensity.._H_01"  , "Intensity.._H_02" , "Intensity.._H_03" 
                 , "average_intensity")] #change columns according to your dataframe
# Identify all columns except the first one
cols_to_convert <- names(new_df)[-1]

# Convert selected columns to numeric
new_df[, cols_to_convert] <- lapply(new_df[, cols_to_convert], function(x) as.numeric(as.character(x)))

# Check the structure of the dataframe
str(new_df)



intensity_cols <- c( "Intensity.._A_01", "Intensity.._A_02", "Intensity.._A_03" ,
                     "Intensity.._B_01","Intensity.._B_02", "Intensity.._B_03", "Intensity.._C_01", "Intensity.._C_02", "Intensity.._C_03" , "Intensity.._D_01", "Intensity.._D_02","Intensity.._D_03", "Intensity.._E_01", "Intensity.._E_02", 
                     "Intensity.._E_03" ,  "Intensity.._F_01" ,"Intensity.._F_02" , "Intensity.._F_03" , "Intensity.._G_01" ,
                     "Intensity.._G_03","Intensity.._H_01"  , "Intensity.._H_02" , "Intensity.._H_03" )


# Calculate row-wise means of the intensity columns
new_df$average_intensity <- rowMeans(new_df[, intensity_cols], na.rm = TRUE)


# Remove rows where average_intensity is NA
new_df2 <- new_df[complete.cases(new_df$average_intensity), ]

# Check the structure of the dataframe
str(new_df2)


# Check the new column
head(new_df2$average_intensity)
# Selecting the columns to export
export_data <- new_df2[, c("Majority.protein.IDs", "average_intensity")]

# Define the file path for the text file
output_file <- "protein_intensity_average hepatocytes.txt" #change according to your data


# Export the data to a text file
write.table(export_data, file = output_file, sep = "\t", quote = FALSE, row.names = FALSE)

# Print a message to confirm the export
cat("Data has been exported to:", output_file, "\n")
