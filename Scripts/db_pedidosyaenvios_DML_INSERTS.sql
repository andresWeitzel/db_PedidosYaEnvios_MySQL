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
,'JJUS78A', 0.5, 0.5 , 1, 'STANDARD', @created_at, @updated_at);


select * from products p ;

