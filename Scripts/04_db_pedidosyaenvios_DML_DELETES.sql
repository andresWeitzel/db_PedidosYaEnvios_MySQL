/* ---------------------------------
 * ------ PEDIDOS YA ENVIOS---------
 * ---------------------------------
 * 
 * ========= DML DELETES =============
 */


-- DATABASE
use db_pedidosyaenvios_mysql;


-- VARS
set @created_at = now();
set @updated_at = now();
set @created_at_five_minute_interval = DATE_ADD(NOW(), INTERVAL 5 minute);
set @created_at_ten_minute_interval = DATE_ADD(NOW(), INTERVAL 10 minute);
set @created_at_twenty_minute_interval = DATE_ADD(NOW(), INTERVAL 20 minute);
set @created_at_thirty_minute_interval = DATE_ADD(NOW(), INTERVAL 30 minute);
set @created_at_fourty_five_minute_interval = DATE_ADD(NOW(), INTERVAL 45 minute);
set @created_at_one_hour_interval = DATE_ADD(NOW(), INTERVAL 1 hour);
set @created_at_one_hour_thirty_minute_interval = DATE_ADD(NOW(), INTERVAL 90 minute);
set @created_at_two_hour_interval = DATE_ADD(NOW(), INTERVAL 2 hour);

-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------

-- ======= Tabla products ===========

select * from products;
describe products;

delete from products where sku="WS7S9ASK2IJ";


insert into products (value, description, sku, volume, weight, quantity
, product_type, creation_date, update_date) values
(6.700, "Combo hamburguesa clasica con fritas"
,'OPS98WWSJJ22', 3.00, 3.00 , 1, 'STANDARD', @created_at, @updated_at),
(3.400, "6 empanadas de pollo y carne mixto"
,'33DYUE777SSS', 2.200, 2.200 , 1, 'STANDARD', @created_at, @updated_at);


-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------

-- ======= Tabla waypoints ===========


select * from waypoints;
describe waypoints;

delete from waypoints where id = 2;


insert into waypoints (waypoint_type, address_street, address_additional, city, latitude, longitude
, phone, name, instructions, creation_date, update_date) values
('DROP_OFF', 'Av San justo 221', 'Edificio San carlos', 'C.A.B.A'
, '-35.45633', '-54.126135', '+54911738298291', 'Marcos Gutierrez', '-'
,@created_at, @updated_at),
('PICK_UP', 'Av. Martin Giles 3456, B2221ADO CABA', 'Rotisería Gusto Dulce', 'C.A.B.A'
, '-32.832236', '-71.923184', '+5491167389928', 'Laura', '-'
,@created_at, @updated_at);


-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------

-- ======= Tabla routes ===========

select * from routes;
describe routes;


delete from routes where id = 11 and transport_type ='WALKING';

insert into routes (distance, transport_type, creation_date, update_date ) values 
('25min-11000m', 'CYCLING' ,@created_at, @updated_at),
('2min-200m', 'WALKING',  @created_at, @updated_at);



-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------

-- ======= Tabla routes_pricings ===========

select * from routes;
select * from routes_pricings;
describe routes_pricings;