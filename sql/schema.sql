

-- CRASH LEVEL - Central Table accident
-----------------------------------------
CREATE TABLE accident (
    state INTEGER,
    st_case INTEGER PRIMARY KEY NOT NULL,
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
    month_name TEXT,
    year INTEGER,
    day_week INTEGER,
    day_week_name TEXT,
    hour INTEGER,
    minute INTEGER,
    nhs INTEGER,
    rur_urb INTEGER,
    func_sys INTEGER,
    rd_owner INTEGER,
    route INTEGER,
    tway_id TEXT,
    tway_id2 TEXT,
    milept INTEGER,
    latitude REAL,
    longitude REAL,
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
    rail TEXT,
    not_hour INTEGER,
    not_min INTEGER,
    arr_hour INTEGER,
    arr_min INTEGER,
    hosp_hr INTEGER,
    hosp_mn INTEGER,
    cf1 INTEGER,
    cf2 INTEGER,
    cf3 INTEGER,
    fatals INTEGER,
    drunk_dr INTEGER,
    FOREIGN KEY(state) REFERENCES state(state),
    FOREIGN KEY(country) REFERENCES county(county),
    FOREIGN KEY(city) REFERENCES city(city)
);

-- REFERENCES accident table
CREATE TABLE crashrf (
    state INTEGER,
    st_case INTEGER,
    crashrf INTEGER,
    crashrf_name TEXT,
    PRIMARY KEY(st_case, crashrf)

);

CREATE TABLE weather (
    weather INTEGER,
    weather_name TEXT,
    PRIMARY KEY(weather)
);



-- VEHICLE LEVEL
-----------------------------------------
CREATE TABLE vehicle (
    state INTEGER,
    st_case INTEGER,
    veh_no INTEGER,
    ve_forms INTEGER,
    numoccs INTEGER,
    day INTEGER,
    month INTEGER,
    hour INTEGER,
    minute INTEGER,
    harm_ev INTEGER,
    man_coll INTEGER,
    unittype INTEGER,
    hit_run INTEGER,
    reg_stat INTEGER,
    owner INTEGER,
    make INTEGER,
    model INTEGER,
    mak_mod INTEGER,
    body_typ INTEGER,
    mod_year INTEGER,
    vin TEXT,
    vin_1 TEXT,
    vin_2 TEXT,
    vin_3 TEXT,
    vin_4 TEXT,
    vin_5 TEXT,
    vin_6 TEXT,
    vin_7 TEXT,
    vin_8 TEXT,
    vin_9 TEXT,
    vin_10 TEXT,
    vin_11 TEXT,
    vin_12 TEXT,
    tow_veh INTEGER,
    j_knife INTEGER,
    mcarr_i1 INTEGER,
    mcarr_i2 TEXT,
    mcarr_id TEXT,
    gvwr INTEGER,
    v_config INTEGER,
    cargo_bt INTEGER,
    haz_inv INTEGER,
    haz_plac INTEGER,
    haz_id INTEGER,
    haz_cno INTEGER,
    haz_rel INTEGER,
    bus_use INTEGER,
    spec_use INTEGER,
    emer_use INTEGER,
    trav_sp INTEGER,
    underide INTEGER,
    rollover INTEGER,
    rolinloc INTEGER,
    impact1 INTEGER,
    deformed INTEGER,
    towed INTEGER,
    m_harm INTEGER,
    veh_sc1 INTEGER,
    veh_sc2 INTEGER,
    fire_exp INTEGER,
    dr_pres INTEGER,
    l_state INTEGER,
    dr_zip TEXT,
    l_status INTEGER,
    l_type INTEGER,
    cdl_stat INTEGER,
    l_endors INTEGER,
    l_compl INTEGER,
    l_restri INTEGER,
    dr_hgt INTEGER,
    dr_wgt INTEGER,
    prev_acc INTEGER,
    prev_sus INTEGER,
    prev_sus1 INTEGER,
    prev_sus2 INTEGER,
    prev_sus3 INTEGER,
    prev_dwi INTEGER,
    prev_spd INTEGER,
    prev_oth INTEGER,
    first_mo INTEGER,
    first_yr INTEGER,
    last_mo INTEGER,
    last_yr INTEGER,
    speedrel INTEGER,
    dr_sf1 INTEGER,
    dr_sf2 INTEGER,
    dr_sf3 INTEGER,
    dr_sf4 INTEGER,
    vtrafway INTEGER,
    vnum_lan INTEGER,
    vspd_lim INTEGER,
    valign INTEGER,
    vprofile INTEGER,
    vpavetyp INTEGER,
    vsurcond INTEGER,
    vtrafcon INTEGER,
    vtcont_f INTEGER,
    p_crash1 INTEGER,
    p_crash2 INTEGER,
    p_crash3 INTEGER,
    pcrash4 INTEGER,
    pcrash5 INTEGER,
    acc_type INTEGER,
    trlr1vin TEXT,
    trlr2vin TEXT,
    trlr3vin TEXT,
    deaths INTEGER,
    dr_drink INTEGER,
    PRIMARY KEY(st_case, veh_no),
    FOREIGN KEY(state) REFERENCES state(state),
    FOREIGN KEY(st_case) REFERENCES accident(st_case)
);

