/*José Luis Martínez Pérez*/

/*
    3 consultas de la sintaxis select básica
*/

/*1*/

Select * From CerveZetas_Usuario;

/*2*/

Select nombre, apellidos 
From CerveZetas_Usuario
Where metodo_pago = 'PayPal' AND tipo_usuarios = 'Cliente';

/*3*/

Select stock, descripcion
From CerveZetas_Producto
Where Categoria = 'Rubia' AND stock > 10;

/*
    3 consultas usando funciones SQL
*/

/*1*/

Select COUNT(*) AS total_usuarios
From CerveZetas_Usuario;

/*2*/

Select MAX(precio) precio_maximo, MIN(precio) precio_minimo
From CerveZetas_Producto 
WHERE Categoria = 'Malta';

/*3*/

SELECT c.nombre, SUM(pp.precio * pp.cantidad)  total_ventas
FROM CerveZetas_Usuario c, CerveZetas_Pedido_Factura pf, CerveZetas_Pedido_Producto pp
WHERE c.email = pf.email_cliente AND pf.cod_pedido = pp.cod_pedido AND pf.num_factura = pp.num_factura
GROUP BY c.nombre;


/*
    3 consultas usando Agrupaciones, combinaciones u operaciones de conjuntos
*/

/*1*/

SELECT Categoria, SUM(stock) stock_total
FROM CerveZetas_Producto
GROUP BY Categoria
HAVING SUM(stock) > 0;

/*2*/

SELECT u.nombre, d.Municipio
FROM CerveZetas_Usuario u, CerveZetas_Direccion d
WHERE u.email = d.email_usuario AND u.tipo_usuarios = 'Cliente'
ORDER BY u.nombre;

/*3*/

SELECT nombre
FROM CerveZetas_Marca
WHERE codigo IN (
    SELECT marca
    FROM CerveZetas_Producto
    WHERE Categoria = 'Rubia'
    UNION
    SELECT marca
    FROM CerveZetas_Producto
    WHERE Categoria = 'Malta'
)
ORDER BY nombre;

/*4*/

SELECT p.cod_producto, p.descripcion, m.nombre  marca
FROM CerveZetas_Producto p
LEFT JOIN CerveZetas_Marca m ON p.marca = m.codigo;

/*
    1 vista, un insert y un borrado o actualización desde select, en total, serán tres sentencias.
*/

/*1*/

CREATE VIEW vista_ventas AS
SELECT czp.producto, SUM(czp.cantidad) total_ventas
FROM CerveZetas_Pedido_Producto czp
GROUP BY czp.producto;

/*2*/

INSERT INTO CerveZetas_Producto (cod_producto, stock, descripcion, admin_crea, admin_modifica, fecha_mod, fecha_creacion, Categoria, Precio, TipoProducto, marca)
VALUES ('050', 50, 'Holy mantle, Alhambra Roja', 'pabloverdu@admin.es', 'pabloverdu@admin.es', SYSDATE, SYSDATE, 'Rubia', 1.25, 'Cervezas', 
(SELECT codigo FROM CerveZetas_Marca WHERE nombre = 'Alhambra'));

/*3*/

UPDATE CerveZetas_Producto
SET precio = precio * 1.5
WHERE cod_producto IN (
  SELECT cod_producto
  FROM CerveZetas_Producto
  WHERE stock > 80
);