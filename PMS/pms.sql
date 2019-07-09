#create database pms;
# use pms;

CREATE TABLE tbl_customers
(
    id            SERIAL PRIMARY KEY,
    email         VARCHAR(100) UNIQUE NOT NULL,
    password      VARCHAR(255)        NOT NULL,
    first_name    VARCHAR(100)        NOT NULL,
    last_name     VARCHAR(50)         NOT NULL,
    contact_no    VARCHAR(10)         NOT NULL,
    address       VARCHAR(100)        NULL,
    status_id     BIGINT(20) UNSIGNED NOT NULL,
    created_date  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_date TIMESTAMP           NULL,
    is_deleted    BOOLEAN   DEFAULT FALSE,
    deleted_date  TIMESTAMP           NULL
);

CREATE TABLE mst_customer_statuses
(
    id            SERIAL PRIMARY KEY,
    name          VARCHAR(100) NOT NULL,
    color         VARCHAR(100) NOT NULL,
    created_date  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_date TIMESTAMP    NULL,
    is_deleted    BOOLEAN   DEFAULT FALSE,
    deleted_date  TIMESTAMP    NULL
);

ALTER TABLE tbl_customers
    ADD FOREIGN KEY (status_id) REFERENCES mst_customer_statuses (id);

CREATE TABLE tbl_vehicle_types
(
    id   SERIAL PRIMARY KEY,
    type VARCHAR(100) NOT NULL
);

CREATE TABLE tbl_vehicles
(
    id           SERIAL PRIMARY KEY,
    number_plate VARCHAR(100) NOT NULL,
    type_id         BIGINT(20) UNSIGNED NOT NULL
);

ALTER TABLE tbl_vehicles
    ADD FOREIGN KEY (type_id) REFERENCES tbl_vehicle_types (id);

CREATE TABLE tbl_customer_vehicles
(
    id          SERIAL PRIMARY KEY,
    customer_id BIGINT(20) UNSIGNED NOT NULL,
    vehicle_id  BIGINT(20) UNSIGNED NOT NULL
);

ALTER TABLE tbl_customer_vehicles
    ADD FOREIGN KEY (customer_id) REFERENCES tbl_customers (id);

ALTER TABLE tbl_customer_vehicles
    ADD FOREIGN KEY (vehicle_id) REFERENCES tbl_vehicles (id);


CREATE TABLE tbl_venues
(
    id            SERIAL PRIMARY KEY,
    name          VARCHAR(100)        NOT NULL,
    email         VARCHAR(255) UNIQUE NOT NULL,
    password      VARCHAR(255)        NOT NULL,
    contact_no    VARCHAR(100)        NOT NULL,
    address       VARCHAR(255)        NOT NULL,
    longitute     VARCHAR(255)        NOT NULL,
    lalitude      VARCHAR(255)        NOT NULL,
    bike_capacity INTEGER(20)         NOT NULL,
    car_capacity  INTEGER(20)         NOT NULL,
    created_date  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_date TIMESTAMP           NULL,
    is_deleted    BOOLEAN   DEFAULT FALSE,
    deleted_date  TIMESTAMP           NULL
);

CREATE TABLE tbl_slots
(
    id       SERIAL PRIMARY KEY,
    type_id     BIGINT(20) UNSIGNED NOT NULL,
    venue_id BIGINT(20) UNSIGNED NOT NULL,
    status   BOOLEAN DEFAULT FALSE
);

ALTER TABLE tbl_slots
    ADD FOREIGN KEY (type_id) REFERENCES tbl_vehicle_types (id);

ALTER TABLE tbl_slots
    ADD FOREIGN KEY (venue_id) REFERENCES tbl_venues (id);

CREATE TABLE tbl_venue_slots_detail
(
    id                   SERIAL PRIMARY KEY,
    venue_id             BIGINT(20) UNSIGNED NOT NULL,
    bike_slots_available INTEGER(20)         NOT NULL,
    car_slots_available  INTEGER(20)         NOT NULL
);

ALTER TABLE tbl_venue_slots_detail
    ADD FOREIGN KEY (venue_id) REFERENCES tbl_venues (id);

CREATE TABLE tbl_parkings
(
    id            SERIAL PRIMARY KEY,
    customer_id   BIGINT(20) UNSIGNED NOT NULL,
    vehicle_id    BIGINT(20) UNSIGNED NOT NULL,
    slot_id       BIGINT(20) UNSIGNED NOT NULL,
    in_date       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    out_date      TIMESTAMP           NULL,
    is_parked     BOOLEAN   DEFAULT TRUE,
    modified_date TIMESTAMP           NULL,
    is_deleted    BOOLEAN   DEFAULT FALSE,
    deleted_date  TIMESTAMP           NULL
);

ALTER TABLE tbl_parkings
    ADD FOREIGN KEY (customer_id) REFERENCES tbl_customers (id);

ALTER TABLE tbl_parkings
    ADD FOREIGN KEY (vehicle_id) REFERENCES tbl_vehicles (id);

ALTER TABLE tbl_parkings
    ADD FOREIGN KEY (slot_id) REFERENCES tbl_slots (id);
