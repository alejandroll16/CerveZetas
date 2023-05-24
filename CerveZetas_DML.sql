INSERT INTO CerveZetas_Marca (codigo, foto, nombre) values (001, 'https://i.ibb.co/N64CksJ/beer1.png' ,'Desesperado');
INSERT INTO CerveZetas_Marca (codigo, foto, nombre) values (002, 'https://i.ibb.co/2YZ84n4/beer6.png', 'Koronao');
INSERT INTO CerveZetas_Marca (codigo, foto, nombre) values (003, 'https://i.ibb.co/T2h8BsW/beer2.png', 'CruzCiudad');
INSERT INTO CerveZetas_Marca (codigo, foto, nombre) values (004, 'https://i.ibb.co/6DHr5ns/beer3.png', 'Cervezas Alabhama');
INSERT INTO CerveZetas_Marca (codigo, foto, nombre) values (005, 'https://i.ibb.co/PtJ9VdS/beer4.png', 'Paula-Ven');
INSERT INTO CerveZetas_Marca (codigo, foto, nombre) values (006, 'https://i.ibb.co/KqFgtQV/beer5.png', 'CashVerg');



/*Actualizar abajo Mario -> Cliente*/
/*Tabla Usuar@*/



INSERT INTO CerveZetas_Usuario (email, nombre, apellidos, contrasena, telefono, ultima_conexion, fecha_nacimiento, foto, tipo_usuarios, metodo_pago) 
values ('pabloverdu@admin.es', 'Pablo', 'Verdu', 'Holamundo111', 600000001, SYSDATE, TO_DATE('31/12/2001', 'DD/MM/YYYY'), 'https://i.ibb.co/Km5dJ6L/pv.png', 'Admin','Tarjeta');

INSERT INTO CerveZetas_Usuario (email, nombre, apellidos, contrasena, telefono, ultima_conexion, fecha_nacimiento, foto, tipo_usuarios, metodo_pago) 
values ('mario@gmail.com', 'Mario', 'Martínez', 'Holamundo112', 600000002, SYSDATE, TO_DATE('16/12/2001', 'DD/MM/YYYY'), 'https://i.ibb.co/Zh6z8M2/M.png', 'Admin', 'PayPal');

INSERT INTO CerveZetas_Usuario (email, nombre, apellidos, contrasena, telefono, ultima_conexion, fecha_nacimiento, foto, tipo_usuarios, metodo_pago) 
values ('pablon@gmail.com', 'Pablo', 'Navarro', 'Holamundo113', 600000003, SYSDATE, TO_DATE('12/07/2001', 'DD/MM/YYYY'), 'https://i.ibb.co/Z6xtnn9/pn.png', 'Cliente', 'Tarjeta');

INSERT INTO CerveZetas_Usuario (email, nombre, apellidos, contrasena, telefono, ultima_conexion, fecha_nacimiento, foto, tipo_usuarios, metodo_pago) 
values ('pablob@gmail.com', 'Pablo', 'Beltrán', 'Holamundo114', 600000004, SYSDATE, TO_DATE('03/05/2001', 'DD/MM/YYYY'), 'https://i.ibb.co/my84J5v/pb.png', 'Visitante','PayPal');



/*Tabla Producto*/



INSERT INTO CerveZetas_Producto (cod_producto, stock, descripcion, admin_crea, admin_modifica, fecha_mod, fecha_creacion, Categoria, precio, TipoProducto, marca) 
values (1, 60, 'Happy Holidays', 'pabloverdu@admin.es', 'pabloverdu@admin.es', SYSDATE, SYSDATE, 'Rubia', 20.75, 'Pack_Especial', 001);

INSERT INTO CerveZetas_Producto (cod_producto, stock, descripcion, admin_crea, admin_modifica, fecha_mod, fecha_creacion, Categoria, precio, TipoProducto, marca) 
values (2, 70, 'Sant Patrick`s', 'pabloverdu@admin.es', 'pabloverdu@admin.es', SYSDATE, SYSDATE, 'Malta', 14.23, 'Pack_Eventual', 002);

