/* ---------------------------------
 * ------ PEDIDOS YA ENVIOS---------
 * ---------------------------------
 * 
 * ========= DDL =============
 */

-- DATABASE
drop database if exists db_pedidosyaenvios_mysql;

create database db_pedidosyaenvios_mysql;

use db_pedidosyaenvios_mysql;


-- TABLES
drop table if exists products;
drop table if exists waypoints;
drop table if exists routes;
drop table if exists shippins;


-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------

-- ======= Tabla products ===========


create table products(
	
id int(12) auto_increment primary key,
value int(10) not null,
description varchar(400) not null,
sku varchar(10) not null,
volume int(10) not null,
weight int(10) not null,
quantity int(10) not null,
product_type varchar(20) not null,
creation_date datetime not null,
update_date datetime not null
);

-- ======= Restricciones Tabla products ===========

-- UNIQUE ID
alter table products 
add constraint UNIQUE_products_id
unique(id);


-- UNIQUE DESCRIPTION_SKU
alter table products 
add constraint UNIQUE_products_description_sku
unique(description, sku);


-- CHECK UPDATE_DATE
alter table products
add constraint CHECK_products_update_date
check (update_date >= creation_date);



-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------


-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------

-- ======= Tabla waypoints ===========


create table waypoints(
	
id int(12) auto_increment primary key,
waypoint_type varchar(50) not null,
address_street varchar(100) not null,
city varchar(30) not null,
latitude varchar(100) not null,
longitude varchar(100) not null,
phone varchar(50) not null,
name varchar(50) not null,
instructions varchar(200) not null,
creation_date datetime not null,
update_date datetime not null
);

-- ======= Restricciones Tabla waypoints ===========

-- UNIQUE ID
alter table waypoints 
add constraint UNIQUE_waypoints_id
unique(id);


-- UNIQUE ADDRESS_NAME
alter table waypoints 
add constraint UNIQUE_waypoints_address_name
unique(address_street, name);


-- CHECK UPDATE_DATE
alter table waypoints
add constraint CHECK_waypoints_update_date
check (update_date >= creation_date);



-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------
