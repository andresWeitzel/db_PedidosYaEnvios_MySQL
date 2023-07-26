/* ---------------------------------
 * ------ PEDIDOS YA ENVIOS---------
 * ---------------------------------
 * 
 * ========= DML INSERTS =============
 */

-- DATABASE
use db_pedidosyaenvios_mysql;

-- TABLES
delete from products;

-- VARS
SET @created_at = now();
SET @updated_at = now();


-- PRODUCTS : https://www.pedidosya.com.ar/restaurantes/buenos-aires/fabric-caballito-parque-menu?origin=shop_list

insert into products (value, description, sku, volume, weight, quantity
, product_type, creation_date, update_date) values
(4.378, 'NY Phila roll (5 piezas), spring roll (5 piezas) y golden roll (5 piezas).'
,'JJUS78A', 0.5, 0.5 , 1, 'STANDARD', @created_at, @updated_at),
(2.600, 'Arrolladitos primavera de carne. Relleno de carne vacuna.','U3J2221', 0.2, 0.2 
, 2, 'STANDARD', @created_at, @updated_at),
(12.900, '30 Piezas y Vino Fabric Malbec Piezas: 5 NY. phila, 5 spring, 5 dos salmones, 5 tropical, 5 huancainos, 2 niguiri de langostinos, 1 niguiri de salmón, 2 geishas de salmón.'
,'LLOSPA11', 2.0, 2.0 , 1, 'STANDARD', @created_at, @updated_at);


insert into waypoints (waypoint_type, address_street, city, latitude, longitude
, phone, name, instructions, creation_date, update_date) values
('DROP_OFF', 'Locutorio Alberdi, Curapaligüe 62, C1406 DAN, Buenos Aires', 'C.A.B.A'
, '-34.626264', '-58.453692', '+5491178211422', 'Juan Castro', 'Local al lado de Cerrajeria 24hs'
,@created_at, @updated_at),
('PICK_UP', 'McDonalds, Av. Rivadavia 5730, C1406 CABA', 'C.A.B.A'
, '-34.622633', '-58.446133', '+5491178290177', 'Yoselin Martinez', 'Entre Hortiguera y Victor Martinez'
,@created_at, @updated_at),
('DROP_OFF', 'Hotel Real, Yerbal 141, C1405 CABA', 'C.A.B.A'
, '-34.615201', '-58.432563', '+5491187339028', 'Román Peralta', 'Hotel Real 7°B'
,@created_at, @updated_at);

select * from products;
select * from waypoints;


