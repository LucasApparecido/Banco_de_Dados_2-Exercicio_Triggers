-- Utilizando o banco de Dados Vendas fazer as seguintes atividades:

-- 0. Exemplo: Fazer uma função que retorno a quantidade de pedidos feitos por um vendedor
-- (nome da função: vendedor_quantidade_pedidos)

CREATE OR REPLACE FUNCTION vendedor_quantidade_pedidos(smallint) returns bigint as $codigo$
  select count(p.*) as total from vendedor v
  inner join pedido p
    on p.codigo_vendedor = v.codigo_vendedor
  where v.codigo_vendedor=$1
  group by v.codigo_vendedor
  $codigo$ LANGUAGE 'sql';

--1. Fazer uma função que retorne o valor total de um pedido passando o número do pedido.
--(nome da função: total_pedidos)

CREATE OR REPLACE FUNCTION total_pedidos(float) returns float as total
    

--3. Alterar a tabela de produto adicionando a coluna quantidade_em_estoque do tipo smallint;

--5. Fazer uma função que retorno a quantidade de clientes que já compraram um determinado produto 
--(passando o código do produto como parâmetro) (nome da função: produto_quantidade_clientes)

--7. Fazer uma trigger para ser disparada após a remoção de uma linha na tabela "item_do_pedido" 
--para atualizar a quantidade na tabela de produto(coluna quantidade_em_estoque).

--9. adicionar a coluna valor_total_pedido (do tipo numeric(10,2) ) na tabela pedido.

--11. Fazer uma dml para inserir 5 pedidos completos(pedido e item_do_pedido(pelo menos 3 itens))
--Rodar a sql select * from pedidos, e select * from produtos antes de inserir os pedidos e após cada inserção.
