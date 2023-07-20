## With the data fetched, you can utilize Python libraries such as Matplotlib and Seaborn to visualize and draw insights.

import matplotlib.pyplot as plt
import seaborn as sns

df = fetch_data_from_mysql()

# Trend of fatalities over years
plt.figure(figsize=(10, 6))
df.groupby(df['incident_date'].dt.year)['id'].count().plot()
plt.title('Trend of Fatalities Over Years')
plt.xlabel('Year')
plt.ylabel('Number of Fatalities')
plt.show()

# Fatalities by state
plt.figure(figsize=(15, 7))
df['state'].value_counts().plot(kind='bar')
plt.title('Fatalities by State')
plt.xlabel('State')
plt.ylabel('Number of Fatalities')
plt.show()
