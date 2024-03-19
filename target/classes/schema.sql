DROP TABLE IF EXISTS pet_store_customer;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS pet_store;

CREATE TABLE pet_store (
  pet_store_id bigint NOT NULL AUTO_INCREMENT,
  pet_store_address varchar(255) DEFAULT NULL,
  pet_store_city varchar(255) DEFAULT NULL,
  pet_store_name varchar(255) DEFAULT NULL,
  pet_store_phone varchar(255) DEFAULT NULL,
  pet_store_state varchar(255) DEFAULT NULL,
  pet_store_zip varchar(255) DEFAULT NULL,
  PRIMARY KEY (pet_store_id)
);

CREATE TABLE customer (
  customer_id bigint NOT NULL AUTO_INCREMENT,
  customer_email varchar(255) DEFAULT NULL,
  customer_first_name varchar(255) DEFAULT NULL,
  customer_last_name varchar(255) DEFAULT NULL,
  PRIMARY KEY (customer_id),
  UNIQUE KEY (customer_email)
);

CREATE TABLE employee (
  employee_id bigint NOT NULL AUTO_INCREMENT,
  pet_store_id bigint NOT NULL,
  employee_first_name varchar(255) DEFAULT NULL,
  employee_job_title varchar(255) DEFAULT NULL,
  employee_last_name varchar(255) DEFAULT NULL,
  employee_phone varchar(255) DEFAULT NULL,
  PRIMARY KEY (employee_id),
  FOREIGN KEY (pet_store_id) REFERENCES pet_store (pet_store_id)
);

CREATE TABLE pet_store_customer (
  customer_id bigint NOT NULL,
  pet_store_id bigint NOT NULL,
  PRIMARY KEY (customer_id,pet_store_id),
  FOREIGN KEY (customer_id)  REFERENCES customer (customer_id),
  FOREIGN KEY (pet_store_id) REFERENCES pet_store (pet_store_id)
);