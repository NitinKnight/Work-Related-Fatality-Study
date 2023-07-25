# Power BI Guide

## 1. Importing the Data:


- Open Power BI Desktop.
- Go to "Home" > "Get Data".
- Choose "CSV", then navigate to and select your CSV file.
- Once loaded, you'll see a preview. Click "Load" to import the data into Power BI.

## 2. Categorizing Incidents:

# Incident Categories

Incidents are categorized based on specific keywords found in their descriptions. Here's a breakdown:

- **Electrical**: Keywords include:
  - `electric`
  - `shock`
  - `circuit`
  
- **Falls**: Keywords include:
  - `fell`
  - `falling`
  - `slipped`
  
- **Machinery**: Keywords include:
  - `machine`
  - `equipment`
  - `mechanical`

- In the "Fields" pane, right-click on your table and choose "New Column".
- Use the DAX formula language to create a new column. Here's a simple example for categorizing incidents:

```dax
Incident Category = 
SWITCH(TRUE(),
    CONTAINSSTRING([Description], "electric") || CONTAINSSTRING([Description], "shock"), "Electrical",
    CONTAINSSTRING([Description], "fell") || CONTAINSSTRING([Description], "falling"), "Falls",
    CONTAINSSTRING([Description], "machine"), "Machinery",
    "Other"
)
```


## 3. Assigning Severity:


- Similarly, create another new column for severity:

```dax
Incident Severity = 
SWITCH([Incident Category],
    "Electrical", "Critical",
    "Falls", "Major",
    "Machinery", "Minor",
    "Other", "Unknown"
)
```


## 4. Publishing and Sharing:


- Once you've created your report, click "Publish" in the Home ribbon to upload it to the Power BI Service.
- In the Power BI Service, you can share the report with others, schedule data refreshes, and more.
