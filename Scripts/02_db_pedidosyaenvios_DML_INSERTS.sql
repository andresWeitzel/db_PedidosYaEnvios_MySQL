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
delete from waypoints;
delete from routes;
delete from routes_pricings;
delete from delivery_offers;
delete from shipping_order;

-- AUTO_INCREMENT
alter table products auto_increment 1;
alter table waypoints auto_increment 1;
alter table routes auto_increment 1;
alter table routes_pricings auto_increment 1;
alter table delivery_offers auto_increment 1;
alter table shipping_order auto_increment 1;

-- VARS
set @created_at = now();
set @updated_at = now();
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

insert into products (value, description, sku, volume, weight, quantity
, product_type, creation_date, update_date) values
(4.378, "NY Phila roll (5 piezas), spring roll (5 piezas) y golden roll (5 piezas)."
,'JJUS78A3332', 1.892, 1.892 , 1, 'STANDARD', @created_at, @updated_at),
(2.600, "Arrolladitos primavera de carne. Relleno de carne vacuna.",'U3J2221KIO2', 0.2, 0.2 
, 2, 'STANDARD', @created_at, @updated_at),
(12.900, "30 Piezas y Vino Fabric Malbec Piezas: 5 NY. phila, 5 spring, 5 dos salmones, 5 tropical, 5 huancainos, 2 niguiri de langostinos, 1 niguiri de salm?n, 2 geishas de salmon."
,'LLOSPA11LO3P', 3.789, 3.789 , 1, 'FRAGILE', @created_at, @updated_at),
(6.970, "Combo 2 hamburguesas doble queso y 1 Brahma 1L"
,'ALO1221SY2TG3', 2.788, 2.788 , 1, 'STANDARD', @created_at, @updated_at),
(9.760, "2 Packs IPA Artesanales"
,'POS1124D22J7', 4.994, 4.994 , 2, 'COLD', @created_at, @updated_at),
(4.699, "Combo Smirnoff Frambuesa x2"
,'IWU7SSA133K9', 3.0, 3.0 , 2, 'COLD', @created_at, @updated_at),
(1.578, "Multipack X3 unidades de palito helado Kit Kat"
,'POSDD812LOD9', 2.2, 2.2 , 1, 'COLD', @created_at, @updated_at),
(1.620, "Sandwich Bolognesa - Pan de campo relleno con asadito argentino, queso dambo y tomate"
,'SSA8Q99YSTG6', 1.1, 1.1 , 1, 'STANDARD', @created_at, @updated_at),
(4.560, "Sandwich Criollo - Pan baguete relleno de Porchetta, chedar, cherrys y jamon"
,'LOSAP123312', 1.2, 1.2 , 3, 'STANDARD', @created_at, @updated_at),
(19.100, "Luigis grande - Comen 4 pican 8 - pata cocida - Bondiola con pimienta y Lomo asado"
,'WS7S8AAH2H1', 4.89, 4.89 , 1, 'STANDARD', @created_at, @updated_at),
(14.600, "Mediterranea chica - Comen 2 pican 4 - Bondiola cerrana - crudo tipo ib?rico"
,'WS7S9ASK2IJ', 2.3, 2.3 , 1, 'STANDARD', @created_at, @updated_at);


select * from products;
describe products;

-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------

-- ======= Tabla waypoints ===========

insert into waypoints (waypoint_type, address_street, address_additional, city, latitude, longitude
, phone, name, instructions, creation_date, update_date) values
('DROP_OFF', 'Curapalig?e 62' ,'Locutorio Alberdi, Curapalig?e 62, C1406 DAN, Buenos Aires', 'C.A.B.A'
, '-34.626264', '-58.453692', '+5491178211422', 'Juan Castro', 'Local al lado de Cerrajeria 24hs'
,@created_at, @updated_at),
('DROP_OFF', 'Av San justo 221', 'Edificio San carlos', 'C.A.B.A'
, '-35.45633', '-54.126135', '+54911738298291', 'Marcos Gutierrez', '-'
,@created_at, @updated_at),
('DROP_OFF', 'Yerbal 141' , 'Hotel Real, Yerbal 141, C1405 CABA', 'C.A.B.A'
, '-34.615201', '-58.432563', '+5491187339028', 'Rom?n Peralta', 'Hotel Real 7?B'
,@created_at, @updated_at),
('PICK_UP', 'Av. Rivadavia 5730','McDonalds, Av. Rivadavia 5730, C1406 CABA', 'C.A.B.A'
, '-34.622633', '-58.446133', '+5491178290177', 'Yoselin Martinez', 'Entre Hortiguera y Victor Martinez'
,@created_at, @updated_at),
('PICK_UP', 'Puerto azul 029', 'Casona maldonado' , 'San Justo - Provincia'
, '-32.998312', '-67.838822', '+5491162719902', 'Jeremias', 'Casa porton negro PB'
,@created_at, @updated_at),
('PICK_UP', 'San pedrito 89', 'Supermecado shin shuan 2 - San pedrito 89', 'C.A.B.A'
, '-34.615201', '-58.432563', '+5491192012223', 'Lei shu', 'Lei shu'
,@created_at, @updated_at),
('DROP_OFF', 'Av. Córdoba 213', 'Edificio castelar 4I', 'C.A.B.A'
, '-31.621234', '-56.212331', '+5491178938837', 'Marcos', 'Marcos'
,@created_at, @updated_at),
('PICK_UP', 'Av. Castro Barros 4590, B1648 Tigre, Provincia de Buenos Aires', 'Luigi?s Tigre', 'Provincia de Bs as'
, '-33.819233', '-64.920182', '+5491187831123', 'Julieta Perez', 'Luigi?s picadas & sandwichs - tigre'
,@created_at, @updated_at),
('PICK_UP', 'Av. Caz?n 310, B1648 Tigre, Provincia de Buenos Aires', 'Luigi?s Tigre', 'Provincia de Bs as'
, '-33.819233', '-64.920182', '+5491187831123', 'Sofía', 'Luigi?s picadas & sandwichs - tigre'
,@created_at, @updated_at),
('DROP_OFF', 'Av. Pedro Goyena 1515, Buenos Aires', 'Rapa Nui', 'C.A.B.A'
, '-37.772812', '-71.99238123', '+5491187662922', 'Carlos Gonzalez', 'Rapanui'
,@created_at, @updated_at),
('PICK_UP', 'Av. Independencia 1912, C1225AAO CABA', 'Panaderia Italiana La Pompeya', 'C.A.B.A'
, '-36.822233', '-72.920182', '+5491188227722', 'Gustavo', 'Panadería la italiana'
,@created_at, @updated_at);


