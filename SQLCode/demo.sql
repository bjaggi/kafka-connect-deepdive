# This code is for MySql DB Only, if you choose to test this with out CDC
#  We are simulating the person table to be present in all three databases, so you can test the  data flow/filtering


truncate sqlserver.person;
truncate oracle.person;
truncate postgres.person;

create table sqlserver.person (
payment_id VARCHAR(10)  PRIMARY KEY,
 	dw_bu_id text not null,
    origin text ,
    insert_timestamp TIMESTAMP ,
 	update_timestamp TIMESTAMP
);

create table oracle.person (
payment_id VARCHAR(10)  PRIMARY KEY,
 	dw_bu_id text not null,
    origin text ,
    insert_timestamp TIMESTAMP ,
 	update_timestamp TIMESTAMP
);

create table postgres.person (
payment_id VARCHAR(10)  PRIMARY KEY,
 	dw_bu_id text not null,
    origin text ,
    insert_timestamp TIMESTAMP ,
 	update_timestamp TIMESTAMP
);



#select * from postgres.person order by insert_timestamp desc;

# to view rows count for all tables
select 'postgress' table_name, count(*) count from postgres.person 
union all 
select 'oracle' table_name, count(*) as oracle_count from oracle.person 
union all 
select 'sql server' table_name,  count(*) as sqlserver_count from sqlserver.person 

# 
insert into postgres.person  values ('Payment#1', 'uuid-pgsql-1' , 'postgresql', now(), now());
insert into postgres.person  values ('Payment#2', 'uuid-pgsql-2' , 'postgresql', now(), now());
insert into postgres.person  values ('Payment#7', 'uuid-pgsql-4' , 'postgresql', now(), now());
insert into postgres.person  values ('Payment#3', 'uuid-pgsql-3' , 'postgresql', now(), now());


insert into oracle.person  values ('Payment#3', 'uuid-oracle-1' , 'oracle', now(), now());
insert into oracle.person  values ('Payment#4', 'uuid-oracle-2' , 'oracle', now(), now());
#select * from oracle.person order by insert_timestamp desc;


insert into sqlserver.person  values ('Payment#5', 'uuid-sqlserver-1' , 'sqlserver', now(), now());
insert into sqlserver.person  values ('Payment#6', 'uuid-sqlserver-2' , 'sqlserver', now(), now());
insert into sqlserver.person  values ('Payment#8', 'uuid-sqlserver-3' , 'sqlserver', now(), now());
insert into sqlserver.person  values ('Payment#9', 'uuid-sqlserver-4' , 'sqlserver', now(), now());
insert into sqlserver.person  values ('Payment#10', 'uuid-sqlserver-5' , 'sqlserver', now(), now());
insert into sqlserver.person  values ('Payment#11', 'uuid-sqlserver-6' , 'sqlserver', now(), now());
insert into sqlserver.person  values ('Payment#12', 'uuid-sqlserver-7' , 'sqlserver', now(), now());


commit;

