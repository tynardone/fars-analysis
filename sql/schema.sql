-- Accident
CREATE TABLE accident (
    st_case INTEGER PRIMARY KEY NOT NULL,
    state INTEGER,
    ve_total INTEGER,
    ve_forms INTEGER,
    pvh_invl INTEGER,
    peds INTEGER,
    pernotmvit INTEGER,
    permvit INTEGER,
    persons INTEGER,
    county INTEGER,
    city INTEGER,
    day INTEGER,
    month INTEGER,
    year INTEGER,
    day_week INTEGER,
    hour INTEGER,
    minute INTEGER,
    nhs INTEGER,
    route INTEGER,
    tway_id INTEGER,
    tway_id2 INTEGER,
    rur_urb INTEGER,
    func_sys INTEGER,
    rd_owner INTEGER,
    milept INTEGER,
    latitude FLOAT,
    longitude FLOAT,
    sp_jur INTEGER,
    harm_ev INTEGER,
    man_coll INTEGER,
    reljct1 INTEGER,
    reljct2 INTEGER,
    typ_int INTEGER,
    wrk_zone INTEGER,
    rel_road INTEGER,
    lgt_cond INTEGER,
    weather INTEGER,
    sch_bus INTEGER,
    rail INTEGER,
    not_hour INTEGER,
    not_min INTEGER,
    arr_hour INTEGER,
    arr_min INTEGER,
    hosp_hr INTEGER,
    hosp_mn INTEGER,
    fatals INTEGER,
    drunk_d INTEGER
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

