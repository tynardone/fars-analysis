-- Accident
CREATE TABLE accident (
    st_case INTEGER PRIMARY KEY NOT NULL,
    state INTEGER,
    statename TEXT,
    ve_total INTEGER,
    ve_forms INTEGER,
    pvh_invl INTEGER,
    peds INTEGER,
    pernotmvit INTEGER,
    permvit INTEGER,
    persons INTEGER,
    county INTEGER,
    countyname TEXT,
    city INTEGER,
    cityname TEXT,
    day INTEGER,
    dayname TEXT,
    month INTEGER,
    monthname TEXT,
    year INTEGER,
    day_week INTEGER,
    day_weekname TEXT,
    hour INTEGER,
    hourname TEXT,
    minute INTEGER,
    minutename TEXT,
    nhs INTEGER,
    nhsname TEXT,
    route INTEGER,
    routename TEXT,
    tway_id INTEGER,
    tway_id2 INTEGER,
    rur_urb INTEGER,
    rur_urbname TEXT,
    func_sys INTEGER,
    func_sysname TEXT,
    rd_owner INTEGER,
    rd_ownername TEXT,
    milept INTEGER,
    mileptname TEXT,
    latitude FLOAT,
    longitude FLOAT,
    sp_jur,
    sp_jurname,
    harm_ev,
    harm_evname,
    man_coll,
    man_collname,
    reljct1,
    reljct1name,
    reljct2,
    reljct2name,
    typ_int,
    typ_intname,
    wrk_zone,
    wrk_zonename,
    rel_road,
    rel_roadname,
    lgt_cond,
    lgt_condname,
    weather,
    weathername,
    sch_bus,
    sch_busname,
    rail,
    railname,
    not_hour,
    not_hourname,
    not_min,
    not_minname,
    arr_hour,
    arr_hourname,
    arr_min,
    arr_minname,
    hosp_hr,
    hosp_hrname,
    hosp_mn,
    hosp_mnname,
    fatals,
    drunk_dr
);

-- Vehicle
CREATE TABLE vehicle (
    st_case INTEGER
    state INTEGER
    veh_no INTEGER
    PRIMARY KEY(st_case veh_no)
    FOREIGN KEY(st_case veh_no) REFERENCES accident(st_case veh_no)
);

-- Person
CREATE TABLE person (
    st_case INTEGER
    state INTEGER
    veh_no INTEGER
    per_no INTEGER
    PRIMARY KEY(st_case veh_no per_no)
    FOREIGN KEY(st_case veh_no) REFERENCES accident(st_case veh_no)

);


-- Support Tables

CREATE TABLE state (
    state INTEGER PRIMARY KEY,
    statename TEXT
);

CREATE TABLE month (
    month INTEGER PRIMARY KEY,
    monthname TEXT
);

CREATE TABLE day_week (
    day_week INTEGER PRIMARY KEY,
    day_weekname TEXT
);

CREATE TABLE route (
    route INTEGER PRIMARY KEY,
    routename TEXT
);

CREATE TABLE rur_urb (
    rur_urb INTEGER PRIMARY KEY,
    rur_urbname TEXT
);


CREATE TABLE func_sys (
    func_sys INTEGER PRIMARY KEY,
    func_sysname TEXT
);

CREATE TABLE rd_owner (
    rd_owner INTEGER PRIMARY KEY,
    rd_ownername TEXT
);

CREATE TABLE harm_env (
    harm_env INTEGER PRIMARY KEY,
    harm_envname TEXT
);

CREATE TABLE man_coll (
    man_coll INTEGER PRIMARY KEY,
    man_collname TEXT
);

CREATE TABLE rel_road (
    rel_road INTEGER PRIMARY KEY,
    rel_roadname TEXT
);

CREATE TABLE lgt_cond (
    lgt_cond INTEGER PRIMARY KEY,
    lgt_condname TEXT
);

CREATE TABLE weather (
    weather INTEGER PRIMARY KEY,
    weathername TEXT
);

CREATE TABLE road_fnc (
 road_fnc INTEGER PRIMARY KEY,
 road_fnc TEXT
);


CREATE TABLE car_make (
    car_make INTEGER PRIMARY KEY,
    car_makename TEXT
);

CREATE TABLE car_body_type (
    car_body_type INTEGER,
    car_makename TEXT
);

