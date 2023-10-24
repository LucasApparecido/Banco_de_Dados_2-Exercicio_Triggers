--drop view vw_pedidos
create or replace view vw_pedidos
as
select 	
	p.numero_pedido		as num_pedido,
	c.nome_cliente		as cliente,
	v.nome_vendedor		as vendedor,
	p.prazo_entrega		as parazo,
	prd.descricao_produto	as produto,
	prd.valor_unitario	as produto_valor
from 	pedido p
inner join cliente c
	on p.codigo_cliente = c.codigo_cliente
inner join vendedor v
	on  p.codigo_vendedor = v.codigo_vendedor
inner join item_do_pedido ip
	on ip.num_pedido = p.numero_pedido
inner join produto prd
	on prd.codigo_produto = ip.codigo_produto
order by p.numero_pedido,c.nome_cliente