
CREATE TABLE "renatal_company" (
	"company_id"	varchar2(50)		NOT NULL,
	"company_name"	varchar2(50)		NOT NULL,
	"company_phone_number"	number(20)		NOT NULL,
	"company_address"	varchar2(100)		NOT NULL,
	"company_manager_email"	varchar2(50)		NOT NULL,
	"company_manager_name"	varchar2(20)		NOT NULL
);

CREATE TABLE "car" (
	"car_id"	varchar2(50)		NOT NULL,
	"company_id"	varchar2(50)		NOT NULL,
	"car_name"	varchar2(50)		NOT NULL,
	"car_number"	varchar2(50)		NOT NULL,
	"car_passenger_number"	number(20)		NOT NULL,
	"car_image"	varchar2(50)		NULL,
	"car_detail"	varchar2(50)		NOT NULL,
	"car_rent_pay"	number(50)		NOT NULL,
	"car_register_day"	varchar2(50)		NOT NULL
);

CREATE TABLE "customer" (
	"customer_license_num"	varchar2(20)		NOT NULL,
	"customer_name"	varchar2(15)		NOT NULL,
	"customer_address"	varchar2(50)		NOT NULL,
	"customer_phone"	varchar2(15)		NOT NULL,
	"customer_mail"	varchar2(25)		NOT NULL,
	"customer_before_date"	varchar2(10)		NULL,
	"customer_before_type"	varchar2(20)		NULL
);

CREATE TABLE "rental" (
	"retal_num"	varchar2(20)		NOT NULL,
	"rental_charges"	number(20)		NOT NULL,
	"retal_date"	date		NOT NULL,
	"rental_period"	number(8)		NOT NULL,
	"rental_billing_details"	varchar2(60)		NOT NULL,
	"retal_other_billing_charges"	number(20)		NOT NULL,
	"rental_payment_period"	number(8)		NOT NULL,
	"customer_license_num"	Varchar2(20)		NOT NULL,
	"car_id"	varchar2(50)		NOT NULL,
	"company_id"	varchar2(50)		NOT NULL
);

CREATE TABLE "repair" (
	"repair_id"	varchar2(20)		NOT NULL,
	"repair_name"	varchar2(20)		NOT NULL,
	"repair_phone_number"	number(11)		NOT NULL,
	"repair_manager_name"	varchar2(20)		NOT NULL,
	"repair_manager_email"	varchar2(60)		NULL,
	"repair_address"	varchar2(50)		NOT NULL
);

CREATE TABLE "maintenance" (
	"maintenance_no"	Varchar2(50)		NOT NULL,
	"maintenance_details"	Varchar2(10)		NOT NULL,
	"maintenance_date"	varchar2(10)		NOT NULL,
	"maintenance_cost"	Number(20)		NOT NULL,
	"maintenance_payment_period"	number(8)		NOT NULL,
	"maintenance_else_details"	varchar2(20)		NULL,
	"repair_id"	varchar2(20)		NOT NULL,
	"car_id"	varchar2(50)		NOT NULL,
	"company_id"	varchar2(50)		NOT NULL,
	"customer_license_num"	Varchar2(20)		NOT NULL
);


ALTER TABLE "renatal_company" ADD CONSTRAINT "PK_RENATAL_COMPANY" PRIMARY KEY (
	"company_id"
);

ALTER TABLE "car" ADD CONSTRAINT "PK_CAR" PRIMARY KEY (
	"car_id",
	"company_id"
);

ALTER TABLE "customer" ADD CONSTRAINT "PK_CUSTOMER" PRIMARY KEY (
	"customer_license_num"
);

ALTER TABLE "rental" ADD CONSTRAINT "PK_RENTAL" PRIMARY KEY (
	"retal_num"
);

ALTER TABLE "repair" ADD CONSTRAINT "PK_REPAIR" PRIMARY KEY (
	"repair_id"
);

ALTER TABLE "maintenance" ADD CONSTRAINT "PK_MAINTENANCE" PRIMARY KEY (
	"maintenance_no"
);


ALTER TABLE "car" ADD CONSTRAINT "FK_renatal_company_TO_car_1" FOREIGN KEY (
	"company_id"
)
REFERENCES "renatal_company" (
	"company_id"
);

