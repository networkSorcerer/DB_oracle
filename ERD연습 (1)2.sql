CREATE TABLE `Untitled` (
	`Key`	VARCHAR(255)	NOT NULL,
	`Field`	VARCHAR(255)	NULL
);

CREATE TABLE `Untitled2` (
	`Key`	VARCHAR(255)	NOT NULL,
	`Key2`	VARCHAR(255)	NOT NULL,
	`Field`	VARCHAR(255)	NULL
);

CREATE TABLE `Untitled3` (
	`Key`	VARCHAR(255)	NOT NULL,
	`Field`	VARCHAR(255)	NULL,
	`Field2`	VARCHAR(255)	NULL,
	`Field3`	VARCHAR(255)	NULL,
	`Field4`	VARCHAR(255)	NULL,
	`Field5`	VARCHAR(255)	NULL,
	`Field6`	VARCHAR(255)	NULL,
	`Key2`	VARCHAR(255)	NOT NULL,
	`Key22`	VARCHAR(255)	NOT NULL
);

CREATE TABLE `Untitled4` (
	`Key`	VARCHAR(255)	NOT NULL,
	`Field`	VARCHAR(255)	NULL,
	`Field2`	VARCHAR(255)	NULL
);

CREATE TABLE `Untitled5` (
	`Key`	VARCHAR(255)	NOT NULL,
	`Key2`	VARCHAR(255)	NOT NULL,
	`Key3`	VARCHAR(255)	NOT NULL
);

CREATE TABLE `Untitled6` (
	`Key`	VARCHAR(255)	NOT NULL,
	`Field`	VARCHAR(255)	NULL,
	`Field2`	VARCHAR(255)	NULL,
	`Field3`	VARCHAR(255)	NULL
);

CREATE TABLE `Untitled7` (
	`Key`	VARCHAR(255)	NOT NULL,
	`Field`	VARCHAR(255)	NULL,
	`Field2`	VARCHAR(255)	NULL,
	`Field3`	VARCHAR(255)	NULL,
	`Field4`	VARCHAR(255)	NULL
);

CREATE TABLE `Untitled8` (
	`Key`	VARCHAR(255)	NOT NULL,
	`Key2`	VARCHAR(255)	NOT NULL,
	`Field`	VARCHAR(255)	NULL,
	`Field2`	VARCHAR(255)	NULL,
	`Field3`	VARCHAR(255)	NULL,
	`Field4`	VARCHAR(255)	NULL,
	`Field5`	VARCHAR(255)	NULL,
	`Field6`	VARCHAR(255)	NULL,
	`Field7`	VARCHAR(255)	NULL
);

CREATE TABLE `Untitled9` (
	`Key`	VARCHAR(255)	NOT NULL,
	`Field`	VARCHAR(255)	NULL,
	`Field2`	VARCHAR(255)	NULL,
	`Field3`	VARCHAR(255)	NULL,
	`Field4`	VARCHAR(255)	NULL
);

CREATE TABLE `Untitled10` (
	`Field`	VARCHAR(255)	NULL,
	`Field2`	VARCHAR(255)	NULL,
	`Key`	VARCHAR(255)	NOT NULL
);

CREATE TABLE `Untitled11` (
	`Key`	VARCHAR(255)	NOT NULL,
	`Field`	VARCHAR(255)	NULL,
	`Field2`	VARCHAR(255)	NULL,
	`Field3`	VARCHAR(255)	NULL,
	`Field4`	VARCHAR(255)	NULL,
	`Field5`	VARCHAR(255)	NULL,
	`Field6`	VARCHAR(255)	NULL,
	`Field7`	VARCHAR(255)	NULL,
	`Key2`	VARCHAR(255)	NOT NULL,
	`Key22`	VARCHAR(255)	NOT NULL,
	`Key3`	VARCHAR(255)	NOT NULL
);

CREATE TABLE `Untitled12` (
	`Key`	VARCHAR(255)	NOT NULL,
	`Field`	VARCHAR(255)	NULL,
	`Field2`	VARCHAR(255)	NULL,
	`Field3`	VARCHAR(255)	NULL,
	`Field4`	VARCHAR(255)	NULL
);

CREATE TABLE `Untitled13` (
	`Key`	VARCHAR(255)	NOT NULL,
	`Field`	VARCHAR(255)	NULL,
	`Field2`	VARCHAR(255)	NULL,
	`Field3`	VARCHAR(255)	NULL,
	`Field4`	VARCHAR(255)	NULL,
	`Field5`	VARCHAR(255)	NULL,
	`Key2`	VARCHAR(255)	NOT NULL,
	`Key22`	VARCHAR(255)	NOT NULL,
	`Key3`	VARCHAR(255)	NOT NULL,
	`Key4`	VARCHAR(255)	NOT NULL
);

ALTER TABLE `Untitled` ADD CONSTRAINT `PK_UNTITLED` PRIMARY KEY (
	`Key`
);

ALTER TABLE `Untitled2` ADD CONSTRAINT `PK_UNTITLED2` PRIMARY KEY (
	`Key`,
	`Key2`
);

ALTER TABLE `Untitled3` ADD CONSTRAINT `PK_UNTITLED3` PRIMARY KEY (
	`Key`
);

ALTER TABLE `Untitled4` ADD CONSTRAINT `PK_UNTITLED4` PRIMARY KEY (
	`Key`
);

ALTER TABLE `Untitled5` ADD CONSTRAINT `PK_UNTITLED5` PRIMARY KEY (
	`Key`,
	`Key2`
);

ALTER TABLE `Untitled6` ADD CONSTRAINT `PK_UNTITLED6` PRIMARY KEY (
	`Key`
);

ALTER TABLE `Untitled7` ADD CONSTRAINT `PK_UNTITLED7` PRIMARY KEY (
	`Key`
);

ALTER TABLE `Untitled8` ADD CONSTRAINT `PK_UNTITLED8` PRIMARY KEY (
	`Key`,
	`Key2`
);

ALTER TABLE `Untitled9` ADD CONSTRAINT `PK_UNTITLED9` PRIMARY KEY (
	`Key`
);

ALTER TABLE `Untitled11` ADD CONSTRAINT `PK_UNTITLED11` PRIMARY KEY (
	`Key`
);

ALTER TABLE `Untitled12` ADD CONSTRAINT `PK_UNTITLED12` PRIMARY KEY (
	`Key`
);

ALTER TABLE `Untitled13` ADD CONSTRAINT `PK_UNTITLED13` PRIMARY KEY (
	`Key`
);

ALTER TABLE `Untitled2` ADD CONSTRAINT `FK_Untitled_TO_Untitled2_1` FOREIGN KEY (
	`Key2`
)
REFERENCES `Untitled` (
	`Key`
);

ALTER TABLE `Untitled5` ADD CONSTRAINT `FK_Untitled6_TO_Untitled5_1` FOREIGN KEY (
	`Key2`
)
REFERENCES `Untitled6` (
	`Key`
);

ALTER TABLE `Untitled8` ADD CONSTRAINT `FK_Untitled7_TO_Untitled8_1` FOREIGN KEY (
	`Key2`
)
REFERENCES `Untitled7` (
	`Key`
);

