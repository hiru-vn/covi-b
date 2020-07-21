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

Update "CITY" set "infectedCount" = 0;
Update "CITY" set "infectedLevel" = 0;
update "USERS" set "isInfected" = false;
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