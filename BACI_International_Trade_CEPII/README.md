## **BACI International Trade CEPII**

**Table of Contents:**

- **Project Overview**
- **Tools**
- **Data Collection**
- **…**

---

## **Project Overview :**

Give couple lines about project purpose :

- Define problematic : “The goal of this project is to investigate…
- Give historical information about :
    - Dataset used ( how the dataset has been collected…)
    - Company studied
    - Projects purpose

BACI (Base pour l'Analyse du Commerce International) is a bilateral trade flow dataset published by Guillaume Gaulier and Soledad from the CEPII, based on data collected from the United Nations COMTRADE. Several reasons explain the computation of BACI by Gaulier and Soledad:

Incomplete Data: COMTRADE presents some missing values/flows in the country reports sent to the United Nations, leading to incomplete data.
Classification Issues: Some countries use the SITC classification, an older system instead of the current Harmonized System, can lead to lack of readibility.
Data Discrepancies: There are differences in the data provided by importers and exporters for the same trade flow. One solution to this issue was to remove the trade cost value (CIF) from import values.

The main objective of this project was to explore the most principals queries use in SQL that I've learned and, at the end, extract insights from international trade products between countries using BACI.

---

## **Data Sources :**

BACI_HS17_Y2021_V202301 : csv file used contained detailed informations about bilateral trade exchange by providing :

t: Year
k : Product category (HS 6-digit code)
i : Exporter (ISO 3-digit country code)
j : Importer (ISO 3-digit country code)
v : Value of trade flow (in thousands of USD)
q : Quantity (in metric tons)
Country codes :

Associates the ISO 3-digit country codes to country names
Product codes :

Associates the HS 6-digit product codes to product names : give more detailed information about products

---

## **Tools :**

Give tools used for each process

Ex :

- Python (BeautifulSoup/Selenium) for Data Collection
- Excel for Data Cleaning
- SQL for Data Analysis
- Tableau for Building Dashboard

Here :

- MySQLWorkbench : Data Analysis (add directlink toward sql file)

- Microsoft Excel : Dashboard Creation (add directlink toward xlsx file - add pdf to present dashboard)

---

## **Data Collection / Data Cleaning / Data Preparation :**

Ex : “In the initial data preparation (or cleaning/ collection) phase, we performed the following tasks:

1. Data loading and inspection
2. Handling Missing Values
3. Data Cleaning and Formatting
4. …

---

## **Data Analysis :**

Include some interesting code/features worked with :

Implemented some :

- Python / SQL code
- Excel Functions screenshots
- (DAX) Power BI / Tableau Calculated Field screenshots

About :

- Main Query Results
- Key Metrics Calculation and Results
- Key Trends

---

## **Results / Findings :**

Presenting main results collected during the project throughout simple sentences :

“*Based on the analysis, we recommend the following actions:*”

- *“Product of Category C is the best-performing category in terms of sales and revenue”*
- *“Invest on marketing campaigns of product A in country XXX will increase sales”*

---

## **Limitations:**

Give more details about issues encountered during project or elements that will improve your insights quality / problematic’s answer.

Ex : lack of data - presence of outliers

---

## **References**