CREATE TABLE parkwork (
    st_case INTEGER,
    state INTEGER,
    veh_no INTEGER,
    pve_forms INTEGER,
    pday INTEGER,
    phour INTEGER,
    pminute INTEGER,
    pharm_ev INTEGER,
    pman_coll INTEGER,
    pnumoccs INTEGER,
    ptype INTEGER,
    phit_run INTEGER,
    preg_stat INTEGER,
    powner INTEGER,
    pvin TEXT,
    pmodyear INTEGER,
    pmake INTEGER,
    pmodel INTEGER,
    pbodytyp INTEGER,
    picfinalbody INTEGER,
    pgvwer_from INTEGER,
    pgvwer_to INTEGER,
    ptrailer INTEGER,
    ptrlr1vin TEXT,
    ptrlr2vin TEXT,
    ptrlr3vin TEXT,
    ptrlr1gvwr INTEGER,
    ptrlr2gvwr INTEGER,
    ptrlr3gvwr INTEGER,
    pmcarr_id TEXT,
    pmcarr_i1 TEXT,
    pmcarr_i2 TEXT,
    pv_config INTEGER,
    pcargtyp INTEGER,
    phaz_inv INTEGER,
    phazplac INTEGER,
    phaz_id INTEGER,
    phaz_cno INTEGER,
    phaz_rel INTEGER,
    pbus_use INTEGER,
    psp_use INTEGER,
    pem_use INTEGER,
    punderoverride INTEGER,
    pimpact1 INTEGER,
    pveh_sev INTEGER,
    ptowed INTEGER,
    pm_harm INTEGER,
    pfire INTEGER,
    pmake_mod INTEGER,
    pvin_1 TEXT,
    pvin_2 TEXT,
    pvin_3 TEXT,
    pvin_4 TEXT,
    pvin_5 TEXT,
    pvin_6 TEXT,
    pvin_7 TEXT,
    pvin_8 TEXT,
    pvin_9 TEXT,
    pvin_10 TEXT,
    pvin_11 TEXT,
    pvin_12 TEXT,
    ptrailer INTEGER,
    pdeaths INTEGER,
    PRIMARY KEY(st_case, veh_no),
    FOREIGN KEY(state) REFERENCES state(state)
);

-- REFERENCES vehicle table
CREATE TABLE vehiclesf (
    st_case INTEGER,
    state INTEGER,
    veh_no INTEGER,
    vehiclesf INTEGER,
    PRIMARY KEY(st_case, veh_no, vehiclesf),
    FOREIGN KEY(st_case, veh_no) REFERENCES vehicle(st_case, veh_no)
    FOREIGN KEY(state) REFERENCES state(state)
);

CREATE TABLE damage (
st_case INTEGER,
state INTEGER,
veh_no INTEGER,
damage INTEGER,
damage_name TEXT,
PRIMARY KEY(st_case, veh_no, damage),
FOREIGN KEY(st_case, veh_no) REFERENCES vehicle(st_case, veh_no)
FOREIGN KEY(state) REFERENCES state(state)
);

CREATE TABLE distract (
    st_case INTEGER,
    state INTEGER,
    veh_no INTEGER,
    drdistract INTEGER,
    drdistract_name TEXT,
    PRIMARY KEY(st_case, veh_no, drdistract),
    FOREIGN KEY(st_case, veh_no) REFERENCES vehicle(st_case, veh_no),
    FOREIGN KEY(state) REFERENCES state(state)
);

CREATE TABLE drimpair (
    st_case INTEGER,
    state INTEGER,
    veh_no INTEGER,
    drimpair INTEGER,
    drimpair_name TEXT,
    PRIMARY KEY(st_case, veh_no, drimpair),
    FOREIGN KEY(st_case, veh_no) REFERENCES vehicle(st_case, veh_no),
    FOREIGN KEY(state) REFERENCES state(state)
);

CREATE TABLE driverrf (
    st_case INTEGER,
    state INTEGER,
    veh_no INTEGER,
    driverrf INTEGER,
    driverrf_name TEXT,
    PRIMARY KEY(st_case, veh_no, driverrf),
    FOREIGN KEY(st_case, veh_no) REFERENCES vehicle(st_case, veh_no),
    FOREIGN KEY(state) REFERENCES state(state)
);

CREATE TABLE factor (
    st_case INTEGER,
    state INTEGER,
    veh_no INTEGER,
    vehiclecc INTEGER,
    vehiclecc_name TEXT,
    PRIMARY KEY(st_case, veh_no, vehiclecc),
    FOREIGN KEY(st_case, veh_no) REFERENCES vehicle(st_case, veh_no),
    FOREIGN KEY(state) REFERENCES state(state)
);

