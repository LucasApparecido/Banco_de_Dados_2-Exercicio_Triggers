--drop MATERIALIZED view mt_view_cliente
CREATE MATERIALIZED VIEW mt_view_cliente AS 
	select * from cliente 
	
insert into cliente(codigo_cliente,nome_cliente,endereco,cidade) values(333,'cliente teste','Rua teste','Ceres');

select * from cliente;	
select * from mt_view_cliente;
-- atualizando view materializadas
 REFRESH MATERIALIZED VIEW mt_view_cliente;
 select * from mt_view_cliente;	
 delete from cliente where nome_cliente='cliente teste'
