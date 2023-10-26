-- Utilizando o banco de Dados Vendas fazer as seguintes atividades:
-- 0. Exemplo: Fazer uma função que retorno a quantidade de pedidos feitos por um vendedor
-- (nome da função: vendedor_quantidade_pedidos)
CREATE
OR REPLACE FUNCTION vendedor_quantidade_pedidos(smallint) returns bigint as $ codigo $
select
  count(p.*) as total
from
  vendedor v
  inner join pedido p on p.codigo_vendedor = v.codigo_vendedor
where
  v.codigo_vendedor = $ 1
group by
  v.codigo_vendedor $ codigo $ LANGUAGE 'sql';

--1. Fazer uma função que retorne o valor total de um pedido passando o número do pedido.
--(nome da função: total_pedidos)
CREATE OR REPLACE FUNCTION total_pedidos(p_numero_pedido int) RETURNS NUMERIC(10,2) AS
$$
DECLARE
  v_total NUMERIC(10,2);
BEGIN
  SELECT sum(p.valor_unitario * ip.quantidade) INTO v_total
  FROM item_do_pedido ip
  INNER JOIN produto p ON ip.codigo_produto = p.codigo_produto
  WHERE ip.num_pedido = p_numero_pedido;

  RETURN COALESCE(v_total, 0);
END;
$$ LANGUAGE plpgsql;

--3. Alterar a tabela de produto adicionando a coluna quantidade_em_estoque do tipo smallint;
ALTER TABLE produto ADD COLUMN quantidade_em_estoque smallint;

--5. Fazer uma função que retorno a quantidade de clientes que já compraram um determinado produto (passando o código do produto como parâmetro) (nome da função: produto_quantidade_clientes)
CREATE OR REPLACE FUNCTION produto_quantidade_clientes(p_codigo_produto int) RETURNS bigint AS
$$
DECLARE
  v_total bigint;
BEGIN
  SELECT count(DISTINCT p.codigo_cliente) INTO v_total
  FROM pedido p
  INNER JOIN item_do_pedido ip ON p.numero_pedido = ip.num_pedido
  WHERE ip.codigo_produto = p_codigo_produto;

  RETURN COALESCE(v_total, 0);
END;
$$ LANGUAGE plpgsql;

--7. Fazer uma trigger para ser disparada após a remoção de uma linha na tabela "item_do_pedido" 
--para atualizar a quantidade na tabela de produto(coluna quantidade_em_estoque).
CREATE OR REPLACE FUNCTION atualiza_quantidade_em_estoque() RETURNS TRIGGER AS
$$
BEGIN
  UPDATE produto
  SET quantidade_em_estoque = quantidade_em_estoque + OLD.quantidade
  WHERE codigo_produto = OLD.codigo_produto;

  RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER after_delete_item_do_pedido
AFTER DELETE ON item_do_pedido
FOR EACH ROW
EXECUTE FUNCTION atualizar_quantidade_em_estoque_delete();

--9. adicionar a coluna valor_total_pedido (do tipo numeric(10,2) ) na tabela pedido.
ALTER TABLE pedido ADD COLUMN valor_total_pedido NUMERIC(10,2);

--12. Fazer uma procedure(function sem retorno) que remova um pedido, a procedure deve receber como parametro o número do pedido
--Rodar a select * from produtos antes de executar a procedure e após execução.

CREATE OR REPLACE FUNCTION remover_pedido(p_numero_pedido int) RETURNS void AS
$$
BEGIN
  DELETE FROM item_do_pedido WHERE num_pedido = p_numero_pedido;
  DELETE FROM pedido WHERE numero_pedido = p_numero_pedido;
END;
$$ LANGUAGE plpgsql;