CREATE TABLE maneuver (
    st_case INTEGER,
    state INTEGER,
    veh_no INTEGER,
    maneuver INTEGER,
    maneuver_name TEXT,
    PRIMARY KEY(st_case, veh_no, maneuver),
    FOREIGN KEY(st_case, veh_no) REFERENCES vehicle(st_case, veh_no),
    FOREIGN KEY(state) REFERENCES state(state)
);

CREATE TABLE violatn (
    st_case INTEGER,
    state INTEGER,
    veh_no INTEGER,
    violation INTEGER,
    violation_name TEXT,
    PRIMARY KEY(st_case, veh_no, violation),
    FOREIGN KEY(st_case, veh_no) REFERENCES vehicle(st_case, veh_no),
    FOREIGN KEY(state) REFERENCES state(state)
);

CREATE TABLE vision (
    st_case INTEGER,
    state INTEGER,
    veh_no INTEGER,
    vision INTEGER,
    vision_name TEXT,
    PRIMARY KEY(st_case, veh_no, vision),
    FOREIGN KEY(st_case, veh_no) REFERENCES vehicle(st_case, veh_no),
    FOREIGN KEY(state) REFERENCES state(state)

);

-- REFERENCES parkwork table
CREATE TABLE pvehiclesf (
    st_case INTEGER,
    state INTEGER,
    veh_no INTEGER,
    pvehiclesf INTEGER,
    PRIMARY KEY(st_case, veh_no, pvehiclesf),
    FOREIGN KEY(st_case, veh_no) REFERENCES parkwork(st_case, veh_no),
    FOREIGN KEY(state) REFERENCES state(state)
);


-- EVENT LEVEL
-----------------------------------------
CREATE TABLE cevent (
    state INTEGER,
    st_case INTEGER,
    eventnum INTEGER,
    vnumber1 INTEGER,
    aoi1 INTEGER,
    soe INTEGER,
    vnumber2 INTEGER,
    aoi2 INTEGER,
    PRIMARY KEY(st_case, eventnum),
    FOREIGN KEY(state) REFERENCES state(state),
    FOREIGN KEY(st_case) REFERENCES accident(st_case)
);

CREATE TABLE vevent (
    state INTEGER,
    st_case INTEGER,
    veh_no INTEGER,
    eventnum INTEGER,
    veventnum INTEGER,
    PRIMARY KEY(st_case, veh_no, veventnum),
    FOREIGN KEY(st_case, veh_no) REFERENCES vehicle(st_case, veh_no),
    FOREIGN KEY(state) REFERENCES state(state)
);

CREATE TABLE vsoe (
    state INTEGER,
    st_case INTEGER,
    veventnum INTEGER,
    veh_no INTEGER
    PRIMARY KEY(st_case, veh_no, veventnum),
    FOREIGN KEY(st_case, veh_no) REFERENCES vehicle(st_case, veh_no),
    FOREIGN KEY(state) REFERENCES state(state)
);

-- PERSON LEVEL
-----------------------------------------
-- REFERENCES accident table with st_case
-- REFERENCE vehicle or parkwork with st_case and veh_no for motor vehicle occupants
CREATE TABLE person (
    st_case INTEGER,
    state INTEGER,
    veh_no INTEGER,
    per_no INTEGER,
    PRIMARY KEY(st_case, veh_no, per_no),
    FOREIGN KEY(st_case) REFERENCES accident(st_case)
);

-- REFERENCE accident table with st_case
CREATE TABLE pbtype (
    st_case INTEGER,
    state INTEGER,
    veh_no INTEGER,
    per_no INTEGER,
    PRIMARY KEY(st_case, veh_no, per_no),
    FOREIGN KEY(st_case) REFERENCES accident(st_case)
);


-- REFERENCE person table. veh_no = 0 for all records in this table
CREATE TABLE safetyeq (
    st_case INTEGER,
    state INTEGER,
    veh_no INTEGER,
    per_no INTEGER,
    PRIMARY KEY(st_case, per_no),
    FOREIGN KEY(st_case, veh_no, per_no) REFERENCES person(st_case, veh_no, per_no)
);

CREATE TABLE drugs (
);
CREATE TABLE race (
);
CREATE TABLE personrf (
);
CREATE TABLE nmcrash (
);
CREATE TABLE nmdistract (
);
CREATE TABLE nmimpair (
);
CREATE TABLE nmprior (
);

-- NEW TABLES
CREATE TABLE county (
    PRIMARY KEY county INTEGER,
    county_name TEXT
);

CREATE TABLE city (
    city INTEGER PRIMARY KEY NOT NULL,
    city_name TEXT
);

CREATE TABLE state (
    state INTEGER PRIMARY KEY NOT NULL,
    name TEXT
);

CREATE TABLE route (
    route INTEGER PRIMARY KEY NOT NULL,
    route_name TEXT
);

CREATE TABLE func_sys (
    func_sys INTEGER PRIMARY KEY NOT NULL,
    func_sysname TEXT
);
















