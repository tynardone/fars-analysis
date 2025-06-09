
# **FARS Data Analysis**

This project automates the download, standardization, and analysis of the Fatality Analysis Reporting System (FARS) dataset, maintained by the National Highway Traffic Safety Administration (NHTSA).

---

## **Overview**

**Fatality Analysis Reporting System (FARS)**  
**Years Covered:** 1975–2023

FARS is a nationwide census of fatal motor vehicle crashes. For an incident to be included:

- The crash must involve a motor vehicle traveling on a trafficway customarily open to the public.
- The crash must result in the death of an occupant or non-occupant within 30 days (720 hours) of the incident.

The dataset excludes personally identifiable information (e.g., names, addresses, SSNs) and complies fully with the Privacy Act.

---

## **Project Description**

This project aims to:

- Automate the retrieval of FARS data files from public repositories.
- Standardize and document available data elements (see `metadata.yml` – work in progress).
- Provide structured access for analysis and integration into data pipelines.

---

## **CSV File Inventory**

### **Accident and Event-Level Files**

| File Name        | Years Available   | Description                                                      |
|------------------|-------------------|------------------------------------------------------------------|
| `Accident`       | 1975–present      | Crash-level data: location, time, weather, road conditions       |
| `Cevent`         | 2010–present      | Chronology of crash events                                       |
| `Vevent`         | 2010–present      | Vehicle-specific event sequences                                 |
| `Vsoe`           | 2010–present      | Simplified vehicle-level events                                  |
| `Weather`        | 2020–present      | Atmospheric conditions during the crash                          |
| `Crashrf`        | 2020–present      | Contributing crash factors                                       |

---

### **Vehicle and Driver-Related Files**

| File Name         | Years Available   | Description                                      |
|-------------------|-------------------|--------------------------------------------------|
| `Vehicle`         | 1975–present      | Vehicle and driver-level data                    |
| `Vehiclesf`       | 2020–present      | Special vehicle-related conditions               |
| `Driverrf`        | 2020–present      | Special driver-related conditions                |
| `Damage`          | 2012–present      | Vehicle damage zones                             |
| `Distract`        | 2010–present      | Driver distractions                              |
| `Drimpair`        | 2010–present      | Driver impairments                               |
| `Factor`          | 2010–present      | Vehicle-related contributing factors             |
| `Maneuver`        | 2010–present      | Evasive actions taken by the driver              |
| `Violations`      | 2010–present      | Traffic violations charged                       |
| `Vision`          | 2010–present      | Driver visibility obstructions                   |
| `Parkwork`        | 2010–present      | Parked or work-involved vehicles                 |
| `Pvehiclesf`      | 2020–present      | Special conditions: parked/working vehicles      |

---

### **Person-Level Files**

| File Name         | Years Available   | Description                                                  |
|-------------------|-------------------|--------------------------------------------------------------|
| `Person`          | 1975–present      | Information on all persons involved (drivers, pedestrians)  |
| `Personrf`        | 2020–present      | Special conditions related to persons                       |
| `Drugs`           | 2018–present      | Toxicology results                                           |
| `Race`            | 2019–present      | Race of fatally injured individuals                         |
| `Nmcrash`         | 2010–present      | Non-motorist contributing actions                            |
| `Nmdistract`      | 2019–present      | Non-motorist distractions                                    |
| `Nmimpair`        | 2010–present      | Non-motorist impairments                                     |
| `Nmprior`         | 2010–present      | Prior actions of non-motorists at time of crash             |

---

## **References**

- National Highway Traffic Safety Administration. *FARS/CRSS Coding and Validation Manual (2023)*. U.S. Department of Transportation.  
  [https://crashstats.nhtsa.dot.gov/Api/Public/ViewPublication/813695](https://crashstats.nhtsa.dot.gov/Api/Public/ViewPublication/813695)

- National Highway Traffic Safety Administration. *Fatality Analysis Reporting System (FARS) Analytical User’s Manual, 1975–2023 (2023)*. U.S. Department of Transportation.  
  [https://crashstats.nhtsa.dot.gov/Api/Public/ViewPublication/813706](https://crashstats.nhtsa.dot.gov/Api/Public/ViewPublication/813706)
