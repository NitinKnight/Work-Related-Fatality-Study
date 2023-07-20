-- Create Table 'fatalities_cleaned'
CREATE TABLE fatalities_cleaned (
    id INT PRIMARY KEY,
    incident_date DATE,
    day_of_week VARCHAR(255),
    city VARCHAR(255),
    state VARCHAR(255),
    description TEXT,
    plan TEXT,
    citation TEXT
);
