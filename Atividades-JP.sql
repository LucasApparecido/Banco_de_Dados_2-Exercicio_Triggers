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

--2. Fazer uma função que retorne a quantidades de pedidos realizados por um cliente(passando o código do cliente como parâmetro)
--(nome da função: cliente_quantidade_pedidos)

--4. Alterar o valor da quantidade_em_estoque de todos os produtos para 40;

--6. Fazer uma trigger para ser disparada após a inserção de uma linha na tabela "item_do_pedido" para atualizar a 
--quantidade na tabela de produto(coluna quantidade_em_estoque).

--(Referencia para ajudar: http://www.postgresql.org/docs/9.3/static/plpgsql-trigger.html)

--8. Fazer uma trigger para ser disparada após a alteração de uma linha na tabela "item_do_pedido" para atualizar 
--a quantidade na tabela de produto(coluna quantidade_em_estoque).

--10. Fazer uma trigger para ser disparada após a inclusão, remoção e alteração na tabela "item_do_pedido" 
--para atualizar o valor total do pedido na tabela pedido(coluna valor_total_pedido). 

--11. Fazer uma dml para inserir 5 pedidos completos(pedido e item_do_pedido(pelo menos 3 itens))
--Rodar a sql select * from pedidos, e select * from produtos antes de inserir os pedidos e após cada inserção.