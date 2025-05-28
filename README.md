# fars-analysis

Analysis of NHSTA FARS dataset

## FARS

Fatality Analysis Reporting System (FARS)

1975 - 2023

To be included in FARS, a crash must involve
a motor vehicle traveling on a trafficway customarily open to the public and must result in the
death of an occupant of a vehicle or a non-occupant within 30 days (720 hours) of the crash.

The data collected within FARS do not
include any personal identifying information such as names, addresses, or social security
numbers. Thus, any data kept in FARS data files and made available to the public fully conform
to the Privacy Act.

### Coding and validation manuals

Provide detailed definitions for each data element and attribute for a given year.
FARS/NASS GES
FARS/CRSS

## CSV Files

### Accident and Event

• Accident – (1975-current): This data file contains information about crash characteristics
and environmental conditions at the time of the crash. There is one record per crash.

    • Cevent – (2010-current): This data file contains information for all of the qualifying
    events (i.e., both harmful and non-harmful) that occurred in the crash. It details the
    chronological sequence of events resulting from an unstabilized situation that constitutes
    a motor vehicle traffic crash. There is one record per event. Included in each record is a
    description of the event or object contacted (e.g., ran off road-right, crossed center line,
    guardrail, parked motor vehicle), the vehicles involved, and the vehicles’ areas of impact.

    • Vevent – (2010-current): This data file contains the sequence of events for each motor
    vehicle in-transport involved in the crash. This data file has the same data elements as the
    Cevent data file. In addition, this data file has a data element that records the sequential
    event number for each vehicle (VEVENTNUM). There is one record for each event for
    each motor vehicle in-transport.

    • Vsoe – (2010-current): This data file contains the sequence of events for each motor
    vehicle in-transport involved in the crash. This data file has a subset of the data elements
    contained in the Vevent data file (it is a simplified Vevent data file). There is one record
    for each event for each motor vehicle in-transport.

    • Weather – (2020-current): This data file contains information describing the atmospheric
    conditions at the time of the crash. There is one record per condition and at least one
    record for each crash.

    • Crashrf – (2020-current): This data file contains factors related to the crash based on a
    list of unusual conditions and special circumstances. Each factor is a separate record and
    there is at least one record for each crash.

### Vehicles and parked or working vehicles

• Vehicle – (1975-current): This data file contains information describing the motor
vehicles in-transport and the drivers of motor vehicles in-transport who are involved in
the crash. There is one record per motor vehicle in-transport. Parked and working vehicle
information is in the Parkwork data file.

    • Vehiclesf – (2020-current): This data file contains factors related to the motor vehicles
    in-transport involved in the crash based on a list of special circumstances. There is one
    record per factor and at least one record for each motor vehicle in-transport.

    • Driverrf – (2020-current): This data file contains factors related to the drivers of motor
    vehicles in-transport involved in the crash based on a list of driver conditions, unusual
    situations, and special circumstances. There is one record per factor and at least one
    record for each driver.

    • Damage – (2012-current): This data file contains information about all of the areas on
    this vehicle that were damaged in the crash. There is one record per damaged area.

    • Distract – (2010-current): This data file contains information about driver distractions.
    Each distraction is a separate record. There is at least one record for each driver of a
    motor vehicle in-transport.

    • Drimpair – (2010-current): This data file contains information about physical
    impairments of drivers of motor vehicles. There is one record per impairment, and there
    is at least one record for each driver of a motor vehicle in-transport.

    • Factor – (2010-current): This data file contains information about vehicle circumstances
    that may have contributed to the crash. Each factor is a separate record. There is at least
    one record per motor vehicle in-transport.

    • Maneuver – (2010-current): This data file contains information about actions taken by
    the driver to avoid something or someone in the road. Each maneuver is a separate
    record. There is at least one record per motor vehicle in-transport.

    • Violatn – (2010-current): This data file contains information about violations that were
    charged to drivers. Each violation is a separate record. There is at least one record per
    motor vehicle in-transport.

    • Vision – (2010-current): This data file contains information about circumstances that
    may have obscured the driver’s vision. Each obstruction is a separate record. There is at
    least one record per motor vehicle in-transport.

• Parkwork – (2010-current): This data file contains information about parked and
working vehicles that were involved in FARS crashes. A parked vehicle is a motor
vehicle that is stopped off the roadway. A working vehicle is a motor vehicle involved in
trafficway maintenance, construction, or utility activities. It excludes vehicles performing
private maintenance, construction, or utility activities. Data users are strongly advised to
consult the annual FARS/CRSS Coding and Validation Manuals for a detailed
description. There is one record per parked/working vehicle.

    • Pvehiclesf – (2020-current): This data file contains factors related to parked and working
    vehicles involved in FARS crashes based on a list of special circumstances. There is one
    record per factor and at least one record for each parked and working vehicle.

### Person

• Person – (1975-current): This data file contains information describing all people
involved in the crash including motorists (i.e., drivers and passengers of motor vehicles
in-transport) and non-motorists (e.g., pedestrians, pedalcyclists, and occupants of motor
vehicles not in-transport). It provides information such as age, sex, vehicle occupant
restraint use, and injury severity. There is one record per person.

    • Personrf – (2020-current): This data file contains factors related to each person,
    occupants, and non-occupants involved in the crash based on a list of unusual situations
    and special circumstances. There is one record per factor and at least one record for each
    person.

    • Drugs – (2018-current): This data file contains the specimens tested and the drug results
    from toxicology reports of all people involved in the crash. There is one record per
    specimen tested and its corresponding drug result.

    • Race – (2019-current): This data file contains the races of all fatal people as listed on the
    death certificate. Each race of the fatal person is a separate record and there is at least one
    record for each fatality.

    • Nmcrash – (2010-current): This data file contains information about any contributing
    circumstances or improper actions of people who are not occupants of motor vehicles
    (e.g., pedestrians and bicyclists) noted on the police report. There is one record per
    action, and there is at least one record for each person who is not an occupant of a motor
    vehicle.

    • Nmdistract – (2019-current): This data file contains information about non-motorist
    distractions. Each distraction is a separate record. There is at least one record for each
    person who is not an occupant of a motor vehicle.

    • Nmimpair – (2010-current): This data file contains information about physical
    impairments of people who are not occupants of motor vehicles. There is one record per
    impairment, and there is at least one record for each person who is not an occupant of a
    motor vehicle.

    • Nmprior – (2010-current): This data file contains information about the actions of people
    who are not occupants of motor vehicles (e.g., pedestrians and bicyclists) at the time of
    their involvement in the crash. There is one record per action, and there is at least one
    record for each person who is not an occupant of a motor vehicle.

## References

- National Highway Traffic Safety Administration. *FARS/CRSS Coding and Validation Manual* (2023). U.S. Department of Transportation. [Link](<https://crashstats.nhtsa.dot.gov/Api/Public/ViewPublication/813695>)
- National Highway Traffic Safety Administration. *Fatality Analysis Reporting System (FARS) Analytical User’s Manual, 1975–2023* (2023). U.S. Department of Transportation. [Link](https://crashstats.nhtsa.dot.gov/Api/Public/ViewPublication/813706)
- <https://github.com/fitnr/getfars/blob/master/sql/schema.sql>
