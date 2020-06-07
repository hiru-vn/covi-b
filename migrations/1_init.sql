DROP TABLE "USERUSER"
DROP TABLE "USERSTORE"
DROP TABLE "NOTIFY"
DROP TABLE "INFECTEDCOORDINATE"
DROP TABLE "STORES"
DROP TABLE "USERS"
DROP TABLE "CITY"

CREATE TABLE "USERS" (
	"id" serial PRIMARY KEY,
	"username" varchar unique ,
	"password" text,
	"fullname" varchar,
	"yearOfBirth" int,
	"code" varchar,
	"phone" varchar,
	"citycode" int,
	"address" varchar,
	"transmissionLevel" int,
	"isInfected" bool
);

CREATE TABLE "CITY" (
	"id" int PRIMARY KEY,
	"name" varchar,
	"infectedCount" int,
	"infectedLevel" int
);

CREATE TABLE "STORES" (
	"id" serial PRIMARY KEY,
	"code" varchar,
	"name" varchar,
	"isActive" boolean,
	"long" real,
	"lat" real,
	"address" varchar,
	"citycode" int
);

CREATE TABLE "USERSTORE" (
	"id" serial PRIMARY KEY,
	"timein" timestamptz,
	"timeout" timestamptz,
	"userid" serial,
	"storeid" serial
);

CREATE TABLE "USERUSER"(
	"id" serial PRIMARY KEY,
	"timein" timestamptz,
	"timeout" timestamptz,
	"long" real,
	"lat" real,
	"user1id" serial,
	"user2id" serial
);

CREATE TABLE "INFECTEDCOORDINATE"(
	"id" serial PRIMARY KEY,
	"userid" serial,
	"long" real,
	"lat" real,
	"date" timestamptz,
	"citycode" int,
	"address" varchar
);

CREATE TABLE "NOTIFY"(
	"id" serial PRIMARY KEY,
	"userid" serial,
	"time" timestamptz,
	"title" varchar,
	"content" text,
	"type" varchar
);


ALTER TABLE "USERS"
ADD CONSTRAINT fk_users_city 
FOREIGN KEY (citycode) 
REFERENCES "CITY" (id);

ALTER TABLE "STORES"
ADD CONSTRAINT fk_stores_city 
FOREIGN KEY (citycode) 
REFERENCES "CITY" (id);

ALTER TABLE "USERSTORE"
ADD CONSTRAINT fk_userstore_user 
FOREIGN KEY (userid) 
REFERENCES "USERS" (id);

ALTER TABLE "USERSTORE"
ADD CONSTRAINT fk_userstore_store 
FOREIGN KEY (storeid) 
REFERENCES "STORES" (id);

ALTER TABLE "USERUSER"
ADD CONSTRAINT fk_user_user_1 
FOREIGN KEY (user1id) 
REFERENCES "USERS" (id);

ALTER TABLE "USERUSER"
ADD CONSTRAINT fk_user_user_2
FOREIGN KEY (user2id) 
REFERENCES "USERS" (id);

ALTER TABLE "INFECTEDCOORDINATE"
ADD CONSTRAINT fk_infectedcoordinate_user 
FOREIGN KEY (userid) 
REFERENCES "USERS" (id);

ALTER TABLE "INFECTEDCOORDINATE"
ADD CONSTRAINT fk_infectedcoordinate_city 
FOREIGN KEY (citycode) 
REFERENCES "CITY" (id);

ALTER TABLE "NOTIFY"
ADD CONSTRAINT fk_notify_users 
FOREIGN KEY (userid) 
REFERENCES "USERS" (id);