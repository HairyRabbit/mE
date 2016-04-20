-- Create tables

BEGIN;

CREATE TABLE post
(
  id		uuid		PRIMARY KEY DEFAULT uuid_generate_v1(),
  title		varchar(20)   	NOT NULL DEFAULT '',
  datetime	date   		NOT NULL DEFAULT current_date,
  istop		boolean    	NOT NULL DEFAULT false,
  intro		text		NOT NULL DEFAULT '',
  filepath	varchar(100)	NOT NULL DEFAULT ''
);


COMMIT;
