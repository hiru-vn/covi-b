CREATE OR REPLACE FUNCTION queryINFECTEDCOORDINATE(inputId integer)
returns table (
"id" int,
"user1id" int,
"user2id" int,
"storeid" int,
"user1infectlevel" int,
"user2infectlevel" int,
"long" real,
"lat" real,
"date" varchar,
"citycode" int,
"address" varchar
) AS $$
DECLARE
r int;
BEGIN
	r := (select "transmissionLevel" from "USERS" as z where z.id = $1);
	return QUERY (select * from "INFECTEDCOORDINATE" as t 
				  where (t."user1id" = $1 and t."user1infectlevel" = r ) 
				  or (t."user2id" = $1 and t."user2infectlevel" = r ));
END
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION updateUserRiskFunc()
RETURNS trigger AS $$
DECLARE
r int;
s int;
z int;
long real;
lat real;
citycode int;
address varchar;
dateT varchar;
BEGIN
if (NEW."transmissionLevel") < 5 then
raise notice 'flag 1';
FOR r IN
SELECT DISTINCT storeid from "USERSTORE" where userid = NEW.id
LOOP
raise notice 'flag 2';
FOR s IN
SELECT DISTINCT userid from "USERSTORE"
where storeid = r and userid != NEW.id
LOOP
raise notice 'flag 3';
UPDATE "USERS"
set "transmissionLevel" = NEW."transmissionLevel" + 1
where id = s and (
"transmissionLevel" >= NEW."transmissionLevel"
or "transmissionLevel" is null
);
z := (SELECT count(*) from "INFECTEDCOORDINATE"
	  where user1id = NEW.id and user2id = s and storeid = r );
address := (select store.address from "STORES" as store where store.id = r);
long := (select store.long from "STORES" as store where store.id = r);
lat := (select store.lat from "STORES" as store where store.id = r);
citycode := (select store.citycode from "STORES" as store where store.id = r);
dateT := (select store.timein from "USERSTORE" as store where store.id = 1  limit 1);
if z = 0 then
INSERT INTO "INFECTEDCOORDINATE"
("user1id", "user2id", "storeid", "user1infectlevel",
 "user2infectlevel", "long" , "lat" , "citycode" , "address", "date")
VALUES(NEW.id, s, r, NEW."transmissionLevel", NEW."transmissionLevel" + 1,
	long, lat, citycode, address, dateT);
END IF;
END LOOP;
END LOOP;
end if;
RETURN NEW;
END
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS updateUserRiskTrig ON "USERS";

CREATE TRIGGER updateUserRiskTrig AFTER UPDATE ON "USERS"
FOR EACH ROW
-- WHEN (NEW."transmissionLevel" = null or NEW."transmissionLevel" < OLD."transmissionLevel")
EXECUTE PROCEDURE updateUserRiskFunc();

CREATE OR REPLACE FUNCTION markInfectedFunc()
RETURNS trigger AS $$
DECLARE
BEGIN
UPDATE "USERS" set "transmissionLevel" = 0 where id = OLD.id;
Update "CITY" set "infectedCount" =  "infectedCount"+1 WHERE id = NEW.citycode;
RETURN NEW;
END
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION unMarkInfectedTrig()
RETURNS trigger AS $$
DECLARE
BEGIN
UPDATE "USERS" set "transmissionLevel" = null where id = OLD.id;
Update "CITY" set "infectedCount" =  "infectedCount"-1 WHERE id = NEW.citycode;
RETURN NEW;
END
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS markInfectedTrig ON "USERS";
DROP TRIGGER IF EXISTS unMarkInfectedTrig ON "USERS";

CREATE TRIGGER markInfectedTrig AFTER UPDATE ON "USERS"
FOR EACH ROW
WHEN (NEW."isInfected" != OLD."isInfected" and NEW."isInfected" = true)
EXECUTE PROCEDURE markInfectedFunc();

CREATE TRIGGER unMarkInfectedTrig AFTER UPDATE ON "USERS"
FOR EACH ROW
WHEN (NEW."isInfected" != OLD."isInfected" and NEW."isInfected" = false)
EXECUTE PROCEDURE unMarkInfectedTrig();

CREATE OR REPLACE FUNCTION updateCityInfectedLevelFunc()
RETURNS trigger AS $$
DECLARE
BEGIN
IF (NEW."infectedCount" = 0) then
	Update "CITY" set "infectedLevel" = 0 WHERE id = NEW.id;
end if;
IF (NEW."infectedCount" >= 1) then
	Update "CITY" set "infectedLevel" = 1 WHERE id = NEW.id;
end if;
IF (NEW."infectedCount" >= 5) then
	Update "CITY" set "infectedLevel" = 2 WHERE id = NEW.id;
end if;
IF (NEW."infectedCount" >= 20) then
	Update "CITY" set "infectedLevel" = 3 WHERE id = NEW.id;
end if;
IF (NEW."infectedCount" >= 100) then
	Update "CITY" set "infectedLevel" = 4 WHERE id = NEW.id;
end if;
IF (NEW."infectedCount" >= 500) then
	Update "CITY" set "infectedLevel" = 5 WHERE id = NEW.id;
end if;
RETURN NEW;
END
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS updateCityInfectedLevelTrig ON "CITY";

CREATE TRIGGER updateCityInfectedLevelTrig AFTER UPDATE ON "CITY"
FOR EACH ROW WHEN (NEW."infectedCount" != OLD."infectedCount")
EXECUTE PROCEDURE updateCityInfectedLevelFunc();