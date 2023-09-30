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


select * from routes_pricings;
describe routes_pricings;


