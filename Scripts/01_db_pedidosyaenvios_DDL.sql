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
drop table if exists routes_pricings;
drop table if exists delivery_offers;
drop table if exists shipping_order;


-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------

-- ======= Tabla products ===========


create table products(
	
id bigint(12) auto_increment primary key,
value decimal(6,3) not null,
description varchar(700) not null,
sku varchar(50) not null,
volume decimal(6,3) not null,
weight decimal(6,3) not null,
quantity int(10) not null,
product_type enum('STANDARD','FRAGILE','COLD') default 'STANDARD',
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

-- CHECK VALUE
alter table products
add constraint CHECK_products_value
check (value > 0.000);

-- CHECK VOLUME_WEIGHT
alter table products
add constraint CHECK_products_volume_weight
check (volume > 0.000 and weight > 0.000);

-- CHECK UPDATE_DATE
alter table products
add constraint CHECK_products_update_date
check (update_date >= creation_date);


-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------

-- ======= Tabla waypoints ===========


create table waypoints(
	
id bigint(12) auto_increment primary key,
waypoint_type enum('PICK_UP','DROP_OFF') not null,
address_street varchar(300) not null,
address_additional varchar(300) not null,
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



-- CHECK UPDATE_DATE
alter table waypoints
add constraint CHECK_waypoints_update_date
check (update_date >= creation_date);



-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------

-- ======= Tabla routes ===========


create table routes(
	
id bigint(12) auto_increment primary key,
distance varchar(20) not null,
transport_type enum ('DRIVING','TRANSIT','WALKING','CYCLING') default 'WALKING',
creation_date datetime not null,
update_date datetime not null
);

-- ======= Restricciones Tabla routes ===========

-- UNIQUE ID
alter table routes 
add constraint UNIQUE_routes_id
unique(id);


-- CHECK UPDATE_DATE
alter table routes
add constraint CHECK_routes_update_date
check (update_date >= creation_date);


-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------

-- ======= Tabla routes_pricings ===========


create table routes_pricings(
	
id bigint(12) auto_increment primary key,
route_id bigint(12) not null,
subtotal decimal(6,2) not null,
taxes decimal(6,2) not null,
total decimal(6,2) not null,
currency varchar(50) not null,
creation_date datetime not null,
update_date datetime not null
);

-- ======= Restricciones Tabla routes_pricings ===========

-- UNIQUE ID
alter table routes_pricings 
add constraint UNIQUE_routes_pricings_id
unique(id);

-- FK ROUTES
alter table routes_pricings 
add constraint FK_routes_pricings_route_id 
foreign key(route_id)
references routes(id)
on update cascade on delete cascade;

-- CHECK SUBTOTAL_TAXES_TOTAL_DISTANCE
alter table routes_pricings 
add constraint CHECK_subtotal_taxes_total_distance
check(subtotal >=0 and taxes >=0 and total >=0 and distance >= 0);


-- CHECK UPDATE_DATE
alter table routes_pricings
add constraint CHECK_routes_pricings_update_date
check (update_date >= creation_date);


-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------

-- ======= Tabla delivery_offers ===========


create table delivery_offers(
	
id bigint(12) auto_increment primary key,
waypoint_id bigint not null,
delivery_offer_id varchar(255) not null,
delivery_mode enum ('CROSS_DOCKING', 'EXPRESS', 'SCHEDULE') default 'EXPRESS',
estimated_pickup_time varchar(100) not null,
estimated_driving_time varchar(100) not null,
delivery_time_from varchar(100) not null,
delivery_time_to varchar(100) not null,
creation_date datetime not null,
update_date datetime not null
);

-- ======= Restricciones Tabla delivery_offers ===========

-- UNIQUE ID
alter table delivery_offers 
add constraint UNIQUE_delivery_offers_id
unique(id);

-- FK WAYPOINT
alter table delivery_offers 
add constraint FK_delivery_offers_waypoint_id 
foreign key(waypoint_id)
references waypoints(id)
on update cascade on delete cascade;



-- CHECK DELIVERY_TIME
alter table delivery_offers 
add constraint CHECK_delivery_offers_delivery_time
check(delivery_time_from != delivery_time_to);


-- CHECK UPDATE_DATE
alter table delivery_offers
add constraint CHECK_delivery_offers_update_date
check (update_date >= creation_date);


-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------

-- ======= Tabla shipping_order ===========

CREATE TABLE shipping_order(

id bigint(12) auto_increment PRIMARY KEY,
product_id bigint not NULL,
route_pricing_id bigint NOT null, 
delivery_offer_id bigint NOT null,
shipping_id varchar(255) not NULL,
confirmation_code varchar(255) not NULL,
reference_id varchar(255) not NULL,
status enum ('CONFIRMED', 'CANCELLED') DEFAULT 'CONFIRMED',
share_location_url varchar(255) not NULL,
notification_mail varchar(255) not NULL,
online_support_url varchar(255) not NULL
);

-- ======= Restricciones Tabla shipping_order ===========

-- UNIQUE ID
alter table shipping_order 
add constraint UNIQUE_shipping_order_id
unique(id);

-- FK PRODUCT_ID
alter table shipping_order 
add constraint FK_shipping_order_product_id 
foreign key(product_id)
references products(id)
on update cascade on delete cascade;

-- FK ROUTE_PRICING_ID
alter table shipping_order 
add constraint FK_shipping_order_route_pricing_id 
foreign key(route_pricing_id)
references routes_pricings(id)
on update cascade on delete cascade;

-- FK DELIVERY_OFFER_ID
alter table shipping_order 
add constraint FK_shipping_order_delivery_offer_id 
foreign key(delivery_offer_id)
references delivery_offers(id)
on update cascade on delete cascade;