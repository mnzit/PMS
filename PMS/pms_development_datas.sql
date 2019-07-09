INSERT INTO tbl_venues (name, email, password, contact_no, address, longitute, lalitude, bike_capacity, car_capacity)
VALUES ("CIBT", "creatorsinstitute.com", "cibt", 01556789, "Kumaripati, Lalitpur", "27.6716428,85", "85.3190197", 5,
        10),
       ("IIMS", "iims.com", "iims", 2124316, "Dhobhidara, Putalisadak", "27.7086493", "85.3229509", 10, 5);

INSERT INTO tbl_venue_slots_detail(id, venue_id, bike_slots_available, car_slots_available)
VALUES (1, 1, 5, 8),
       (2, 2, 10, 5);

INSERT INTO tbl_vehicle_types(type)
VALUES ("ONE-WHEELER"),
       ("TWO-WHEELER");

INSERT INTO tbl_slots(type_id, venue_id, status)
VALUES (1, 1, 0),
       (1, 1, 0),
       (1, 1, 0),
       (1, 1, 0),
       (1, 1, 0),
       (2, 1, 0),
       (2, 1, 0),
       (2, 1, 0),
       (2, 1, 0),
       (2, 1, 0),
       (2, 1, 0),
       (2, 1, 1),
       (2, 1, 1),
       (2, 1, 0),
       (2, 1, 0),
       (1, 2, 0),
       (1, 2, 0),
       (1, 2, 0),
       (1, 2, 0),
       (1, 2, 0),
       (1, 2, 0),
       (1, 2, 0),
       (1, 2, 0),
       (1, 2, 0),
       (1, 2, 0),
       (2, 2, 0),
       (2, 2, 0),
       (2, 2, 0),
       (2, 2, 0),
       (2, 2, 0);

INSERT INTO mst_customer_statuses(name, color)
VALUES ("ACTIVE", "GREEN"),
       ("INACTIVE", "RED"),
       ("BLACKLISTED", "BLACK");

INSERT INTO tbl_customers(email, password, first_name, last_name, contact_no, address, status_id)
VALUES ("mnzitshakya@gmail.com", "mnzit", "Manjit", "Shakya", "9808546858", "Bholdhoka,Lalitpur", 1),
       ("mhrznsandu@gmail.com", "sandu", "Sandesh", "Maharjan", "9840067583", "Sunakothi,Lalitpur", 1);

INSERT INTO tbl_vehicles(number_plate, type_id)
VALUES ("BAA0101", 2),
       ("BAA0103",1);

INSERT tbl_customer_vehicles(customer_id, vehicle_id)  VALUES(1,2),(1,1);

INSERT INTO tbl_parkings (customer_id, vehicle_id, slot_id)
VALUES (1, 1, 12),
       (2, 2, 13);

