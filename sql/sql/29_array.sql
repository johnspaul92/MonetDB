-- The contents of this file are subject to the MonetDB Public License
-- Version 1.1 (the "License"); you may not use this file except in
-- compliance with the License. You may obtain a copy of the License at
-- http://www.monetdb.org/Legal/MonetDBLicense
--
-- Software distributed under the License is distributed on an "AS IS"
-- basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See the
-- License for the specific language governing rights and limitations
-- under the License.
--
-- The Original Code is the MonetDB Database System.
--
-- The Initial Developer of the Original Code is CWI.
-- Copyright August 2008-2011 MonetDB B.V.
-- All Rights Reserved.

-- Vacuum a relational table should be done with care.
-- For, the oid's are used in join-indices.

-- Vacuum of tables may improve IO performance and disk footprint.
-- The foreign key constraints should be dropped before
-- and re-established after the cluster operation.

-- TODO: DATE, TIME, TIMESTAMP, CHAR and VARCHAR not supported yet
-- TODO: should we deal with TINYINT, SMALLINT separately?
create function array_series("start" integer, step integer, stop integer, N integer, M integer) returns table (dim integer)
	external name "array".series;
create function array_series("start" bigint, step bigint, stop bigint, N integer, M integer) returns table (dim bigint)
	external name "array".series;
create function array_series("start" float, step float, stop float, N integer, M integer) returns table (dim float)
	external name "array".series;

create function array_filler(cnt oid, val integer) returns table (vals integer)
	external name "array".filler;
create function array_filler(cnt oid, val bigint) returns table (vals bigint)
	external name "array".filler;
create function array_filler(cnt oid, val float) returns table (vals float)
	external name "array".filler;
create function array_filler(cnt oid, val date) returns table (vals date)
	external name "array".filler;
create function array_filler(cnt oid, val time) returns table (vals time)
	external name "array".filler;
create function array_filler(cnt oid, val timestamp) returns table (vals timestamp)
	external name "array".filler;
create function array_filler(cnt oid, val char(1024)) returns table (vals char(1024))
	external name "array".filler;
create function array_filler(cnt oid, val varchar(1024)) returns table (vals varchar(1024))
	external name "array".filler;

