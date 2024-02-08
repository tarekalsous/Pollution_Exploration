-- Link to the dataset: https://www.kaggle.com/datasets/hasibalmuzdadid/global-air-pollution-dataset

-- Select all data

SELECT * 
FROM Global_Pollution..Global_Pollution
WHERE Country IS NOT NULL
ORDER BY Country;

-- Getting the number of records

SELECT COUNT(*) AS Total_Records
FROM Global_Pollution..Global_Pollution;

-- Top 100 cities with the worst average air quality index value

SELECT TOP 100 Country, City, AVG("AQI Value") AS Avg_AQI
FROM Global_Pollution..Global_Pollution
WHERE City IS NOT NULL
GROUP BY Country, City
ORDER BY Avg_AQI DESC;

-- Top 20 countries with the worst average air quality index value

SELECT TOP 20 Country, AVG("AQI Value") AS Avg_AQI
FROM Global_Pollution..Global_Pollution
WHERE Country IS NOT NULL
GROUP BY Country
ORDER BY Avg_AQI DESC;

-- Distribution of AQI categories

SELECT "AQI Category", COUNT(*) AS category_count
FROM Global_Pollution..Global_Pollution
GROUP BY "AQI Category";

-- Distribution of AQI categories per country

SELECT Country, "AQI Category", COUNT(*) AS category_count
FROM Global_Pollution..Global_Pollution
WHERE Country IS NOT NULL
GROUP BY Country, "AQI Category"
ORDER BY Country, "AQI Category";

-- Distribution of AQI categories in Canada

SELECT Country, "AQI Category", COUNT(*) AS category_count
FROM Global_Pollution..Global_Pollution
WHERE Country = 'Canada'
GROUP BY Country, "AQI Category"
ORDER BY Country, "AQI Category";

-- Countries with the most hazardous cities

SELECT Country, "AQI Category", COUNT(*) AS Category_Count
FROM Global_Pollution..Global_Pollution
WHERE Country IS NOT NULL AND "AQI Category" = 'Hazardous'
GROUP BY Country, "AQI Category"
ORDER BY Category_Count DESC

-- Countries with the most good cities

SELECT Country, "AQI Category", COUNT(*) AS Category_Count
FROM Global_Pollution..Global_Pollution
WHERE Country IS NOT NULL AND "AQI Category" = 'Good'
GROUP BY Country, "AQI Category"
ORDER BY Category_Count DESC

-- Average AQI values in Canada

SELECT Country, 
AVG("AQI Value") AS avg_aqi, 
AVG("CO AQI Value") AS avg_co_aqi, 
AVG("Ozone AQI Value") AS avg_ozone_aqi, 
AVG("NO2 AQI Value") AS avg_no2_aqi, 
AVG("PM2#5 AQI Value") AS avg_pm2#5_aqi
FROM Global_Pollution..Global_Pollution
WHERE Country = 'Canada'
GROUP BY Country;

-- Correlation between AQI value and CO AQI value using Pearson's product-moment coefficient formula

SELECT 
       Correlation=(COUNT(*) * SUM("AQI Value" * "CO AQI Value") - SUM("AQI Value") * SUM("CO AQI Value")) / 
                   (SQRT(COUNT(*) * SUM("AQI Value" * "AQI Value") - SUM("AQI Value") * SUM("AQI Value"))
                    * SQRT(COUNT(*) * SUM("CO AQI Value" * "CO AQI Value") - SUM("CO AQI Value") * SUM("CO AQI Value")))
FROM Global_Pollution..Global_Pollution;

-- Correlation between AQI value and Ozone AQI value using Pearson's product-moment coefficient formula

SELECT 
       Correlation=(COUNT(*) * SUM("AQI Value" * "Ozone AQI Value") - SUM("AQI Value") * SUM("Ozone AQI Value")) / 
                   (SQRT(COUNT(*) * SUM("AQI Value" * "AQI Value") - SUM("AQI Value") * SUM("AQI Value"))
                    * SQRT(COUNT(*) * SUM("Ozone AQI Value" * "Ozone AQI Value") - SUM("Ozone AQI Value") * SUM("Ozone AQI Value")))
FROM Global_Pollution..Global_Pollution;

-- Correlation between AQI value and NO2 AQI value using Pearson's product-moment coefficient formula

SELECT 
       Correlation=(COUNT(*) * SUM("AQI Value" * "NO2 AQI Value") - SUM("AQI Value") * SUM("NO2 AQI Value")) / 
                   (SQRT(COUNT(*) * SUM("AQI Value" * "AQI Value") - SUM("AQI Value") * SUM("AQI Value"))
                    * SQRT(COUNT(*) * SUM("NO2 AQI Value" * "NO2 AQI Value") - SUM("NO2 AQI Value") * SUM("NO2 AQI Value")))
FROM Global_Pollution..Global_Pollution;

-- Correlation between AQI value and PM2.5 AQI value using Pearson's product-moment coefficient formula

SELECT 
       Correlation=(COUNT(*) * SUM("AQI Value" * "PM2#5 AQI Value") - SUM("AQI Value") * SUM("PM2#5 AQI Value")) / 
                   (SQRT(COUNT(*) * SUM("AQI Value" * "AQI Value") - SUM("AQI Value") * SUM("AQI Value"))
                    * SQRT(COUNT(*) * SUM("PM2#5 AQI Value" * "PM2#5 AQI Value") - SUM("PM2#5 AQI Value") * SUM("PM2#5 AQI Value")))
FROM Global_Pollution..Global_Pollution;