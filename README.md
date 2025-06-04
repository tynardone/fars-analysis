# FARS Data Analysis

This project automates the download, standardization, and analysis of the NHTSA Fatality Analysis Reporting System (FARS) dataset.

## Overview

Fatality Analysis Reporting System (FARS)
Years: 1975 – 2023

To be included in FARS, a crash must:

- Involve a motor vehicle traveling on a trafficway customarily open to the public

- Result in the death of an occupant or non-occupant within 30 days (720 hours) of the crash

FARS contains no personally identifying information (e.g., names, addresses, SSNs), and the data made publicly available conforms fully to the Privacy Act.

### Project Description

TODO

## CSV Files

### Accident and Event Files

| File                        | Description                                                      |
| --------------------------- | ---------------------------------------------------------------- |
| **Accident** (1975–present) | Crash-level details: location, time, weather, roadway conditions |
| **Cevent** (2010–present)   | Chronological crash event sequence                               |
| **Vevent** (2010–present)   | Vehicle-level event sequences                                    |
| **Vsoe** (2010–present)     | Simplified version of Vevent                                     |
| **Weather** (2020–present)  | Atmospheric conditions at the time of crash                      |
| **Crashrf** (2020–present)  | Crash-related contributing factors                               |

### Vehicles and parked or working vehicles

| File                          | Description                            |
| ----------------------------- | -------------------------------------- |
| **Vehicle** (1975–present)    | Vehicle and driver information         |
| **Vehiclesf** (2020–present)  | Special conditions related to vehicles |
| **Driverrf** (2020–present)   | Special conditions related to drivers  |
| **Damage** (2012–present)     | Specific vehicle damage areas          |
| **Distract** (2010–present)   | Driver distractions                    |
| **Drimpair** (2010–present)   | Physical impairments of drivers        |
| **Factor** (2010–present)     | Contributing vehicle factors           |
| **Maneuver** (2010–present)   | Driver avoidance maneuvers             |
| **Violations** (2010–present) | Traffic violations charged             |
| **Vision** (2010–present)     | Driver vision obstructions             |
| **Parkwork** (2010–present)   | Parked or work-related vehicle involvement     |
| **Pvehiclesf** (2020–present) | Special conditions for parked/working vehicles |

### Person

| File                          | Description                                    |
| ----------------------------- | ---------------------------------------------- |
| **Person** (1975–present)     | All persons involved: motorists, non-motorists |
| **Personrf** (2020–present)   | Special conditions related to people           |
| **Drugs** (2018–present)      | Toxicology results                             |
| **Race** (2019–present)       | Races of fatally injured individuals           |
| **Nmcrash** (2010–present)    | Non-motorist contributing actions              |
| **Nmdistract** (2019–present) | Non-motorist distractions                      |
| **Nmimpair** (2010–present)   | Non-motorist impairments                       |
| **Nmprior** (2010–present)    | Non-motorist prior actions at crash time       |

## References

- National Highway Traffic Safety Administration. *FARS/CRSS Coding and Validation Manual* (2023). U.S. Department of Transportation. <https://crashstats.nhtsa.dot.gov/Api/Public/ViewPublication/813695>
- National Highway Traffic Safety Administration. *Fatality Analysis Reporting System (FARS) Analytical User’s Manual, 1975–2023* (2023). U.S. Department of Transportation. <https://crashstats.nhtsa.dot.gov/Api/Public/ViewPublication/813706>
