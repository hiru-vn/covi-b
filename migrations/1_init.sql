DROP TABLE "USERUSER";
DROP TABLE "USERSTORE";
DROP TABLE "NOTIFY";
DROP TABLE "INFECTEDCOORDINATE";
DROP TABLE "STORES";
DROP TABLE "USERS";
DROP TABLE "CITY";

CREATE TABLE "USERS" (
"id" serial PRIMARY KEY,
"username" varchar unique ,
"password" text,
"fullname" varchar,
"yearOfBirth" int,
"code" varchar,
"phone" varchar,
"citycode" int,
"long" real,
"lat" real,
"address" varchar,
"transmissionLevel" int,
"isInfected" bool
);

CREATE TABLE "CITY" (
"id" int PRIMARY KEY,
"name" varchar,
"infectedCount" int,
"criticalCount" int,
"curedCount" int,
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
"timein" varchar,
"timeout" varchar,
"userid" serial,
"storeid" serial
);

CREATE TABLE "USERUSER"(
"id" serial PRIMARY KEY,
"timein" varchar,
"timeout" varchar,
"long" real,
"lat" real,
"user1id" serial,
"user2id" serial
);

CREATE TABLE "INFECTEDCOORDINATE"(
"id" serial PRIMARY KEY,
"user1id" serial,
"user2id" serial,
"storeid" serial,
"user1infectlevel" int,
"user2infectlevel" int,
"long" real,
"lat" real,
"date" varchar,
"citycode" int,
"address" varchar
);

