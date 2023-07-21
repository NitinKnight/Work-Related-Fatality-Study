# Importing necessary libraries for data processing
import pandas as pd
import numpy as np

# Task 1: Function to read the provided dataset
def read_data_from_csv():
    # Read data from 'fatality.csv' into a dataframe
    df = pd.read_csv('fatality.csv') 
    return df

# Task 2: Function to clean the dataset by removing unnecessary columns
def data_cleaning():
    # Obtain the dataset by reading from CSV
    df = read_data_from_csv()
    
    # Identify columns starting with 'Unnamed' and store them in a list
    Unnamed_columns = [col for col in df.columns if col.startswith('Unnamed')]
    
    # Drop these 'Unnamed' columns from the dataframe
    df = df.drop(columns=Unnamed_columns)
    
    return df

# Task 3: Function to export the cleaned dataset to a new CSV file
def export_the_dataset():
    # Fetch the cleaned dataset
    df = data_cleaning()
    
    # Save the cleaned dataset to 'fatalities_cleaned.csv' with indexing turned off
    df.to_csv('fatalities_cleaned.csv', index=False)
    
    return df

# Task 4: This section pertains to loading the cleaned dataset into the provided database.
# Generate Tables Using Cleaned Dataset
##Check the instruction file in MySQL Table Creation Instruction


# Ensuring that the MySQL table has been created using "fatalities_cleaned"
# This final cleaned dataset will be uploaded onto the provided database for subsequent analysis in MySQL.
# To execute this task, navigate to the terminal and initiate the project run.
