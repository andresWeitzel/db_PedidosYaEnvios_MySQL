/* ---------------------------------
 * ------ PEDIDOS YA ENVIOS---------
 * ---------------------------------
 * 
 * ========= DML INSERTS =============
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

-- Update value according to the sku
update products set value = 5.567
, update_date = @updated_at
where  sku = 'JJUS78A';

-- Update description according to the id
update products set description  = 'Arrolladitos primavera de carne. Relleno de carne vacuna y pollo.'
, update_date = @updated_at
where  id = 2;

-- Update sku, volume, weight, etc according to the id
update products set sku  = 'LLOSPA12'
, volume = 4.200, weight = 4.200
, quantity = 1 , product_type = 'FRAGILE'
, update_date = @updated_at
where  id = 3;


-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------

-- ======= Tabla waypoints ===========


select * from waypoints;
describe waypoints;


-- Update all fieds according to latitute and longitud
update waypoints set waypoint_type = 'PICK_UP'
, address_street = 'Curapaligne 665'
,address_additional = 'Local Locutorio Alberdi, Curapaligne 665, C1406 DAN, Buenos Aires'
, city = 'C.A.B.A'
, phone = '+5491178211829'
, name = 'Juan castro ramirez'
, instructions = 'Local al lado de Cerrajeria 24hs y frente a la Shell'
, creation_date = @created_at
, update_date = @updated_at
where  latitude = '-34.626264' and longitude = '-58.453692';


-- Update all fieds according to id
update waypoints set waypoint_type = 'DROP_OFF'
, address_street = 'Av San justo 1290'
,address_additional = 'Edificio San carlos, entre av. castro barros y ramon primo'
, city = 'C.A.B.A'
, latitude = '-35.45656'
, longitude = '-54.1265567'
, phone = '+54911738298998'
, name = 'Marcos Sanchez'
, instructions = 'Entre Av. Castro Barros y ramon primo'
, creation_date = @created_at
, update_date = @updated_at
where  id = 2;



-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------

-- ======= Tabla routes ===========

select * from routes;
describe routes;

-- update distance according the transport and id
update routes set distance = '15min-1200m'
where id = 1 and transport_type = 'CYCLING';

-- update the transport according distance and id
update routes set transport_type = 'WALKING'
where id = 4 and distance = '45min-6700m';


-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------

-- ======= Tabla routes_pricings ===========

select * from routes;
select * from routes_pricings;
describe routes_pricings;

-- Update all according to the route_id
update routes_pricings set subtotal = 700.82
, taxes = 320.12, total = 1101.22, currency = 'ARS'
, creation_date = @created_at
, update_date = @updated_at
where route_id = 1 and id=1;

-- Update all according to the id
update routes_pricings set subtotal = 1220.00
, taxes = 444.00, total = 1664.00, currency = 'ARS'
, creation_date = @created_at
, update_date = @updated_at
where id = 2;


-- Update with join prices with join
update routes_pricings as rout_pric 
inner join routes as rout
on rout_pric.route_id  = rout.id
set rout_pric.subtotal = 600.99
, rout_pric.total = 1400.99
, rout_pric.update_date = @updated_at
where rout_pric.route_id = 3 and rout.transport_type = 'DRIVING';

-- Update with join add taxes for DRIVING 
update routes_pricings as rout_pric 
inner join routes as rout
on rout_pric.route_id  = rout.id
set rout_pric.taxes = rout_pric.taxes + 23.33 
, rout_pric.total = rout_pric.total + 23.33
, rout_pric.update_date = @updated_at
where rout.transport_type = 'DRIVING';



-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------

-- ======= Tabla delivery_offers ===========

select * from delivery_offers;
describe delivery_offers;

-- Update all fields according to the id
update delivery_offers set 
delivery_offer_id = 'f31533af-4cf0-11ee-8749-704d7b983710kk'
, delivery_mode = 'CROSS_DOCKING'
, estimated_pickup_time = @created_at_thirty_minute_interval
, estimated_driving_time = @created_at_fourty_five_minute_interval
, delivery_time_from = @created_at_one_hour_interval
, delivery_time_to = @created_at_one_hour_thirty_minute_interval
, creation_date = @created_at , update_date = @updated_at
where id = 1;