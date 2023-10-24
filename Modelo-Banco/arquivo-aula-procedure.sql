CREATE OR REPLACE FUNCTION sp_clienteAnapolis()
	RETURNS SETOF cliente AS 
$bloco_marcador$
	SELECT * FROM cliente WHERE cidade in ('Anápolis', 'Anapolis')
$bloco_marcador$ 
LANGUAGE 'sql';

select * from sp_clienteAnapolis();

--exemplo de function com parâmetro.
CREATE OR REPLACE FUNCTION sp_cliente_cidade(varchar(20))
RETURNS SETOF cliente AS $bloco_marcador$
	SELECT * FROM cliente WHERE cidade=$1
$bloco_marcador$
LANGUAGE 'sql';

-- 
select * from sp_cliente_cidade('Belo Horizonte')
