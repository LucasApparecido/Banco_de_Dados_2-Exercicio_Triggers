create or replace view detalhe_pedido as
select 
	c.nome_cliente, 
	c.cidade, 
	p.numero_pedido, 
	pd.codigo_produto, 
	pd.descricao_produto as produto,
	pd.valor_unitario,
	ip.quantidade,
	ip.quantidade * pd.valor_unitario as total_produto
from cliente c
inner join pedido p 
	on p.codigo_cliente = c.codigo_cliente
inner join item_do_pedido ip
	ON ip.num_pedido = p.numero_pedido
inner join produto pd 
	on pd.codigo_produto = ip.codigo_produto;
	
	
select * from detalhe_pedido where numero_pedido=121