/*Cambiar admin_modifica por pabloverdu@admin.es*/

INSERT INTO CerveZetas_Producto (cod_producto, stock, descripcion, admin_crea, admin_modifica, fecha_mod, fecha_creacion, Categoria, precio, TipoProducto, marca) 
values (3, 80, 'Fin de Examenes', 'pabloverdu@admin.es', 'pablob@gmail.com', SYSDATE, SYSDATE, 'Rubia', 5.25, 'Cubos', 003);

INSERT INTO CerveZetas_Producto (cod_producto, stock, descripcion, admin_crea, admin_modifica, fecha_mod, fecha_creacion, Categoria, precio, TipoProducto, marca) 
values (4, 200, 'Cerveza dignidad','pabloverdu@admin.es', 'pabloverdu@admin.es', SYSDATE, SYSDATE, 'Tostada', 2.5, 'Cervezas',005);



/*Tabla Dirección*/
/*Cambiar en Mario Elda -> Petrer y el codigo postal*/



INSERT INTO CerveZetas_Direccion (codigo_direccion, email_usuario, numero, Municipio, CodigoPostal, provincia, tipoVia, TipoDireccion, nombre) 
values (1, 'mario@gmail.com', 12, 'Elda', 03600, 'Alicante', 'Calle', 'Casa', 'García Vaquero');

INSERT INTO CerveZetas_Direccion (codigo_direccion, email_usuario, numero, Municipio, CodigoPostal, provincia, tipoVia, TipoDireccion, nombre)
values (2, 'pablon@gmail.com', 13, 'Elda', 03600, 'Alicante', 'Avenida', 'Casa', 'Fray Luis de Granada');

INSERT INTO CerveZetas_Direccion (codigo_direccion, email_usuario, numero, Municipio, CodigoPostal, provincia, tipoVia, TipoDireccion, nombre)
values (3, 'pablob@gmail.com', 14, 'Petrer', 03610, 'Alicante', 'Plaza', 'Trabajo', 'de la Constitución');


/*Tabla Pedido*/


INSERT INTO CerveZetas_Pedido_Factura (cod_pedido, num_factura, fecha_factura, direccion, cliente, precio_total)
values(1, 1, SYSDATE, 1, 'mario@gmail.com', 200.4);

INSERT INTO CerveZetas_Pedido_Factura (cod_pedido, num_factura, fecha_factura, direccion, cliente, precio_total)
values(2, 2, SYSDATE, 2, 'pablon@gmail.com', 250.5);

INSERT INTO CerveZetas_Pedido_Factura (cod_pedido, num_factura, fecha_factura, direccion, cliente, precio_total)
values(3, 3, SYSDATE, 3, 'pablob@gmail.com', 270.8);



INSERT INTO CerveZetas_Pedido_Producto (cod_pedido, num_factura, producto, precio, cantidad)
values (1, 1, '1', 20.8, 12);

INSERT INTO CerveZetas_Pedido_Producto (cod_pedido, num_factura, producto, precio, cantidad)
values (2, 2, '3', 70.95, 5);

INSERT INTO CerveZetas_Pedido_Producto (cod_pedido, num_factura, producto, precio, cantidad)
values (3, 3, '3', 40.75, 2);



UPDATE CerveZetas_Usuario SET tipo_usuarios = 'Cliente' WHERE email = 'mario@gmail.com';
UPDATE CerveZetas_Direccion SET Municipio = 'Petrer', CodigoPostal = 03610 WHERE email_usuario = 'mario@gmail.com';
UPDATE CerveZetas_Producto SET admin_modifica = 'pabloverdu@admin.es' WHERE cod_producto = '3';
UPDATE CerveZetas_Marca SET nombre = 'Mohou' WHERE codigo = 003;
