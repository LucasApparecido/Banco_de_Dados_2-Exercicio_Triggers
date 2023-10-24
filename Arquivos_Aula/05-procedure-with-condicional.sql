
CREATE or replace FUNCTION condicional(integer) 
RETURNS varchar(200) AS $codigo$
BEGIN
        -- Check that empname and salary are given
        IF $1 IS NULL THEN
            RAISE EXCEPTION 'valor não foi informado';
        END IF;                

	IF ($1 < 10 ) THEN
		return 'valor menor que dez';
	ELSIF ($1 <= 20) THEN
		return 'valor menor ou igual 20';
	Else
		Return 'valor maior que 20';
	END IF;

END
$codigo$
 LANGUAGE plpgsql;
 
 --
CREATE or replace FUNCTION valor_frete(integer) 
RETURNS float AS $codigo$
BEGIN
        -- Check that empname and salary are given
        IF $1 IS NULL THEN
            RAISE EXCEPTION 'prazo não foi informado';
        END IF;                

	IF ($1 < 10 ) THEN
		return 0.0;
	ELSIF ($1 <= 20) THEN
		return 20.5;
	Else
		Return 1.5*$1;
	END IF;

END
$codigo$
 LANGUAGE plpgsql;

 -- testando a função
select condicional(null)
select condicional(2) 
select condicional(20)
select condicional(10)

select prazo_entrega,condicional(d.prazo_entrega), valor_frete(d.prazo_entrega) as frete ,d.* 
from pedido d
-- verificando as linguagens disponíveis.
select * from pg_language
-- criando uma linguagem suportada
create language 'shell'


-- variável para visualizar usuário atualmente logado.
select  current_user