select * from waypoints;
describe waypoints;

-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------

-- ======= Tabla routes ===========


insert into routes (distance, transport_type, creation_date, update_date ) values 
('10min-600m', 'CYCLING' ,@created_at, @updated_at),
('35min-3000m', 'WALKING',  @created_at, @updated_at),
('15min-4500m', 'DRIVING',  @created_at, @updated_at),
('45min-6700m', 'TRANSIT',  @created_at, @updated_at),
('5min-200m', 'WALKING',  @created_at, @updated_at),
('12min-780m', 'CYCLING',  @created_at, @updated_at),
('25min-6500m', 'DRIVING',  @created_at, @updated_at),
('45min-13K', 'DRIVING',  @created_at, @updated_at),
('32min-9K', 'TRANSIT',  @created_at, @updated_at),
('38min-11K', 'TRANSIT',  @created_at, @updated_at),
('2min-200m', 'WALKING',  @created_at, @updated_at);


select * from routes;
describe routes;

-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------

-- ======= Tabla routes_pricings ===========

insert into routes_pricings (route_id, subtotal, taxes, total, currency
, creation_date, update_date) values
(1, 600.00, 300.00, 900.00, "ARS", @created_at, @updated_at),
(2, 1100.00, 500.00, 1600.00, "ARS", @created_at, @updated_at),
(3, 400.00, 800.00, 1200.00, "ARS", @created_at, @updated_at),
(4, 860.00, 600.00, 1460.00, "ARS", @created_at, @updated_at),
(5, 1250.00, 450.00, 1460.00, "ARS", @created_at, @updated_at),
(6, 1420.00, 510.00, 1930.00, "ARS", @created_at, @updated_at),
(7, 1450.00, 680.00, 2167.00, "ARS", @created_at, @updated_at),
(8, 1750.00, 500.00, 2250.00, "ARS", @created_at, @updated_at),
(9, 1620.00, 810.00, 2430.00, "ARS", @created_at, @updated_at),
(10, 1463.00, 1317.00, 2780.00, "ARS", @created_at, @updated_at),
(11, 500.00, 100.00, 700.00, "ARS", @created_at, @updated_at);


select * from routes_pricings;
describe routes_pricings;

-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------

-- ======= Tabla delivery_offers ===========

insert into delivery_offers (waypoint_id, delivery_offer_id
, delivery_mode, estimated_pickup_time, estimated_driving_time
,delivery_time_from, delivery_time_to, creation_date, update_date ) values 
(1, uuid(), 'EXPRESS', @created_at_twenty_minute_interval 
, @created_at_ten_minute_interval , @created_at, @created_at_thirty_minute_interval
, @created_at, @updated_at),
(2, uuid(), 'CROSS_DOCKING', @created_at_fourty_five_minute_interval 
, @created_at_thirty_minute_interval , @created_at, @created_at_thirty_minute_interval
, @created_at, @updated_at),
(3, uuid(), 'SCHEDULE', @created_at_one_hour_thirty_minute_interval 
, @created_at_fourty_five_minute_interval , @created_at, @created_at_two_hour_interval
, @created_at, @updated_at),
(4, uuid(), 'EXPRESS', @created_at_ten_minute_interval 
, @created_at_twenty_minute_interval , @created_at, @created_at_thirty_minute_interval
, @created_at, @updated_at),
(5, uuid(), 'CROSS_DOCKING', @created_at_thirty_minute_interval 
, @created_at_fourty_five_minute_interval , @created_at, @created_at_thirty_minute_interval
, @created_at, @updated_at);

select * from delivery_offers;
describe delivery_offers;

-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------

-- ======= Tabla shipping_order ===========

insert into shipping_order ( product_id, route_pricing_id, delivery_offer_id
, shipping_id, confirmation_code, reference_id, status, share_location_url
, notification_mail, online_support_url ) values
(1, 1, 1, uuid(), uuid(), uuid(), 'CONFIRMED', 'https://goo.gl/maps/KeHeaXVwrPi2cFJ19'
, 'pedidosya_notification_order@gmail.com', 'https://bienvenida.pedidosya.com/help.html'),
(2, 2, 2, uuid(), uuid(), uuid(), 'CANCELLED', 'https://goo.gl/maps/KeHeaXVwrPi2caJd0'
, 'pedidosya_notification_order', 'https://bienvenida.pedidosya.com/help.html'),
(3, 3, 3, uuid(), uuid(), uuid(), 'CONFIRMED', 'https://goo.gl/maps/bajksdbJ36612'
, 'pedidosya_notification_order', 'https://bienvenida.pedidosya.com/help.html');

select * from shipping_order;
describe shipping_order;