CREATE TABLE "NOTIFY"(
"id" serial PRIMARY KEY,
"userid" serial,
"time" varchar,
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
ADD CONSTRAINT fk_infectedcoordinate_user2
FOREIGN KEY (user2id)
REFERENCES "USERS" (id);

ALTER TABLE "INFECTEDCOORDINATE"
ADD CONSTRAINT fk_infectedcoordinate_user1
FOREIGN KEY (user1id)
REFERENCES "USERS" (id);

ALTER TABLE "INFECTEDCOORDINATE"
ADD CONSTRAINT fk_infectedcoordinate_store
FOREIGN KEY (storeid)
REFERENCES "STORES" (id);

ALTER TABLE "INFECTEDCOORDINATE"
ADD CONSTRAINT fk_infectedcoordinate_city
FOREIGN KEY (citycode)
REFERENCES "CITY" (id);

ALTER TABLE "NOTIFY"
ADD CONSTRAINT fk_notify_users
FOREIGN KEY (userid)
REFERENCES "USERS" (id);

INSERT into "CITY"(id, name) VALUES (92, 'Thành phố Cần Thơ');
INSERT into "CITY"(id, name) VALUES (01, 'Thành phố Hà Nội');
INSERT into "CITY"(id, name) VALUES (31, 'Thành phố Hải Phòng');
INSERT into "CITY"(id, name) VALUES (79, 'Thành phố Hồ Chí Minh');
INSERT into "CITY"(id, name) VALUES (48, 'Thành phố Đà Nẵng');
INSERT into "CITY"(id, name) VALUES (89, 'Tỉnh An Giang');
INSERT into "CITY"(id, name) VALUES (77, 'Tỉnh Bà Rịa - Vũng Tàu');
INSERT into "CITY"(id, name) VALUES (74, 'Tỉnh Bình Dương');
INSERT into "CITY"(id, name) VALUES (70, 'Tỉnh Bình Phước');
INSERT into "CITY"(id, name) VALUES (60, 'Tỉnh Bình Thuận');
INSERT into "CITY"(id, name) VALUES (52, 'Tỉnh Bình Định');
INSERT into "CITY"(id, name) VALUES (95, 'Tỉnh Bạc Liêu');
INSERT into "CITY"(id, name) VALUES (24, 'Tỉnh Bắc Giang');
INSERT into "CITY"(id, name) VALUES (06, 'Tỉnh Bắc Kạn');
INSERT into "CITY"(id, name) VALUES (27, 'Tỉnh Bắc Ninh');
INSERT into "CITY"(id, name) VALUES (83, 'Tỉnh Bến Tre');
INSERT into "CITY"(id, name) VALUES (04, 'Tỉnh Cao Bằng');
INSERT into "CITY"(id, name) VALUES (96, 'Tỉnh Cà Mau');
INSERT into "CITY"(id, name) VALUES (64, 'Tỉnh Gia Lai');
INSERT into "CITY"(id, name) VALUES (17, 'Tỉnh Hoà Bình');
INSERT into "CITY"(id, name) VALUES (02, 'Tỉnh Hà Giang');
INSERT into "CITY"(id, name) VALUES (35, 'Tỉnh Hà Nam');
INSERT into "CITY"(id, name) VALUES (42, 'Tỉnh Hà Tĩnh');
INSERT into "CITY"(id, name) VALUES (33, 'Tỉnh Hưng Yên');
INSERT into "CITY"(id, name) VALUES (30, 'Tỉnh Hải Dương');
INSERT into "CITY"(id, name) VALUES (93, 'Tỉnh Hậu Giang');
INSERT into "CITY"(id, name) VALUES (56, 'Tỉnh Khánh Hòa');
INSERT into "CITY"(id, name) VALUES (91, 'Tỉnh Kiên Giang');
INSERT into "CITY"(id, name) VALUES (62, 'Tỉnh Kon Tum');
INSERT into "CITY"(id, name) VALUES (12, 'Tỉnh Lai Châu');
INSERT into "CITY"(id, name) VALUES (80, 'Tỉnh Long An');
INSERT into "CITY"(id, name) VALUES (10, 'Tỉnh Lào Cai');
INSERT into "CITY"(id, name) VALUES (68, 'Tỉnh Lâm Đồng');
INSERT into "CITY"(id, name) VALUES (20, 'Tỉnh Lạng Sơn');
INSERT into "CITY"(id, name) VALUES (36, 'Tỉnh Nam Định');
INSERT into "CITY"(id, name) VALUES (40, 'Tỉnh Nghệ An');
INSERT into "CITY"(id, name) VALUES (37, 'Tỉnh Ninh Bình');
INSERT into "CITY"(id, name) VALUES (58, 'Tỉnh Ninh Thuận');
INSERT into "CITY"(id, name) VALUES (25, 'Tỉnh Phú Thọ');
INSERT into "CITY"(id, name) VALUES (54, 'Tỉnh Phú Yên');
INSERT into "CITY"(id, name) VALUES (44, 'Tỉnh Quảng Bình');
INSERT into "CITY"(id, name) VALUES (49, 'Tỉnh Quảng Nam');
INSERT into "CITY"(id, name) VALUES (51, 'Tỉnh Quảng Ngãi');
INSERT into "CITY"(id, name) VALUES (22, 'Tỉnh Quảng Ninh');
INSERT into "CITY"(id, name) VALUES (45, 'Tỉnh Quảng Trị');
INSERT into "CITY"(id, name) VALUES (94, 'Tỉnh Sóc Trăng');
INSERT into "CITY"(id, name) VALUES (14, 'Tỉnh Sơn La');
INSERT into "CITY"(id, name) VALUES (38, 'Tỉnh Thanh Hóa');
INSERT into "CITY"(id, name) VALUES (34, 'Tỉnh Thái Bình');
INSERT into "CITY"(id, name) VALUES (19, 'Tỉnh Thái Nguyên');
INSERT into "CITY"(id, name) VALUES (46, 'Tỉnh Thừa Thiên Huế');

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user1', 'password123', 'Nguyễn Văn A', 1999, 'user1',
'0123456789', 79, 10.81599, 106.61599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user2', 'password123', 'Nguyễn Văn A', 1999, 'user2',
'0123456789', 79, 10.82599, 106.62599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user3', 'password123', 'Nguyễn Văn A', 1999, 'user3',
'0123456789', 79, 10.83599, 106.63599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user4', 'password123', 'Nguyễn Văn A', 1999, 'user4',
'0123456789', 79, 10.84599, 106.64599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user5', 'password123', 'Nguyễn Văn A', 1999, 'user5',
'0123456789', 79, 10.85599, 106.65599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user6', 'password123', 'Nguyễn Văn A', 1999, 'user6',
'0123456789', 79, 10.86599, 106.66599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user7', 'password123', 'Nguyễn Văn A', 1999, 'user7',
'0123456789', 79, 10.87599, 106.67599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user8', 'password123', 'Nguyễn Văn A', 1999, 'user8',
'0123456789', 79, 10.88599, 106.68599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user9', 'password123', 'Nguyễn Văn A', 1999, 'user9',
'0123456789', 79, 10.89599, 106.69599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user10', 'password123', 'Nguyễn Văn A', 1999, 'user10',
'0123456789', 79, 10.810599, 106.610599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user11', 'password123', 'Nguyễn Văn A', 1999, 'user11',
'0123456789', 79, 10.811599, 106.611599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user12', 'password123', 'Nguyễn Văn A', 1999, 'user12',
'0123456789', 79, 10.812599, 106.612599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user13', 'password123', 'Nguyễn Văn A', 1999, 'user13',
'0123456789', 79, 10.813599, 106.613599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user14', 'password123', 'Nguyễn Văn A', 1999, 'user14',
'0123456789', 79, 10.814599, 106.614599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user15', 'password123', 'Nguyễn Văn A', 1999, 'user15',
'0123456789', 79, 10.815599, 106.615599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user16', 'password123', 'Nguyễn Văn A', 1999, 'user16',
'0123456789', 79, 10.816599, 106.616599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user17', 'password123', 'Nguyễn Văn A', 1999, 'user17',
'0123456789', 79, 10.817599, 106.617599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user18', 'password123', 'Nguyễn Văn A', 1999, 'user18',
'0123456789', 79, 10.818599, 106.618599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user19', 'password123', 'Nguyễn Văn A', 1999, 'user19',
'0123456789', 79, 10.819599, 106.619599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user20', 'password123', 'Nguyễn Văn A', 1999, 'user20',
'0123456789', 79, 10.820599, 106.620599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user21', 'password123', 'Nguyễn Văn A', 1999, 'user21',
'0123456789', 79, 10.821599, 106.621599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user22', 'password123', 'Nguyễn Văn A', 1999, 'user22',
'0123456789', 79, 10.822599, 106.622599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user23', 'password123', 'Nguyễn Văn A', 1999, 'user23',
'0123456789', 79, 10.823599, 106.623599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user24', 'password123', 'Nguyễn Văn A', 1999, 'user24',
'0123456789', 79, 10.824599, 106.624599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user25', 'password123', 'Nguyễn Văn A', 1999, 'user25',
'0123456789', 79, 10.825599, 106.625599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user26', 'password123', 'Nguyễn Văn A', 1999, 'user26',
'0123456789', 79, 10.826599, 106.626599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user27', 'password123', 'Nguyễn Văn A', 1999, 'user27',
'0123456789', 79, 10.827599, 106.627599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user28', 'password123', 'Nguyễn Văn A', 1999, 'user28',
'0123456789', 79, 10.828599, 106.628599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user29', 'password123', 'Nguyễn Văn A', 1999, 'user29',
'0123456789', 79, 10.829599, 106.629599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user30', 'password123', 'Nguyễn Văn A', 1999, 'user30',
'0123456789', 79, 10.830599, 106.630599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user31', 'password123', 'Nguyễn Văn A', 1999, 'user31',
'0123456789', 79, 10.831599, 106.631599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user32', 'password123', 'Nguyễn Văn A', 1999, 'user32',
'0123456789', 79, 10.832599, 106.632599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user33', 'password123', 'Nguyễn Văn A', 1999, 'user33',
'0123456789', 79, 10.833599, 106.633599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user34', 'password123', 'Nguyễn Văn A', 1999, 'user34',
'0123456789', 79, 10.834599, 106.634599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user35', 'password123', 'Nguyễn Văn A', 1999, 'user35',
'0123456789', 79, 10.835599, 106.635599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user36', 'password123', 'Nguyễn Văn A', 1999, 'user36',
'0123456789', 79, 10.836599, 106.636599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user37', 'password123', 'Nguyễn Văn A', 1999, 'user37',
'0123456789', 79, 10.837599, 106.637599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user38', 'password123', 'Nguyễn Văn A', 1999, 'user38',
'0123456789', 79, 10.838599, 106.638599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user39', 'password123', 'Nguyễn Văn A', 1999, 'user39',
'0123456789', 79, 10.839599, 106.639599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user40', 'password123', 'Nguyễn Văn A', 1999, 'user40',
'0123456789', 79, 10.840599, 106.640599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user41', 'password123', 'Nguyễn Văn A', 1999, 'user41',
'0123456789', 79, 10.841599, 106.641599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user42', 'password123', 'Nguyễn Văn A', 1999, 'user42',
'0123456789', 79, 10.842599, 106.642599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user43', 'password123', 'Nguyễn Văn A', 1999, 'user43',
'0123456789', 79, 10.843599, 106.643599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user44', 'password123', 'Nguyễn Văn A', 1999, 'user44',
'0123456789', 79, 10.844599, 106.644599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user45', 'password123', 'Nguyễn Văn A', 1999, 'user45',
'0123456789', 79, 10.845599, 106.645599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user46', 'password123', 'Nguyễn Văn A', 1999, 'user46',
'0123456789', 79, 10.846599, 106.646599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user47', 'password123', 'Nguyễn Văn A', 1999, 'user47',
'0123456789', 79, 10.847599, 106.647599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user48', 'password123', 'Nguyễn Văn A', 1999, 'user48',
'0123456789', 79, 10.848599, 106.648599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user49', 'password123', 'Nguyễn Văn A', 1999, 'user49',
'0123456789', 79, 10.849599, 106.649599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user50', 'password123', 'Nguyễn Văn A', 1999, 'user50',
'0123456789', 79, 10.850599, 106.650599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user51', 'password123', 'Nguyễn Văn A', 1999, 'user51',
'0123456789', 79, 10.851599, 106.651599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user52', 'password123', 'Nguyễn Văn A', 1999, 'user52',
'0123456789', 79, 10.852599, 106.652599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user53', 'password123', 'Nguyễn Văn A', 1999, 'user53',
'0123456789', 79, 10.853599, 106.653599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user54', 'password123', 'Nguyễn Văn A', 1999, 'user54',
'0123456789', 79, 10.854599, 106.654599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user55', 'password123', 'Nguyễn Văn A', 1999, 'user55',
'0123456789', 79, 10.855599, 106.655599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user56', 'password123', 'Nguyễn Văn A', 1999, 'user56',
'0123456789', 79, 10.856599, 106.656599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user57', 'password123', 'Nguyễn Văn A', 1999, 'user57',
'0123456789', 79, 10.857599, 106.657599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user58', 'password123', 'Nguyễn Văn A', 1999, 'user58',
'0123456789', 79, 10.858599, 106.658599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user59', 'password123', 'Nguyễn Văn A', 1999, 'user59',
'0123456789', 79, 10.859599, 106.659599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user60', 'password123', 'Nguyễn Văn A', 1999, 'user60',
'0123456789', 79, 10.860599, 106.660599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user61', 'password123', 'Nguyễn Văn A', 1999, 'user61',
'0123456789', 79, 10.861599, 106.661599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user62', 'password123', 'Nguyễn Văn A', 1999, 'user62',
'0123456789', 79, 10.862599, 106.662599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user63', 'password123', 'Nguyễn Văn A', 1999, 'user63',
'0123456789', 79, 10.863599, 106.663599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user64', 'password123', 'Nguyễn Văn A', 1999, 'user64',
'0123456789', 79, 10.864599, 106.664599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user65', 'password123', 'Nguyễn Văn A', 1999, 'user65',
'0123456789', 79, 10.865599, 106.665599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user66', 'password123', 'Nguyễn Văn A', 1999, 'user66',
'0123456789', 79, 10.866599, 106.666599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user67', 'password123', 'Nguyễn Văn A', 1999, 'user67',
'0123456789', 79, 10.867599, 106.667599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user68', 'password123', 'Nguyễn Văn A', 1999, 'user68',
'0123456789', 79, 10.868599, 106.668599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user69', 'password123', 'Nguyễn Văn A', 1999, 'user69',
'0123456789', 79, 10.869599, 106.669599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user70', 'password123', 'Nguyễn Văn A', 1999, 'user70',
'0123456789', 79, 10.870599, 106.670599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user71', 'password123', 'Nguyễn Văn A', 1999, 'user71',
'0123456789', 79, 10.871599, 106.671599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user72', 'password123', 'Nguyễn Văn A', 1999, 'user72',
'0123456789', 79, 10.872599, 106.672599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user73', 'password123', 'Nguyễn Văn A', 1999, 'user73',
'0123456789', 79, 10.873599, 106.673599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user74', 'password123', 'Nguyễn Văn A', 1999, 'user74',
'0123456789', 79, 10.874599, 106.674599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user75', 'password123', 'Nguyễn Văn A', 1999, 'user75',
'0123456789', 79, 10.875599, 106.675599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user76', 'password123', 'Nguyễn Văn A', 1999, 'user76',
'0123456789', 79, 10.876599, 106.676599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user77', 'password123', 'Nguyễn Văn A', 1999, 'user77',
'0123456789', 79, 10.877599, 106.677599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user78', 'password123', 'Nguyễn Văn A', 1999, 'user78',
'0123456789', 79, 10.878599, 106.678599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user79', 'password123', 'Nguyễn Văn A', 1999, 'user79',
'0123456789', 79, 10.879599, 106.679599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user80', 'password123', 'Nguyễn Văn A', 1999, 'user80',
'0123456789', 79, 10.880599, 106.680599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user81', 'password123', 'Nguyễn Văn A', 1999, 'user81',
'0123456789', 79, 10.881599, 106.681599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user82', 'password123', 'Nguyễn Văn A', 1999, 'user82',
'0123456789', 79, 10.882599, 106.682599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user83', 'password123', 'Nguyễn Văn A', 1999, 'user83',
'0123456789', 79, 10.883599, 106.683599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user84', 'password123', 'Nguyễn Văn A', 1999, 'user84',
'0123456789', 79, 10.884599, 106.684599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user85', 'password123', 'Nguyễn Văn A', 1999, 'user85',
'0123456789', 79, 10.885599, 106.685599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user86', 'password123', 'Nguyễn Văn A', 1999, 'user86',
'0123456789', 79, 10.886599, 106.686599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user87', 'password123', 'Nguyễn Văn A', 1999, 'user87',
'0123456789', 79, 10.887599, 106.687599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user88', 'password123', 'Nguyễn Văn A', 1999, 'user88',
'0123456789', 79, 10.888599, 106.688599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user89', 'password123', 'Nguyễn Văn A', 1999, 'user89',
'0123456789', 79, 10.889599, 106.689599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user90', 'password123', 'Nguyễn Văn A', 1999, 'user90',
'0123456789', 79, 10.890599, 106.690599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user91', 'password123', 'Nguyễn Văn A', 1999, 'user91',
'0123456789', 79, 10.891599, 106.691599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user92', 'password123', 'Nguyễn Văn A', 1999, 'user92',
'0123456789', 79, 10.892599, 106.692599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user93', 'password123', 'Nguyễn Văn A', 1999, 'user93',
'0123456789', 79, 10.893599, 106.693599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user94', 'password123', 'Nguyễn Văn A', 1999, 'user94',
'0123456789', 79, 10.894599, 106.694599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user95', 'password123', 'Nguyễn Văn A', 1999, 'user95',
'0123456789', 79, 10.895599, 106.695599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user96', 'password123', 'Nguyễn Văn A', 1999, 'user96',
'0123456789', 79, 10.896599, 106.696599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user97', 'password123', 'Nguyễn Văn A', 1999, 'user97',
'0123456789', 79, 10.897599, 106.697599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user98', 'password123', 'Nguyễn Văn A', 1999, 'user98',
'0123456789', 79, 10.898599, 106.698599, 'Hồ Chí Minh', false);

