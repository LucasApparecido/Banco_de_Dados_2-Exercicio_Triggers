--drop function  sp_cliente_cidade(varchar(20))
CREATE OR REPLACE FUNCTION sp_cliente_cidade(
	varchar(20),
	out para varchar(20), 
	out nome varchar(50),
	out rua varchar(100),
	out cidade varchar(100)
	)
   RETURNS SETOF record
     AS 
$bloco_marcador$

SELECT 
	$1 as parametro, 
	nome_cliente,
	endereco,
	cidade 
FROM cliente 
WHERE cidade=$1

$bloco_marcador$
LANGUAGE 'sql';


-- exemplo de uso
select * from cliente
select * from sp_cliente_cidade('São Paulo')