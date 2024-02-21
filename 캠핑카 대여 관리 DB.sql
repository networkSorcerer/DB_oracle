CREATE TABLE `Car_Rent_Comp` (
	`car_rent_comp_id`	VARCHAR2(25)	NOT NULL	COMMENT 'UNIQUE',
	`comp_name`	VARCHAR2(25)	NOT NULL,
	`comp_addr`	VARCHAR2(30)	NOT NULL,
	`comp_phone`	VARCHAR2(25)	NOT NULL,
	`comp_admin_name`	VARCHAR2(25)	NOT NULL,
	`comp_admin_email`	VARCHAR2(50)	NOT NULL
);

CREATE TABLE `Car_Garage` (
	`car_garage_id`	VARCHAR2(25)	NOT NULL	COMMENT 'UNIQUE',
	`garage_name`	VARCHAR2(25)	NOT NULL,
	`garage_addr`	VARCHAR2(30)	NOT NULL,
	`garage_phone`	VARCHAR2(25)	NOT NULL,
	`garage_admin_name`	VARCHAR2(25)	NOT NULL,
	`garage_admin_email`	VARCHAR2(50)	NOT NULL
);

CREATE TABLE `Customers` (
	`cust_driver_license_id`	VARCHAR2(25)	NOT NULL	COMMENT 'UNIQUE',
	`cust_name`	VARCHAR2(20)	NOT NULL,
	`cust_addr`	VARCHAR2(30)	NOT NULL,
	`cust_phone`	VARCHAR2(25)	NOT NULL,
	`cust_email`	VARCHAR2(50)	NOT NULL,
	`cust_past_used_date`	DATE	NULL,
	`cust_past_used_type`	VARCHAR2(20)	NULL
);

CREATE TABLE `Cars` (
	`car_reg_id`	VARCHAR2(25)	NOT NULL	COMMENT 'UNIQUE',
	`car_rent_comp_id`	VARCHAR2(25)	NOT NULL,
	`car_name`	VARCHAR2(25)	NOT NULL,
	`car_number`	VARCHAR2(30)	NOT NULL,
	`car_capa`	NUMBER(2)	NOT NULL,
	`car_detail`	VARCHAR2(100)	NOT NULL,
	`car_rent_price`	NUMBER(7)	NOT NULL,
	`car_reg_date`	DATE	NOT NULL
);

CREATE TABLE `Car_Rent` (
	`car_rent_id`	NUMBER(25)	NOT NULL	COMMENT 'UNIQUE',
	`car_reg_id`	VARCHAR2(25)	NOT NULL,
	`cust_driver_license_id`	VARCHAR2(25)	NOT NULL,
	`car_rent_comp_id`	VARCHAR2(25)	NOT NULL,
	`car_rent_start_date`	DATE	NOT NULL,
	`car_rent_period`	NUMBER(3)	NOT NULL,
	`charge_price`	NUMBER(10)	NOT NULL,
	`price_deadline`	DATE	NOT NULL,
	`add_amount_contents`	VARCHAR2(100)	NULL,
	`add_amount_price`	NUMBER(10)	NULL
);

CREATE TABLE `Car_Repair_Inform` (
	`repair_number`	VARCHAR2(25)	NOT NULL	COMMENT 'UNIQUE',
	`car_reg_id`	VARCHAR2(25)	NOT NULL,
	`car_garage_id`	VARCHAR2(25)	NOT NULL,
	`car_rent_comp_id`	VARCHAR2(25)	NOT NULL,
	`cust_driver_license_id`	VARCHAR2(25)	NOT NULL,
	`repair_contents`	VARCHAR2(100)	NOT NULL,
	`repair_date`	DATE	NOT NULL,
	`repair_price`	NUMBER(10)	NOT NULL,
	`price_deadline`	DATE	NOT NULL,
	`add_repair_contents`	VARCHAR2(100)	NULL
);

ALTER TABLE `Car_Rent_Comp` ADD CONSTRAINT `PK_CAR_RENT_COMP` PRIMARY KEY (
	`car_rent_comp_id`
);

ALTER TABLE `Car_Garage` ADD CONSTRAINT `PK_CAR_GARAGE` PRIMARY KEY (
	`car_garage_id`
);

ALTER TABLE `Customers` ADD CONSTRAINT `PK_CUSTOMERS` PRIMARY KEY (
	`cust_driver_license_id`
);

ALTER TABLE `Cars` ADD CONSTRAINT `PK_CARS` PRIMARY KEY (
	`car_reg_id`,
	`car_rent_comp_id`
);

ALTER TABLE `Car_Rent` ADD CONSTRAINT `PK_CAR_RENT` PRIMARY KEY (
	`car_rent_id`
);

ALTER TABLE `Car_Repair_Inform` ADD CONSTRAINT `PK_CAR_REPAIR_INFORM` PRIMARY KEY (
	`repair_number`
);

ALTER TABLE `Cars` ADD CONSTRAINT `FK_Car_Rent_Comp_TO_Cars_1` FOREIGN KEY (
	`car_rent_comp_id`
)
REFERENCES `Car_Rent_Comp` (
	`car_rent_comp_id`
);