INSERT into "USERS"
(username, password, fullname, "yearOfBirth", code, phone, citycode, long,lat, address, "isInfected")
VALUES ('user99', 'password123', 'Nguyễn Văn A', 1999, 'user99',
'0123456789', 79, 10.899599, 106.699599, 'Hồ Chí Minh', false);


Update "CITY" set "infectedCount" = 0;
Update "CITY" set "curedCount" = 0;
Update "CITY" set "criticalCount" = 0;
Update "CITY" set "infectedLevel" = 0;
update "USERS" set "transmissionLevel" = null;
update "USERS" set "isInfected" = false;

VALUES ('ST00002', 'Familymart', true , 10.810599, 106.681477, '42 Hoa Huệ, Phú Nhuận, Tp Hồ chí Minh', 79);
INSERT into "STORES"(code, name, "isActive", long, lat, address, citycode)
VALUES ('ST00003', 'Mini Stop', true , 10.874248, 106.418753, '12 Phổ Quang, Gò Vấp, Tp Hồ chí Minh', 79);
INSERT into "STORES"(code, name, "isActive", long, lat, address, citycode)
VALUES ('ST00004', 'VinMart', true , 10.864148, 106.318753, '123A Trương Định, Quận 9, Tp Hồ chí Minh', 79);
INSERT into "STORES"(code, name, "isActive", long, lat, address, citycode)
VALUES ('ST00005', 'Halo Halo', true , 10.894248, 106.728753, '12 Hiệp Bình Chánh, Thủ Đức, Tp Hồ chí Minh', 79);
INSERT into "STORES"(code, name, "isActive", long, lat, address, citycode)
VALUES ('ST00006', 'Coopmart', true , 10.884248, 106.738753, '6 Mạc Đĩnh Chi Bến Nghé, Quận 1, Hồ Chí Minh', 79);
INSERT into "STORES"(code, name, "isActive", long, lat, address, citycode)
VALUES ('ST00007', 'Phong Vũ', true , 10.874248, 106.748753, 'Hẻm 47 Trần Quốc Toản Phường 8, Quận 3, Hồ Chí Minh', 79);
INSERT into "STORES"(code, name, "isActive", long, lat, address, citycode)
VALUES ('ST00008', 'Thế giới di động', true , 10.864248, 106.758753, '413 Đ. Lê Văn Sỹ Phường 12, Quận 3, Hồ Chí Minh', 79);
INSERT into "STORES"(code, name, "isActive", long, lat, address, citycode)
VALUES ('ST00009', 'CellphoneS', true , 10.854248, 106.768753, '126 Hoàng Diệu, Thủ Đức, Tp Hồ chí Minh', 79);
